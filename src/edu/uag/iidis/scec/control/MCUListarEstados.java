package edu.uag.iidis.scec.control;

import edu.uag.iidis.scec.vista.*;
import edu.uag.iidis.scec.servicios.*;

import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;

public final class MCUListarEstados extends MappingDispatchAction {
    
    private final Log log = LogFactory.getLog(MCURegistrarUsuario.class);
    
    public ActionForward solicitarListarEstados(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> solicitarListarEstados");
            
        }

        if (isCancelled(request)) {
            
            if (this.log.isDebugEnabled()) {
                
                this.log.debug("< La acción fue cancelada");
            }
            
            return mapping.findForward("cancelar");
            
        }

        FormaListadoEstados formaListadoEstados = (FormaListadoEstados)form;

        ManejadorEstados manejadorEstados = new ManejadorEstados();
        
        Collection collection = manejadorEstados.listarEstados();

        ActionMessages errores = new ActionMessages();
        
        if (collection != null) {
            
            if (collection.isEmpty()) {
                
                errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.registroVacio"));
                
                saveErrors(request, errores);
                
            } else {
                
                formaListadoEstados.setEstados(collection);
                
            }
            
            return mapping.findForward("exito");
            
        } else {
            
            this.log.error("Ocurrió un error de infraestructura");
            
            errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.infraestructura"));                
            
            saveErrors(request, errores);
            
            return mapping.findForward("fracaso");
        }
        
    }
	
    public ActionForward buscarEstado(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> solicitarListarEstados");
            
        }
        
        if (isCancelled(request)) {
            
            if (this.log.isDebugEnabled()) {
                
                this.log.debug("<La acción fue cancelada");
                
            }
            
            return mapping.findForward("cancelar");
            
        }

        FormaListadoEstados formaListadoEstados = (FormaListadoEstados) form;

        ManejadorEstados manejadorEstados = new ManejadorEstados();
        
        Collection collection = manejadorEstados.listarEstadoPorNombre(formaListadoEstados.getNombre());
        
        this.log.debug("Resultado: " + collection);
        
        ActionMessages errores = new ActionMessages();
        
        if (collection != null) {
            
            if (collection.isEmpty()) {
                
                errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.registroVacio"));
                
                saveErrors(request, errores);
                
            } else {
                
                formaListadoEstados.setEstados( collection );
                
            }
            
            return mapping.findForward("exito");
            
        } else {
            
            this.log.error("Ocurrió un error de infraestructura");
            
            errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.infraestructura"));
            
            saveErrors(request, errores);
            
            return mapping.findForward("fracaso");
            
        }
        
    }
    
}