/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vaalikone;

import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persist.Ehdokkaat;
import persist.Kysymykset;
import persist.Vastaukset;

/**
 * Vaalikone-servlet, vastaa vaalikoneen varsinaisesta toiminnallisuudesta
 *
 * @author Jonne
 */
public class Vaalikone extends HttpServlet {

    //hae java logger-instanssi
    private final static Logger logger = Logger.getLogger(Loki.class.getName());

    public static Logger getLogger() {
        return logger;
    }

    private Kayttaja usr;
    private HttpSession session;
    private EntityManager em;
    private String strFunc;

    private Kysely kysely = new Kysely();
    private EhdokasKysely ehdkysely = new EhdokasKysely();
    private MuutaKyselya muutakysely = new MuutaKyselya();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int kysymys_id;

        // hae http-sessio ja luo uusi jos vanhaa ei ole vielä olemassa
        setSession(request.getSession(true));

        //hae käyttäjä-olio http-sessiosta
        setUsr((Kayttaja) session.getAttribute("usrobj"));

        //jos käyttäjä-oliota ei löydy sessiosta, luodaan sinne sellainen
        if (usr == null) {
            setUsr(new Kayttaja());
            logger.log(Level.FINE, "Luotu uusi käyttäjä-olio");
            session.setAttribute("usrobj", usr);
        }

        // Hae tietokanta-yhteys contextista
        EntityManagerFactory emf
                = (EntityManagerFactory) getServletContext().getAttribute("emf");
        setEm(emf.createEntityManager());

        //hae url-parametri func joka määrittää toiminnon mitä halutaan tehdä.
        //func=haeEhdokas: hae tietyn ehdokkaan tiedot ja vertaile niitä käyttäjän vastauksiin
        //Jos ei määritelty, esitetään kysymyksiä.
        setStrFunc(request.getParameter("func"));

        if (strFunc == null) {
            //Kysely -moduuli hoitaa peruskäyttäjän kyselyn
            logger.log(Level.FINE, "Painettu perus kysely -nappia");
            kysely.ajaModuuli(request, response, this);
        } else if (strFunc.equals("ehdkys")) {
            logger.log(Level.FINE, "Painettu ehdokaskysely -nappia");
            ehdkysely.ajaModuuli(request, response, this);
        } else if (strFunc.equals("muutakysely")) {
            logger.log(Level.FINE, "Painettu kyselyn muutos -nappia");
            muutakysely.ajaModuuli(request, response, this);
        }
    }

    //<editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Kayttaja getUsr() {
        return usr;
    }

    public void setUsr(Kayttaja usr) {
        this.usr = usr;
    }

    public HttpSession getSession() {
        return session;
    }

    public void setSession(HttpSession session) {
        this.session = session;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public String getStrFunc() {
        return strFunc;
    }

    public void setStrFunc(String strFunc) {
        this.strFunc = strFunc;
    }

    public static Long getLastId(Object vaalikoneObj, String tableName) {
        Vaalikone vaalikone = Vaalikone.class.cast(vaalikoneObj);
        EntityManager em = vaalikone.getEm();
        Query qT = em.createQuery("SELECT COUNT(t) FROM " + tableName + " t");
        Long count = (Long)qT.getSingleResult();

        // Sulje tietokantayhteys
        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
        }
        em.close();

        return count;
    }
}
