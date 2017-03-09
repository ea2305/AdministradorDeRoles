package edu.uag.iidis.scec.control;

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

import edu.uag.iidis.scec.servicios.ManejadorEstados;
import edu.uag.iidis.scec.vista.FormaNuevoEstado;
import edu.uag.iidis.scec.modelo.Estado;

public final class MCURegistrarEstado extends MappingDispatchAction {

    private final Log log = LogFactory.getLog(MCURegistrarUsuario.class);
    
    public ActionForward solicitarRegistroEstado(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug(">solicitarRegistroEstado");
            
        }
        
        return mapping.findForward("exito");
        
    }

    public ActionForward procesarRegistroEstado(ActionMapping mapping, ActionForm form,
                HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> procesarRegistroEstado");
            
        }
        
        if (isCancelled(request)) {
            
            if (this.log.isDebugEnabled()) {
                
                this.log.debug("< La acción fue cancelada");
                
            }
            
            return mapping.findForward("cancelar");
            
        }
        
        FormaNuevoEstado formaNuevoEstado = (FormaNuevoEstado) form;
        
        Estado estado = new Estado(formaNuevoEstado.getNombre(), formaNuevoEstado.getDescripcion());
        
        ManejadorEstados manejadorEstados = new ManejadorEstados();
        
        int resultado = manejadorEstados.crearEstado(estado);
        
        ActionMessages errores = new ActionMessages();
        
        switch (resultado) {
        
            case 0:
                
                return mapping.findForward("exito");

            case 1:
                
                errores.add(
                        ActionMessages.GLOBAL_MESSAGE, 
                        new ActionMessage("errors.nombreEstadoYaExiste", 
                        formaNuevoEstado.getNombre())
                );
                
                saveErrors(request, errores);
                
                return mapping.getInputForward();

            case 3:
                
                this.log.error("Ocurrió un error de infraestructura");
                
                errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.infraestructura"));
                
                saveErrors(request, errores);
                
                return mapping.getInputForward();
                
            default:
                
                this.log.warn("ManejadorUsuario.crearUsuario regresó reultado inesperado");
                
                errores.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.infraestructura"));
                
                saveErrors(request, errores);
                
                return mapping.getInputForward();
                
        }
        
    }
    
}