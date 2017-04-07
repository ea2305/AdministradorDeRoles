package dao;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Rol;
import edu.uag.iidis.scec.persistencia.RolDAO;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import junit.extensions.TestSetup;
import junit.framework.TestCase;
import static junit.framework.TestCase.assertTrue;
import junit.framework.TestSuite;
import junit.textui.TestRunner;
import org.junit.Test;

/** @author Mexicans13 */
public class RolDAOTest  extends TestCase{
    
    private static RolDAO rolDAO = null;
    
    @Test
    public void test1ListarRoles() throws Exception {
        List<Rol> ciudadTest = new ArrayList<>(
            Arrays.asList(
                new Rol("Rol 0", "Es el rol 0 de muchos"),
                new Rol("Rol 1", "Es el rol 1 de muchos")
            )
        );
        
        try {
            HibernateUtil.beginTransaction();
            List<Rol> buscarTodos = (List<Rol>) rolDAO.buscarTodos();
            assertTrue(buscarTodos.get(0).getNombre().equals(ciudadTest.get(0).getNombre()));
            assertTrue(buscarTodos.get(1).getNombre().equals(ciudadTest.get(1).getNombre()));
            HibernateUtil.commitTransaction();         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
        } finally {
            HibernateUtil.closeSession();
        }
    }  
    
    @Test
    public void test2ModificarRecomendaciones() throws Exception {
        try {
            HibernateUtil.beginTransaction();
            Rol rol = rolDAO.buscarPorId(new Long(2), true);
            rol.setNombre("Rol 2 Modificado");
            rol.setDescripcion("Comentario 2 de rol Modificado");
            rolDAO.modificar(rol);
            HibernateUtil.commitTransaction();
            rol = rolDAO.buscarPorId(new Long(2), true);
            assertTrue(rol.getNombre().equals("Rol 2 Modificado"));
            assertTrue(rol.getDescripcion().equals("Comentario 2 de rol Modificado"));
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
            Rol recomienda = rolDAO.buscarPorId(new Long(8), true);
            rolDAO.hazTransitorio(recomienda);
            recomienda = rolDAO.buscarPorId(new Long(8), true);
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
        TestSetup suite = new TestSetup(new TestSuite(RolDAOTest.class)) {
            @Override
            protected void setUp(  ) throws Exception {
                rolDAO = new RolDAO();
                rolDAO.truncar();
                for (int i = 0; i < 10; i++) {
                    
                    Rol rol = new Rol("Rol " + i, "Es el rol " + i + " de muchos");
                    try {
                        HibernateUtil.beginTransaction();
                        rolDAO.hazPersistente(rol);
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
                rolDAO = null;
            }
        };
        return suite;
    }

    public static void main(String[] args) throws Exception {
        TestRunner.run(suite());
    }
    
}
