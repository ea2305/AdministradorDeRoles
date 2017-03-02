package edu.uag.iidis.scec.modelo;

import java.io.Serializable;

/**
 * Esta clase es usada para representar un rol de un
 * usuario. 
 *
 * <p><a href="Estado.java.html"><i>Ver cÃ³digo fuente</i></a></p>
 *
 * @author <a href="mailto:vramos@uag.mx">Victor Ramos</a>
 * @version 1.0
 */
public class Estado extends ClaseBase implements Serializable {

    private Long id;
    private String nombre;
    private String descripcion;
    
    public Estado() {
        
    }
    
    public Estado(Long id) {
        this.id = id;
    }
    
    public Estado(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    /**
     * Regresa el id del rol.
     * @return Long
     */
    public Long getId() {
        return this.id;
    }

    /**
     * Establece el id del rol.
     * @param id
     */
    public void setId(Long id) {
        this.id = id;
    }
    
    /**
     * Regresa el nombre del rol.
     * @return String
     */
    public String getNombre() {
        return this.nombre;
    }

    /**
     * Establece el nombre del rol.
     * @param nombre
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    /**
     * Regresa la descripción del rol.
     * @return String
     */
    public String getDescripcion() {
        return this.descripcion;
    }

    /**
     * Establece la descripción del rol.
     * @param descripcion
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}