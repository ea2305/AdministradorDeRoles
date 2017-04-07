package edu.uag.iidis.scec.persistencia;

import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Estado;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;

import org.hibernate.criterion.Example;
import org.hibernate.HibernateException;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;

public class EstadoDAO {

    private final Log log = LogFactory.getLog(EstadoDAO.class);

    public EstadoDAO() {
        
    }

    public Estado buscarPorId(Long id, boolean block) {
        Estado estado = null;
        
        if (this.log.isDebugEnabled()) {
            this.log.debug("> buscarPorID(" + id + ", " + block + ")");
        }

        try {
            if (block) {
                estado = (Estado) HibernateUtil.getSession().load(Estado.class,id, LockMode.UPGRADE);
            } else {
                estado = (Estado) HibernateUtil.getSession().load(Estado.class, id);
            }
        } catch (HibernateException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("< HibernateException");
            }
        }
        return estado;
    }
    
    public Collection buscarTodos() throws ExcepcionInfraestructura {

        Collection estados;

        if (this.log.isDebugEnabled()) {
            this.log.debug("> buscarTodos()");
        }
        try {
            estados = HibernateUtil.getSession().createCriteria(Estado.class).list();
            this.log.debug("> buscarTodos() ---- list " + estados);                   
        } catch (HibernateException e) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("< HibernateException");
            }
            throw new ExcepcionInfraestructura(e);
        }
        return estados;
    }
    
    public Collection buscarPorEjemplo(Estado estado) throws ExcepcionInfraestructura {

        Collection estados;
        if (this.log.isDebugEnabled()) {
            this.log.debug(">buscarPorEjemplo()");
        }
        try {
            Criteria criteria = HibernateUtil.getSession().createCriteria(Estado.class);
            estados = criteria.add(Example.create(estado)).list();
        } catch (HibernateException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("< HibernateException");
            }
            throw new ExcepcionInfraestructura(ex);
        }
        return estados;
    }
    
    public boolean modificar(Estado estado) throws ExcepcionInfraestructura {
        boolean toReturn = false;
        if (this.log.isDebugEnabled()) {
            this.log.debug(">modificar(estado)");
        }
        try {
            System.out.println(estado.toString());
            HibernateUtil.getSession().saveOrUpdate(estado);
            toReturn = true;
        } catch (HibernateException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(ex);
        }
        return toReturn;
    }
    
    public void hazPersistente(Estado estado) throws ExcepcionInfraestructura {
        if (this.log.isDebugEnabled()) {
            this.log.debug(">hazPersistente(estado)");
        }
        try {
            HibernateUtil.getSession().saveOrUpdate(estado);
        } catch (HibernateException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(ex);
        }
    }

    public void hazTransitorio(Estado estado) throws ExcepcionInfraestructura {
        if (this.log.isDebugEnabled()) {
            this.log.debug("> hazTransitorio(estado)");
        }
        try {
            HibernateUtil.getSession().delete(estado);
        } catch (HibernateException e) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(e);
        }
    }

    public boolean existeEstado(String nombre) throws ExcepcionInfraestructura {
        if (this.log.isDebugEnabled()) {
            this.log.debug(">existeRol(nombreRol)");
        }
        try {
            String hql = "select nombre from Estado where nombre = :nombre";
            if (this.log.isDebugEnabled()) {
                this.log.debug(hql + nombre);
            }
            Query query = HibernateUtil.getSession().createQuery(hql);
            if (this.log.isDebugEnabled()) {
                 this.log.debug("<<<<<<<<< create query ok " );
            }
            query.setParameter("nombre", nombre);
            if (this.log.isDebugEnabled()) {
                this.log.debug("<<<<<<<<< set Parameter ok antes del query list >>>>>");
            }
            return !query.list().isEmpty();
        } catch (HibernateException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("< HibernateException *******************");
            }
            throw new ExcepcionInfraestructura(ex);
        }
    }
	
    public Collection buscaEstado(String nombre) throws ExcepcionInfraestructura {
		
        if (this.log.isDebugEnabled()) {
            this.log.debug("> existeRol(nombreRol)");
        }
        try {
            String hql = "from Estado where nombre like '" + nombre + "%'";
             if (this.log.isDebugEnabled()) {
            
                this.log.debug(hql + nombre);
            }
            Query query = HibernateUtil.getSession().createQuery(hql);
            if (this.log.isDebugEnabled()) {
                this.log.debug("<<<<<<<<< create query ok " );
            }
            if (this.log.isDebugEnabled()) {
                this.log.debug("<<<<<<<<< set Parameter ok antes del query list >>>>>");
            }
            return  query.list();
        } catch (HibernateException ex) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("< HibernateException *******************");
            }
            throw new ExcepcionInfraestructura(ex);
        }
    }
    
    public int truncar() {
        Query query = HibernateUtil.getSession().createSQLQuery(
                "truncate table estados"
        );
        return query.executeUpdate();
    }
}