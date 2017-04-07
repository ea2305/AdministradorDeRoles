package edu.uag.iidis.scec.persistencia;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Ciudad;
import edu.uag.iidis.scec.persistencia.CiudadDAO;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import junit.extensions.TestSetup;
import junit.framework.TestCase;
import static junit.framework.TestCase.assertTrue;
import junit.framework.TestSuite;
import junit.textui.TestRunner;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

/** @author Mexicans13 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CiudadDAOTest extends TestCase {
    
    private static CiudadDAO ciudadDAO = null;
    
    public void test1ListarCiudades() throws Exception {
        List<Ciudad> estadosTest = new ArrayList<>(
            Arrays.asList(
                new Ciudad("Ciudad 0", "Es la ciudad 0 de Yucatan"),
                new Ciudad("Ciudad 1", "Es la ciudad 1 de Yucatan")
            )
        );
        
        try {
            HibernateUtil.beginTransaction();
            List<Ciudad> buscarTodos = (List<Ciudad>) ciudadDAO.buscarTodos();
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

    public static junit.framework.Test suite() {
       TestSetup suite = new TestSetup(new TestSuite(CiudadDAOTest.class)) {
            @Override
            protected void setUp(  ) throws Exception {
                ciudadDAO = new CiudadDAO();
//                ciudadDAO.truncar();
                for (int i = 0; i < 10; i++) {
                    Ciudad ciudad = new Ciudad("Ciudad " + i, "Es la ciudad " + i + " de Yucatan");
                    try {
                        HibernateUtil.beginTransaction();
                        ciudadDAO.hazPersistente(ciudad);
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
                ciudadDAO = null;
            }
        };
        return suite;
    }

    public static void main(String[] args) throws Exception {
        TestRunner.run(suite());
    }
}
