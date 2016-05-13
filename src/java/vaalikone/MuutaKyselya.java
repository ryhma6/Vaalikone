/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vaalikone;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import persist.Kysymykset;

/**
 *
 * @author Tomi Vesanen
 */
public class MuutaKyselya implements Moduuli {

    private Kayttaja usr;
    private EntityManager em;
    private Logger logger;

    @Override
    public void ajaModuuli(HttpServletRequest request, HttpServletResponse response, Vaalikone vaalikone) throws ServletException, IOException {

        // Haetaan Vaalikoneeseen tallennetut Käyttäjä, EntityManager ja Logger
        usr = vaalikone.getUsr();
        em = vaalikone.getEm();
        logger = Logger.getLogger(Loki.class.getName());

        //hae parametrina tuotu edellisen kysymyksen vastaus
        String strUusikysymys = request.getParameter("uusikyssari");
        
        //Kysymyksen id
        String poistakysymysid = request.getParameter("kyssaripoistaid");

             //hae kaikki kysymykset
            Query q = em.createQuery(
                    "SELECT k FROM Kysymykset k");
            List<Kysymykset> kaikkiKysymykset = q.getResultList();
            request.setAttribute("kaikkiKysymykset", kaikkiKysymykset);

         //Tarkastetaan listan pituus
        Query qT = em.createQuery("SELECT COUNT(t) FROM Kysymykset t");
        long max_id = Vaalikone.getLastId(vaalikone, "Kysymykset");
        
       if(poistakysymysid != null){
                  int intkysymysid = Integer.parseInt(poistakysymysid);
                  //Poistetaan kysymys id perusteella  
                Kysymykset poistakys = em.find(Kysymykset.class, intkysymysid);
                em.getTransaction().begin();
                 em.remove(poistakys);
                 em.flush();
                em.getTransaction().commit();
                
                /*
                for(int i = intkysymysid + 1; i <= (int)max_id; i++){
                 poistakys = em.find(Kysymykset.class, i);
                 poistakys.setKysymysId(poistakys.getKysymysId()-1);
                 em.getTransaction().begin();
                 em.refresh(poistakys);
                 em.flush();
                em.getTransaction().commit();
                }
                */
                
                if (em.getTransaction()
                        .isActive()) {
                    em.getTransaction().rollback();
                }

                em.close();
           
                     request.getRequestDispatcher("/muuta_onnistui.jsp")
                    .forward(request, response);
       }
        
        
        if (strUusikysymys == null || strUusikysymys == "" || strUusikysymys == " ") {
            
            request.getRequestDispatcher("/muuta.jsp")
                    .forward(request, response);

        } else if(strUusikysymys != null) {
            try {
                Kysymykset kys = new Kysymykset((int)max_id + 1);
                kys.setKysymys(strUusikysymys);
                em.getTransaction().begin();
                em.persist(kys);
                em.getTransaction().commit();
            } catch (EJBException e) {
                @SuppressWarnings("ThrowableResultIgnored")
                Exception cause = e.getCausedByException();
                if (cause instanceof ConstraintViolationException) {
                    @SuppressWarnings("ThrowableResultIgnored")
                    ConstraintViolationException cve = (ConstraintViolationException) e.getCausedByException();
                    for (Iterator<ConstraintViolation<?>> it = cve.getConstraintViolations().iterator(); it.hasNext();) {
                        ConstraintViolation<? extends Object> v = it.next();
                        logger.log(Level.FINE, v.toString());
                        logger.log(Level.FINE, "==>>{0}", v.getMessage());
                    }
                }
            } finally {

                if (em.getTransaction()
                        .isActive()) {
                    em.getTransaction().rollback();
                }

                em.close();
            }

            request.getRequestDispatcher(
                    "/muuta_onnistui.jsp")
                    .forward(request, response);
        }


    }
}
