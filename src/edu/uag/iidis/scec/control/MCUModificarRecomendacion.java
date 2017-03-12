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
import edu.uag.iidis.scec.modelo.Pais;
import edu.uag.iidis.scec.modelo.Recomendacion;
import edu.uag.iidis.scec.vista.FormaModificarPais;
import edu.uag.iidis.scec.vista.FormaModificarRecomendacion;


/**
 *
 * @author gerem
 */
public final class MCUModificarRecomendacion extends MappingDispatchAction {
    
    private final Log log = LogFactory.getLog(MCURegistrarUsuario.class);

    public ActionForward solicitarModificarRecomendacion(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (this.log.isDebugEnabled()) {

            this.log.debug(">solicitarModificarEstado");

        }

        return mapping.findForward("exito");

    }

    public ActionForward procesarModificarRecomendacion(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (this.log.isDebugEnabled()) {

            this.log.debug("> procesarModificarPais");

        }

        if (isCancelled(request)) {

            if (this.log.isDebugEnabled()) {

                this.log.debug("< La acción fue cancelada");

            }

            return mapping.findForward("cancelar");

        }

        FormaModificarRecomendacion formaModificarRecomendacion = (FormaModificarRecomendacion) form;

/*
   String nombre,String estado, String usuario,String fecha,String comentario,Long calificacion

        */
        
        Recomendacion recomendacion = new Recomendacion(
                formaModificarRecomendacion.getNombre(), 
                formaModificarRecomendacion.getEstado(),
                formaModificarRecomendacion.getUsuario(),
                formaModificarRecomendacion.getFecha(),
                formaModificarRecomendacion.getComentario(),
                formaModificarRecomendacion.getCalificacion()
        );

        recomendacion.setId(recomendacion.getId());

        ManejadorRecomendaciones manejadorRecomendaciones = new ManejadorRecomendaciones();

        manejadorRecomendaciones.modificarRecomendacion(recomendacion);

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