/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uag.iidis.scec.vista;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

/**
 *
 * @author gerem
 */

public final class FormaEliminarPais extends ValidatorForm {

    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.id = new Long(0);
    }
    
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        return super.validate(mapping, request);
    }

}
