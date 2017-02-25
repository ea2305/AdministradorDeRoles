    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="js/formaNuevoLugar.js" ></script>

    </head>
    <br>
    <font size='5'><fmt:message key="formaNuevoLugar.titulo" /></font>

    <form id="forma" action="procesarRegistroLugar.do" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td colspan="2">
                   <html:errors />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.nombre" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="nombre" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.nombre}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.descripcion" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="descripcion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.descripcion}" />
                </td>
            </tr>
			<tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.poblacion" />
                </td>
                <td align="left">
                    <input type="number" 
                           name="poblacion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.poblacion}" />
                </td>
            </tr>
			     <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.coordenadas" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="coordenadas" 
                           id="coordenadas"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.coordenadas}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.estado" />
                </td>
                <td align="left">
                    <input type="text"
                          id="estado"
                          name="estado"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.estado}"/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.pais" />
                </td>
                <td align="left">
                    <input type="text"
                          id="pais"
                          name="pais"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.pais}"/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.moneda" />
                </td>
                <td align="left">
                    <input type="text"
                          id="moneda"
                          name="moneda"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.moneda}"/>
                </td>
            </tr>
			       <!--<tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.buscaestado" />
                </td>
                <td align="left">
                    <input type="text"
						   id="est"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.estado}"
						   onkeyup="ListaEstado()"/>
                </td>
            </tr>-->
			<!--<tr align="center">
				<td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.estado" />
                </td>
				<td align="left">
					<select id="listaE" name="estado" required>
						<option value="" disabled selected hidden>Seleccione un estado</option>
						<c:forEach var="estado" items="${formaNuevoLugar.estados}">
							<option value='<c:out value="${lugar.nombre}"/>'><c:out value="${estado.nombre}"/></option>
						</c:forEach>
					</select>
				</td>
        </tr>-->
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.foto" />
                </td>
                <td align="left">
                    <input type="file" 
                           name="imagen"
                           value="${formaNuevoLugar.imagen}"/>
                           <!--cambios-->
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" 
                           name="submit"
                           value="Agregar y terminar"/>
                    <input type="submit" 
                           name="submit"
                           value="Agregar y volver"
                           onclick="forma.action='procesarRegistroLugar.do?volver=si'"/>
                    <input type="button"
                           value="Reset"
                           onclickan="location.href='solicitarRegistroLugar.do'" />
                    <input type="submit" 
                           name="org.apache.struts.taglib.html.CANCEL" 
                           value="cancelar" 
                           onclick="bCancel=true;">    
                </td>
            </tr>
        </table>
    </form>

    <div id="mapa" style="height: 300px; width:400px;"></div>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbSOVcUH2d9pQw4yuwCFE3ondsvj6vJko&callback=initMap"
type="text/javascript"></script>