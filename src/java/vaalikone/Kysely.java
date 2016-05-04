/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vaalikone;

import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persist.Ehdokkaat;
import persist.Kysymykset;
import persist.Vastaukset;

/**
 *
 * @author vivesanto
 */
public class Kysely implements Moduuli {

    private Kayttaja usr;
    private EntityManager em;
    private Logger logger;
    
    @Override
    public void ajaModuuli(HttpServletRequest request, HttpServletResponse response, Vaalikone vaalikone) throws ServletException, IOException {
        
        int kysymys_id;

        //hae parametrinä tuotu edellisen kysymyksen nro
        String strKysymys_id = request.getParameter("q");

        //hae parametrina tuotu edellisen kysymyksen vastaus
        String strVastaus = request.getParameter("vastaus");

        usr = vaalikone.getUsr();
        em = vaalikone.getEm();
        logger = Vaalikone.getLogger();
        
        // Jos kysymyksen numero (kysId) on asetettu, haetaan tuo kysymys
        // muuten haetaan kysnro 1
        if (strKysymys_id == null) {
            kysymys_id = 1;
        } else {
            kysymys_id = parseInt(strKysymys_id);
            //jos vastaus on asetettu, tallenna se session käyttäjä-olioon
            if (strVastaus != null) {
                usr.addVastaus(kysymys_id, parseInt(strVastaus));
            }

            //määritä seuraavaksi haettava kysymys
            kysymys_id++;
        }

        //jos kysymyksiä on vielä jäljellä, hae seuraava
        if (kysymys_id < 20) {
            try {
                //Hae haluttu kysymys tietokannasta
                Query q = em.createQuery(
                        "SELECT k FROM Kysymykset k WHERE k.kysymysId=?1");
                q.setParameter(1, kysymys_id);
                //Lue haluttu kysymys listaan
                List<Kysymykset> kysymysList = q.getResultList();
                request.setAttribute("kysymykset", kysymysList);
                request.getRequestDispatcher("/vastaus.jsp")
                        .forward(request, response);

            } finally {
                // Sulje tietokantayhteys
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                em.close();
            }

            //jos kysymykset loppuvat, lasketaan tulos!
        } else {

            //Tyhjennetään piste-array jotta pisteet eivät tuplaannu mahdollisen refreshin tapahtuessa
            for (int i = 0; i < 20; i++) {
                usr.pisteet.set(i, new Tuple<>(0, 0));
            }

            //Hae lista ehdokkaista
            Query qE = em.createQuery(
                    "SELECT e.ehdokasId FROM Ehdokkaat e");
            List<Integer> ehdokasList = qE.getResultList();

            //iteroi ehdokaslista läpi
            for (int i = 1; i < ehdokasList.size(); i++) {

                //Hae lista ehdokkaiden vastauksista
                Query qV = em.createQuery(
                        "SELECT v FROM Vastaukset v WHERE v.vastauksetPK.ehdokasId=?1");
                qV.setParameter(1, i);
                List<Vastaukset> vastausList = qV.getResultList();

                //iteroi vastauslista läpi
                for (Vastaukset eVastaus : vastausList) {
                    int pisteet;

                    //hae käyttäjän ehdokaskohtaiset pisteet
                    pisteet = usr.getPisteet(i);

                    //laske oman ja ehdokkaan vastauksen perusteella pisteet 
                    pisteet += laskePisteet(usr.getVastaus(i), eVastaus.getVastaus());

                    logger.log(Level.INFO, "eID: {0} / k: {1} / kV: {2} / eV: {3} / p: {4}", new Object[]{i, eVastaus.getVastauksetPK().getKysymysId(), usr.getVastaus(i), eVastaus.getVastaus(), pisteet});
                    usr.addPisteet(i, pisteet);
                }

            }

            //siirrytään hakemaan paras ehdokas
            vaalikone.setStrFunc("haeEhdokas");
        }
        
        //jos func-arvo on haeEhdokas, haetaan haluttu henkilö käyttäjälle sopivimmista ehdokkaista
        if ("haeEhdokas".equals(vaalikone.getStrFunc())) {
            //luetaan url-parametristä "top-listan järjestysnumero". Jos ei määritelty, haetaan PARAS vaihtoehto.
            String strJarjestysnumero = request.getParameter("numero");
            Integer jarjestysnumero = 0;
            if (strJarjestysnumero != null) {
                jarjestysnumero = Integer.parseInt(strJarjestysnumero);
            }

            //Lue käyttäjälle sopivimmat ehdokkaat väliaikaiseen Tuple-listaan.
            List<Tuple<Integer, Integer>> tpl = usr.haeParhaatEhdokkaat();

            //hae määritetyn ehdokkaan tiedot
            Query q = em.createQuery(
                    "SELECT e FROM Ehdokkaat e WHERE e.ehdokasId=?1");
            q.setParameter(1, tpl.get(jarjestysnumero).ehdokasId);
            List<Ehdokkaat> parasEhdokas = q.getResultList();

            //hae ko. ehdokkaan vastaukset
            q = em.createQuery(
                    "SELECT v FROM Vastaukset v WHERE v.vastauksetPK.ehdokasId=?1");
            q.setParameter(1, tpl.get(jarjestysnumero).ehdokasId);
            List<Vastaukset> parhaanEhdokkaanVastaukset = q.getResultList();

            //hae kaikki kysymykset
            q = em.createQuery(
                    "SELECT k FROM Kysymykset k");
            List<Kysymykset> kaikkiKysymykset = q.getResultList();
            
            //ohjaa tiedot tulosten esityssivulle
            request.setAttribute("kaikkiKysymykset", kaikkiKysymykset);
            request.setAttribute("kayttajanVastaukset", usr.getVastausLista());
            request.setAttribute("parhaanEhdokkaanVastaukset", parhaanEhdokkaanVastaukset);
            request.setAttribute("parasEhdokas", parasEhdokas);
            request.setAttribute("pisteet", tpl.get(jarjestysnumero).pisteet);
            request.setAttribute("jarjestysnumero", jarjestysnumero);
            request.getRequestDispatcher("/tulokset.jsp")
                    .forward(request, response);

            // Sulje tietokantayhteys
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            em.close();
        }
    }

    private Integer laskePisteet(Integer kVastaus, Integer eVastaus) {
        int pisteet = 0;
        if (kVastaus - eVastaus == 0) {
            pisteet = 3;
        }
        if (kVastaus - eVastaus == 1 || kVastaus - eVastaus == -1) {
            pisteet = 2;
        }
        if (kVastaus - eVastaus == 2 || kVastaus - eVastaus == -2 || kVastaus - eVastaus == 3 || kVastaus - eVastaus == -3) {
            pisteet = 1;
        }

        //if (kVastaus - eVastaus == 4 || kVastaus - eVastaus == -4) pisteet = 0;
        return pisteet;
    }
}
