package dao;

import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Credencial;
import edu.uag.iidis.scec.modelo.NombrePersona;
import edu.uag.iidis.scec.modelo.Usuario;
import edu.uag.iidis.scec.persistencia.UsuarioDAO;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import junit.extensions.TestSetup;
import junit.framework.Test;
import junit.framework.TestCase;
import static junit.framework.TestCase.assertTrue;
import junit.framework.TestSuite;
import junit.textui.TestRunner;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

/** @author Mexicans13 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LoginDAOTest extends TestCase{
    
    private static UsuarioDAO usuarioDAO = null;
    
    public void test1buscarLoginUsuario(){        
        Usuario usuario = new Usuario(    
                    new NombrePersona("2 Ing.","Gonzalo","Osuna", "Millán", "", "gom"),
                    new Credencial("2user", "pass"));
        
        try {
            HibernateUtil.beginTransaction();
            usuarioDAO.hazPersistente(usuario);
            assertTrue(usuario.getId() != null);
            HibernateUtil.commitTransaction(); 
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
        } finally {
            HibernateUtil.closeSession();
        }
    }
  
    public static Test suite() {
       TestSetup suite = new TestSetup(new TestSuite(LoginDAOTest.class)) {
            @Override
            protected void setUp(  ) throws Exception {
                usuarioDAO = new UsuarioDAO();
                usuarioDAO.truncar();
                for (int i = 0; i < 10; i++) {
                    Usuario usuario = new Usuario(
                        new NombrePersona(i + " Ing.","Gonzalo","Osuna", "Millán", "", "gom"),
                        new Credencial("user " + i, "pass" + i));
                    try {                        
                        HibernateUtil.beginTransaction();
                        usuarioDAO.hazPersistente(usuario);
//                        assertTrue();
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
                usuarioDAO = null;
            }
        };
        return suite;
    }

    public static void main(String[] args) throws Exception {
        TestRunner.run(suite());
    }
    
}
