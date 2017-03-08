/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uag.iidis.scec.vista;


import java.util.Collection;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author gerem
 */
public class FileUploadForm extends ActionForm {
    
    private String nombre;
    private String descripcion;
    private Long poblacion;
    private String coordenadas;
    private String estado;
    private String pais;
    private String moneda;
    Collection estados;
    private FormFile file;

    public FormFile getFile() {
            return file;
    }

    public void setFile(FormFile file) {
            this.file = file;
    }
    
    public String getNombre() {
        return (this.nombre);
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
	
	public void setEstados(Collection estados) {
        this.estados = estados;
    }
	public void setNombre(String nombre) {
            System.out.println("Estableciendo el nombre: " + nombre);
        this.nombre = nombre;
    }
	
	public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    @Override
    public ActionErrors validate(ActionMapping mapping,
       HttpServletRequest request) {

        ActionErrors errors = new ActionErrors();

        if( getFile().getFileSize()== 0){
           errors.add("common.file.err",
            new ActionMessage("error.common.file.required"));
           return errors;
        }

        //only allow textfile to upload
        if(!"text/plain".equals(getFile().getContentType())){
            errors.add("common.file.err.ext",
             new ActionMessage("error.common.file.textfile.only"));
            return errors;
        }

        //file size cant larger than 10kb
        System.out.println(getFile().getFileSize());
        if(getFile().getFileSize() > 10240){ //10kb
           errors.add("common.file.err.size",
                new ActionMessage("error.common.file.size.limit", 10240));
           return errors;
        }

        return errors;
    }
    
}
