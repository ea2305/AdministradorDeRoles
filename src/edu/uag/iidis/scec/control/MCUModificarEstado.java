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
import edu.uag.iidis.scec.modelo.Estado;
import edu.uag.iidis.scec.vista.FormaModificarEstado;

public final class MCUModificarEstado extends MappingDispatchAction {

    private final Log log = LogFactory.getLog(MCURegistrarUsuario.class);
    
    public ActionForward solicitarModificarEstado(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug(">solicitarModificarEstado");
            
        }
        
        return mapping.findForward("exito");
        
    }

    public ActionForward procesarModificarEstado(ActionMapping mapping, ActionForm form,
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
        
        FormaModificarEstado formaModificarEstado = (FormaModificarEstado) form;
        
        System.out.println(formaModificarEstado);
        
        Estado estado = new Estado(formaModificarEstado.getNombre(), formaModificarEstado.getDescripcion());
        
        estado.setId(formaModificarEstado.getId());
        
        ManejadorEstados manejadorEstados = new ManejadorEstados();
        
        manejadorEstados.modificarEstado(estado);
        
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