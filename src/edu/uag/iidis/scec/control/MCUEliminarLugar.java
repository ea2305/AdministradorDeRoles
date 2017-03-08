/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uag.iidis.scec.control;

import edu.uag.iidis.scec.vista.*;
import edu.uag.iidis.scec.servicios.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

/**
 *
 * @author gerem
 */

public final class MCUEliminarLugar extends MappingDispatchAction {
    
    private final Log log = LogFactory.getLog( MCURegistrarUsuario.class );

    public ActionForward procesarEliminarLugar(ActionMapping mapping, ActionForm form, 
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (log.isDebugEnabled()) {
            log.debug(" > procesarEliminarRol");
        }
      
        FormaEliminarLugar formaEliminarLugar = (FormaEliminarLugar) form;
        
        ManejadorLugares manejadorLugares = new ManejadorLugares();
        
        manejadorLugares.eliminarLugar(formaEliminarLugar.getId());
        
        return mapping.findForward("exito");
    }
    
}