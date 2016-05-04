/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vaalikone;

import java.io.IOException;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tomi Vesanen
 */
public interface Moduuli {
    /**
     * Ajaa moduulin kuten vanha Vaalikone.java, mutta erikseen
     *
     * @param request servlet request
     * @param response servlet response
     * @param vaalikone Vaalikone referenssi
     */
    public void ajaModuuli(HttpServletRequest request, HttpServletResponse response, Vaalikone vaalikone) throws ServletException, IOException;
}
