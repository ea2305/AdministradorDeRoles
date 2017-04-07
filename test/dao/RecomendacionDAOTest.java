package dao;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Recomendacion;
import edu.uag.iidis.scec.persistencia.RecomendacionDAO;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import junit.extensions.TestSetup;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.textui.TestRunner;
import static org.junit.Assert.*;
import org.junit.Test;

/** @author Mexicans13 */
public class RecomendacionDAOTest extends TestCase{
    
    private static RecomendacionDAO recomendacionDAO = null;
    
    @Test
    public void test1buscarPorIdTest() {
        recomendacionDAO = new RecomendacionDAO();
        Recomendacion evento = recomendacionDAO.buscarPorId(new Long(1), true);
        
        HibernateUtil.beginTransaction();
        try {
            recomendacionDAO.hazPersistente(evento);
            Boolean existe =  recomendacionDAO.existeRecomendacion("Nombre 1");
            HibernateUtil.commitTransaction();
            assertTrue("No se inserto el evento", existe);
        } catch (Exception e) {
            HibernateUtil.rollbackTransaction();
            throw e;
        } finally{
            HibernateUtil.closeSession();
        }
    }
    
    @Test
    public void test2ListarRecomendaciones() throws Exception {

        List<Recomendacion> estadosTest = new ArrayList<>(
            Arrays.asList(
                new Recomendacion("Nombre 0","Pais 0","user 0","fecha","Comentario 0", new Long(0)),
                new Recomendacion("Nombre 1","Pais 1","user 1","fecha","Comentario 1", new Long(1))
            )
        );
        
        try {
            HibernateUtil.beginTransaction();
            List<Recomendacion> buscarTodos = (List<Recomendacion>) recomendacionDAO.buscarTodos();
            assertTrue(buscarTodos.get(0).getNombre().equals(estadosTest.get(0).getNombre()));
            assertTrue(buscarTodos.get(1).getNombre().equals(estadosTest.get(1).getNombre()));
            HibernateUtil.commitTransaction();         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
        } finally {
            HibernateUtil.closeSession();
        }
    }
    
    @Test
    public void test3ModificarRecomendaciones() throws Exception {
        try {
            HibernateUtil.beginTransaction();
            Recomendacion recomienda = recomendacionDAO.buscarPorId(new Long(2), true);
            recomienda.setNombre("Nombre 2 Modificado");
            recomienda.setComentario("Comentario 2 de recomendaciones Modificado");
            recomendacionDAO.modificar(recomienda);
            HibernateUtil.commitTransaction();
            recomienda = recomendacionDAO.buscarPorId(new Long(2), true);
            assertTrue(recomienda.getNombre().equals("Nombre 2 Modificado"));
            assertTrue(recomienda.getComentario().equals("Comentario 2 de recomendaciones Modificado"));
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
    }
    
    @Test
    public void test4EliminarRecomendaciones() throws Exception {
        
        try {
            HibernateUtil.beginTransaction();
            Recomendacion recomienda = recomendacionDAO.buscarPorId(new Long(2), true);
            recomendacionDAO.hazTransitorio(recomienda);
            recomienda = recomendacionDAO.buscarPorId(new Long(2), true);
            HibernateUtil.commitTransaction();
            assertTrue(recomienda == null);
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
    }   
    
    public static junit.framework.Test suite() {
       TestSetup suite = new TestSetup(new TestSuite(RecomendacionDAOTest.class)) {
            @Override
            protected void setUp(  ) throws Exception {
                recomendacionDAO = new RecomendacionDAO();
                recomendacionDAO.truncar();
                for (int i = 0; i < 10; i++) {
                    Recomendacion recomendacion = new Recomendacion(
                            "Nombre " + i,"Pais " + i,"user " + i,"fecha","Comentario " + i, new Long(i));
                    try {
                        HibernateUtil.beginTransaction();
                        recomendacionDAO.hazPersistente(recomendacion);
                        HibernateUtil.commitTransaction();
                    } catch (Exception ex) {
                        HibernateUtil.rollbackTransaction();
                        throw ex;
                    } finally {
                        HibernateUtil.closeSession();
                    }
                }
            }

            @Override
            protected void tearDown(  ) throws Exception {
                recomendacionDAO = null;
            }
        };
        return suite;
    }

    public static void main(String[] args) throws Exception {
        TestRunner.run(suite());
    }

}
