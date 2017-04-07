package dao;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Pais;
import edu.uag.iidis.scec.persistencia.PaisDAO;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import junit.extensions.TestSetup;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.textui.TestRunner;
import org.junit.Test;

/** @author Mexicans13 */
public class PaisDAOTest extends TestCase {
    
    private static PaisDAO paisDAO = null;
    
    @Test
    public void test1buscarPorIdTest() {
        paisDAO = new PaisDAO();
        Pais evento = paisDAO.buscarPorId(Long.parseLong("1"), true);
        
        HibernateUtil.beginTransaction();
        try {
            paisDAO.hazPersistente(evento);
            Boolean existe =  paisDAO.existePais("Pais 1");
            HibernateUtil.commitTransaction();
            assertTrue("No se inserto el evento",existe);
        } catch (Exception e) {
            HibernateUtil.rollbackTransaction();
            throw e;
        } finally{
            HibernateUtil.closeSession();
        }
    }
    
    @Test
    public void test2ListarPaises() throws Exception {

        List<Pais> estadosTest = new ArrayList<>(
            Arrays.asList(
                new Pais("Pais 0", "Es el pais 0 del mundo"),
                new Pais("Pais 1", "Es el pais 1 del mundo")
            )
        );
        
        try {
            HibernateUtil.beginTransaction();
            List<Pais> buscarTodos = (List<Pais>) paisDAO.buscarTodos();
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
    public void test3ModificarPais() throws Exception {
        try {
            HibernateUtil.beginTransaction();
            Pais pais = paisDAO.buscarPorId(new Long(3), true);
            pais.setNombre("Pais 3 Modificado");
            pais.setDescripcion("Es el Pais 3 del mundo Modificado");
            paisDAO.modificar(pais);
            HibernateUtil.commitTransaction();
            pais = paisDAO.buscarPorId(new Long(3), true);
            assertTrue(pais.getNombre().equals("Pais 3 Modificado"));
            assertTrue(pais.getDescripcion().equals("Es el Pais 3 del mundo Modificado"));
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
    }
    
    @Test
    public void test4EliminarPais() throws Exception {
        try {
            HibernateUtil.beginTransaction();
            Pais pais = paisDAO.buscarPorId(new Long(1), true);
            paisDAO.hazTransitorio(pais);
            pais = paisDAO.buscarPorId(new Long(1), true);
            HibernateUtil.commitTransaction();
            assertTrue(pais == null);
        } catch (Exception ex) {
            HibernateUtil.rollbackTransaction();
            throw ex;
        } finally {
            HibernateUtil.closeSession();
        }
    }  
    
    public static junit.framework.Test suite() {
       TestSetup suite = new TestSetup(new TestSuite(PaisDAOTest.class)) {
            @Override
            protected void setUp(  ) throws Exception {
                paisDAO = new PaisDAO();
                paisDAO.truncar();
                for (int i = 0; i < 10; i++) {
                    
                    Pais pais = new Pais("Pais " + i, "Es el Pais " + i + " del mundo");
                    try {
                        HibernateUtil.beginTransaction();
                        paisDAO.hazPersistente(pais);
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
                paisDAO = null;
            }
        };
        return suite;
    }

    public static void main(String[] args) throws Exception {
        TestRunner.run(suite());
    }
    
}
