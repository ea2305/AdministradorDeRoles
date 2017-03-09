/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uag.iidis.scec.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

import edu.uag.iidis.scec.servicios.*;
import edu.uag.iidis.scec.modelo.Lugar;
import edu.uag.iidis.scec.vista.FormaModificarLugar;

/**
 *
 * @author gerem
 */
public class MCUModificarLugar extends MappingDispatchAction {

    private final Log log = LogFactory.getLog(MCURegistrarUsuario.class);
    
    public ActionForward solicitarModificarLugar(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug(">solicitarModificarEstado");
            
        }
        
        return mapping.findForward("exito");
        
    }

    public ActionForward procesarModificarLugar(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        System.out.println("Im here");
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> procesarModificarEstado");
            
        }
        
        if (isCancelled(request)) {
            
            if (this.log.isDebugEnabled()) {
                
                this.log.debug("< La acción fue cancelada");
                
            }
            
            return mapping.findForward("cancelar");
            
        }
        
        FormaModificarLugar formaModificarLugar = (FormaModificarLugar) form;
        
        System.out.println(formaModificarLugar);
        //Lugar(String nombre, String descripcion,Long poblacion,String coordenadas,String estado, String imagen, String pais, String moneda);
        Lugar lugar = new Lugar( 
                formaModificarLugar.getNombre() ,
                formaModificarLugar.getDescripcion() , 
                formaModificarLugar.getPoblacion() , 
                formaModificarLugar.getCoordenadas(),
                formaModificarLugar.getEstado(),
                null,
                formaModificarLugar.getPais(),
                formaModificarLugar.getMoneda()
        );
        
        lugar.setId(formaModificarLugar.getId());
        
        //ManejadorEstados manejadorEstados = new ManejadorEstados();
        ManejadorLugares manejadorLugares = new ManejadorLugares();
        
        //manejadorEstados.modificarEstado(estado);
        manejadorLugares.modificarLugar( lugar );
        ActionMessages errores = new ActionMessages();
        
        return mapping.findForward("exito");
        
//        if (modificado) {
//            
//            
//        } else {
//            
//            this.log.error("Ocurrió un error de infraestructura");
//                
//            errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.infraestructura"));
//
//            saveErrors(request, errores);
//
//            return mapping.getInputForward();
//            
//        }
        
    }
}
