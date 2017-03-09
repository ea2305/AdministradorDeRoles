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
import edu.uag.iidis.scec.modelo.Rol;
import edu.uag.iidis.scec.vista.FormaModificarRol;


/**
 *
 * @author gerem
 */
public final class MCUModificarRol extends MappingDispatchAction {
    
    private final Log log = LogFactory.getLog(MCURegistrarUsuario.class);

    public ActionForward solicitarModificarRol(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (this.log.isDebugEnabled()) {

            this.log.debug(">solicitarModificarEstado");

        }

        return mapping.findForward("exito");

    }

    public ActionForward procesarModificarRol(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {

        System.out.println("Im here");

        if (this.log.isDebugEnabled()) {

            this.log.debug("> procesarModificarRol");

        }

        if (isCancelled(request)) {

            if (this.log.isDebugEnabled()) {

                this.log.debug("< La acción fue cancelada");

            }

            return mapping.findForward("cancelar");

        }

        FormaModificarRol formaModificarRol = (FormaModificarRol) form;

        System.out.println(formaModificarRol);

        Rol rol = new Rol(
                formaModificarRol.getNombre(),
                formaModificarRol.getDescripcion()
        );

        rol.setId( formaModificarRol.getId() );

        ManejadorRoles manejadorRoles = new ManejadorRoles();

        manejadorRoles.modificarRol( rol );

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