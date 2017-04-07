package dao;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Estado;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.extensions.TestSetup;
import junit.textui.TestRunner;

import edu.uag.iidis.scec.persistencia.*;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static junit.framework.TestCase.assertTrue;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

/** @author Mexicans13 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EstadoDAOTest extends TestCase {

    private static EstadoDAO estadoDAO = null;

    public void test3ModificarEstado() throws Exception {
        
        try {
            HibernateUtil.beginTransaction();
            Estado estado = estadoDAO.buscarPorId(new Long(5), true);
            estado.setNombre("Estado 5 Modificado");
            estado.setDescripcion("Es el estado 5 de Mexico Modificado");
            estadoDAO.modificar(estado);
            HibernateUtil.commitTransaction();
            estado = estadoDAO.buscarPorId(new Long(5), true);
            assertTrue(estado.getNombre().equals("Estado 5 Modificado"));
            assertTrue(estado.getDescripcion().equals("Es el estado 5 de Mexico Modificado"));
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
    }
    
    public void test2CrearEstado() throws Exception {
        
        Estado estado = new Estado("Estado Prueba", "Es un estado prueba");
        
        try {
            
            HibernateUtil.beginTransaction();
            estadoDAO.hazPersistente(estado);
            HibernateUtil.commitTransaction();
            assertTrue(estado.getId() != null);
            assertTrue(estado.getNombre().equals("Estado Prueba"));
            assertTrue(estado.getDescripcion().equals("Es un estado prueba"));
            
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
        
    }
    
    public void test4EliminarEstado() throws Exception {
        
        try {
            HibernateUtil.beginTransaction();
            Estado estado = estadoDAO.buscarPorId(new Long(5), true);
            estadoDAO.hazTransitorio(estado);
            estado = estadoDAO.buscarPorId(new Long(5), true);
            HibernateUtil.commitTransaction();
            assertTrue(estado == null);
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
    }    
    
    public void test1ListarEstados() throws Exception {

        List<Estado> estadosTest = new ArrayList<>(
            Arrays.asList(
                    new Estado("Estado 0", "Es el estado 1 de Mexico"),
                    new Estado("Estado 1", "Es el estado 2 de Mexico")
            )
        );
        
        try {
            HibernateUtil.beginTransaction();
            List<Estado> buscarTodos = (List<Estado>) estadoDAO.buscarTodos();
            System.out.println(buscarTodos);
            assertTrue(buscarTodos.get(0).getNombre().equals(estadosTest.get(0).getNombre()));
            assertTrue(buscarTodos.get(1).getNombre().equals(estadosTest.get(1).getNombre()));
            HibernateUtil.commitTransaction();         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
        } finally {
            HibernateUtil.closeSession();
        }
    }

    public static Test suite() {

       TestSetup suite = new TestSetup(new TestSuite(EstadoDAOTest.class)) {
            @Override
            protected void setUp(  ) throws Exception {
                estadoDAO = new EstadoDAO();
                estadoDAO.truncar();
                for (int i = 0; i < 10; i++) {
                    
                    Estado estado = new Estado("Estado " + i, "Es el estado " + i + " de Mexico");
                    try {
                        HibernateUtil.beginTransaction();
                        estadoDAO.hazPersistente(estado);
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
                estadoDAO = null;
            }
        };
        return suite;
    }

    public static void main(String[] args) throws Exception {
        TestRunner.run(suite());
    }

}
