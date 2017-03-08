/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uag.iidis.scec.vista;

import java.util.Collection;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author gerem
 */
public class FormaModificarLugar extends ValidatorForm  {
    
    private Long id;
    private String nombre;
    private String descripcion;
    private Long poblacion;
    private String coordenadas;
    private String estado;
    private String pais;
    private String moneda;
    Collection estados;
    private FormFile imagen;

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return (this.nombre);
    }
    public FormFile getImagen() {
        return (this.imagen);
    }
    public String getDescripcion() {
        return (this.descripcion);
    }
	public Long getPoblacion() {
        return (this.poblacion);
    }
	public String getCoordenadas() {
        return (this.coordenadas);
    }
	public String getEstado() {
        return (this.estado);
    }
    public String getPais() {
        return (this.pais);
    }
    public String getMoneda() {
        return (this.moneda);
    }
    
    public Collection getEstados(){
            return (this.estados);
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public void setEstados(Collection estados) {
        this.estados = estados;
    }
	public void setNombre(String nombre) {
        this.nombre = nombre;
    }
	
	public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
	public void setImagen(FormFile imagen) {
        this.imagen = imagen;
    }
	public void setPoblacion(Long poblacion) {
        this.poblacion = poblacion;
    }
	public void setCoordenadas(String coordenadas) {
        this.coordenadas = coordenadas;
    }
	public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }
	
    public void reset(ActionMapping mapping,
                      HttpServletRequest request) {
        nombre=null;
        descripcion=null;
    }


    public ActionErrors validate(ActionMapping mapping,
                                 HttpServletRequest request) {

        // Ejecuta las validaciones proporcionadas por Struts-Validator
        ActionErrors errores = super.validate(mapping, request);

        // Validaciones no cubiertas por Struts-Validator

        return errores;

    }

    @Override
    public String toString() {
        return "FormaModificarLugar{" + "id=" + id + ", nombre=" + nombre + 
                    ", descripcion=" + descripcion + ", poblacion=" + poblacion + 
                    ", coordenadas=" + coordenadas + ", estado=" + estado + 
                    ", pais=" + pais + ", moneda=" + moneda + ", estados=" + estados + 
                    ", imagen=" + imagen + 
                '}';
    }
    
    

}
