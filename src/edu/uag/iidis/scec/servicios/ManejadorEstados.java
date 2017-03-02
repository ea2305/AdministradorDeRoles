package edu.uag.iidis.scec.servicios;

import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.uag.iidis.scec.modelo.Estado;
import edu.uag.iidis.scec.excepciones.*;
import edu.uag.iidis.scec.persistencia.EstadoDAO;
import edu.uag.iidis.scec.persistencia.hibernate.*;

public class ManejadorEstados {
    
    private final Log log = LogFactory.getLog(ManejadorEstados.class);
    
    private final EstadoDAO estadoDAO;

    public ManejadorEstados() {
        
        this.estadoDAO = new EstadoDAO();
        
    }
    
    public Collection listarEstados() {
        
        Collection resultado;

        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> guardarUsuario(usuario)");
            
        }

        try {
            
            HibernateUtil.beginTransaction();
            
            resultado = this.estadoDAO.buscarTodos();
            
            HibernateUtil.commitTransaction();
            
            return resultado;         
            
        } catch (ExcepcionInfraestructura e) {
            
            HibernateUtil.rollbackTransaction();
            
            return null;
            
        } finally {
            
            HibernateUtil.closeSession();
            
        }
        
    }
	
    public Collection listarEstadoPorNombre(String nombre) {
        
        Collection resultado;

        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> guardarUsuario(usuario)");
            
        }
        
        try {
            
            HibernateUtil.beginTransaction();
            
            resultado = this.estadoDAO.buscaEstado(nombre);
            
            this.log.debug("Consulta: " + resultado);
            
            HibernateUtil.commitTransaction();
            
            return resultado;
            
        } catch (ExcepcionInfraestructura ex) {
            
            HibernateUtil.rollbackTransaction();
            
            return null;
            
        } finally {
            
            HibernateUtil.closeSession();
            
        }
        
    }
    
    public void eliminarEstado(Long id) {
        
        if (this.log.isDebugEnabled()) {
            
            this.log.debug("> eliminarEstado(estado)");
            
        }
        
        try {
            
            HibernateUtil.beginTransaction();           
            
            Estado estado = this.estadoDAO.buscarPorId(id, true);
            
            if (estado != null) {
                
                this.estadoDAO.hazTransitorio(estado);
            }
            
            HibernateUtil.commitTransaction();
            
        } catch (ExcepcionInfraestructura ex) {
            
            HibernateUtil.rollbackTransaction();
            
            if (this.log.isWarnEnabled()) {
                
                this.log.warn("< ExcepcionInfraestructura");
                
            }
            
        } finally {
            
            HibernateUtil.closeSession();
            
        }

    }

    public int crearEstado(Estado estado) {

        int resultado;

        if (this.log.isDebugEnabled()) {
            
            this.log.debug(">guardarEstado(estado)");
            
        }
        
        try {
            
            HibernateUtil.beginTransaction();
            
            if (this.estadoDAO.existeEstado(estado.getNombre())) {
                
                resultado = 1;
                
            } else {

               this.estadoDAO.hazPersistente(estado);

               resultado = 0;
               
            }

            HibernateUtil.commitTransaction();

        } catch (ExcepcionInfraestructura ex) {
            
            HibernateUtil.rollbackTransaction();

            if (this.log.isWarnEnabled()) {
                
                this.log.warn("< ExcepcionInfraestructura");
                
            }
            
            resultado = 2;
            
        } finally {
            
            HibernateUtil.closeSession();
            
        }
        
        return resultado;
        
    }
    
}