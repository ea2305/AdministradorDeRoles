/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uag.iidis.scec.control.ajax;

import com.google.gson.Gson;
import edu.uag.iidis.scec.modelo.Lugar;
import edu.uag.iidis.scec.servicios.ManejadorEstados;
import edu.uag.iidis.scec.servicios.ManejadorLugares;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VakSF
 */
public class EstadoServlet extends HttpServlet {

    public static ManejadorEstados manejadorEstados;
    public static ManejadorLugares manejadorLugares;

    @Override
    public void init() throws ServletException {
        
        super.init();
        
        if (EstadoServlet.manejadorEstados == null) {
            
            EstadoServlet.manejadorEstados = new ManejadorEstados();
            
        }
        
        if (EstadoServlet.manejadorLugares == null) {
            
            EstadoServlet.manejadorLugares = new ManejadorLugares();
            
        }
        
    }
    
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
        
        PrintWriter out = response.getWriter();
        
        response.setContentType("application/json");
        
        String action = request.getParameter("action");
        
        if (action != null) {
            
            if (action.equalsIgnoreCase("getLugares")) {
                
                String name = request.getParameter("name");
                
                System.out.println("Nombre = " + name + "....");
                
                System.out.println(manejadorLugares == null);
                
                Collection listarLugares = EstadoServlet.manejadorLugares.buscaEstado(name);
                
                System.out.println("Cantidad de lugares: " + listarLugares.size());
                
                String toReturn = "";
                
                for (Object lugarList : listarLugares) {
                    
                    Lugar lugar = (Lugar) lugarList;
                    
                    toReturn += 
                            "<li>" +
                                "<img src=\"http://lorempixel.com/580/250/nature/1\"/>\n" +
                                "<div class=\"caption center-align\">\n" +
                                    "<h3>Conoce " + lugar.getNombre() + "</h3>\n" +
                                    "<h5 class=\"truncate light grey-text text-lighten-3\">\n" +
                                        lugar.getDescripcion() +
                                    "</h5>" +
                                "</div>" +
                            "</li>";
                            
                    
                }

                out.print(toReturn);
                
            } else {
                
                if (action.equalsIgnoreCase("getEstados")) {
                    
                    Collection listarEstados = manejadorEstados.listarEstados();
        
                    String json = new Gson().toJson(listarEstados);

                    System.out.println(json);

                    out.print(json);
                    
                }
                
            }
            
        }
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
