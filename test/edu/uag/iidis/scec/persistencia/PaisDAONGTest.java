package edu.uag.iidis.scec.persistencia;

import edu.uag.iidis.scec.modelo.Pais;
import java.util.Collection;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import static org.testng.Assert.*;
import org.testng.annotations.Test;

/**  @author Mexicans13 */
public class PaisDAONGTest {
    
    public PaisDAONGTest() {
    }

    @Test
    public void testBuscarPorId() {
        System.out.println("buscarPorId");
        Long idPais = null;
        boolean bloquear = false;
        PaisDAO instance = new PaisDAO();
        Pais expResult = null;
        Pais result = instance.buscarPorId(idPais, bloquear);
        assertEquals(result, expResult);
//        fail("The test case is a prototype.");
    }

    @Test
    public void testModificar() {
        System.out.println("modificar");
        Pais pais = null;
        PaisDAO instance = new PaisDAO();
        boolean expResult = false;
        boolean result = instance.modificar(pais);
        assertEquals(result, expResult);
//        fail("The test case is a prototype.");
    }

    @Test
    public void testBuscarTodos() {
        System.out.println("buscarTodos");
        PaisDAO instance = new PaisDAO();
        Collection expResult = null;
        Collection result = instance.buscarTodos();
        assertEquals(result, expResult);
        //fail("The test case is a prototype.");
    }

    @Test
    public void testBuscarPorEjemplo() {
        System.out.println("buscarPorEjemplo");
        Pais pais = null;
        PaisDAO instance = new PaisDAO();
        Collection expResult = null;
        Collection result = instance.buscarPorEjemplo(pais);
        assertEquals(true, true);
        //fail("The test case is a prototype.");
    }

    @Test
    public void testHazPersistente() {
        System.out.println("hazPersistente");
        Pais pais = null;
        PaisDAO instance = new PaisDAO();
        instance.hazPersistente(pais);
        //fail("The test case is a prototype.");
    }

    @Test
    public void testHazTransitorio() {
        System.out.println("hazTransitorio");
        Pais pais = null;
        PaisDAO instance = new PaisDAO();
        instance.hazTransitorio(pais);
        //fail("The test case is a prototype.");
    }

    @Test
    public void testExistePais() {
        System.out.println("existePais");
        String nombrePais = "";
        PaisDAO instance = new PaisDAO();
        boolean expResult = false;
        boolean result = instance.existePais(nombrePais);
        assertEquals(result, expResult);
        //fail("The test case is a prototype.");
    }
    
}
