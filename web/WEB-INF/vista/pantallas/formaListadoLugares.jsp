    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
<style>
  .HipervinculoAdmon{
    color:#000000;
	text-decoration:none;
  }
  
  .HipervinculoAdmon:hover{
    color:#006666;
	text-decoration:underline;
  }
</style>

<!-- Mover scripts a un archivo propio -->
<script language="javascript" type="text/javascript">

  function EliminarLugar(strLugarName){
    return confirm("¿Desea eliminar el estado '" + strLugarName + "'?")
  }

</script>

<section class="custom-height row">
    
    <div class="errors col s12 m12 l12">
        <html:errors />
    </div>

    <h5 class="title center col s12 m12 l12">
        <fmt:message key="formaListadoLugares.titulo" />
    </h5>

    <!-- Barra de busqueda -->
    <nav class="grey darken-3 col s12 m10 l10 push-m1 push-l1">
        <div class="nav-wrapper">
            <form>
                <div class="input-field transparent">
                    <input id="search" type="search" required>
                    <label class="label-icon" for="search">
                        <i class="material-icons">search</i>
                    </label>
                    <i class="material-icons">close</i>
                </div>
            </form>
        </div>
    </nav>
    <!-- Tabla de contenidos -->
    <table class="responsive-table highlight col s12 m10 l10 push-m1 push-l1">
        <thead>
            <tr>
                <th data-field="nombre">
                    <fmt:message key="formaListadoLugares.etiqueta.nombre" />
                </th>
                <th data-field="descripcion">
                    <fmt:message key="formaListadoLugares.etiqueta.descripcion" />
                </th>
                <th data-field="poblacion">
                    <fmt:message key="formaListadoLugares.etiqueta.poblacion" />
                </th>
                <th data-field="coordenadas">
                    <fmt:message key="formaListadoLugares.etiqueta.coordenadas" />
                </th>
                <th data-field="estado">
                    <fmt:message key="formaListadoLugares.etiqueta.estado" />
                </th>
                <th data-field="pais">
                    <fmt:message key="formaListadoLugares.etiqueta.pais" />
                </th>
                <th data-field="moneda">
                    <fmt:message key="formaListadoLugares.etiqueta.moneda" />
                </th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="lugar" items="${formaListadoLugares.lugares}">
                <tr>
                    <td>
                        <c:out value="${lugar.descripcion}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.nombre}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.poblacion}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.coordenadas}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.estado}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.pais}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.moneda}"/>
                    </td>

                    <td>
                        <a href='solicitarModificarLugar.do?id=<c:out value="${lugar.id}"/>'
                        class="waves-effect waves-light btn blue">
                            <i class="material-icons left">mode_edit</i>
                            <!--fmt:message key="formaListadoLugares.etiqueta.modificar" /-->
                        </a>
                    </td>
                    <td>
                        <a href='procesarEliminarLugar.do?id=<c:out value="${lugar.id}"/>'
                        onClick="javascript: return EliminarLugar('<c:out value="${lugar.nombre}"/>')"
                        class="waves-effect waves-light btn red">
                            <i class="material-icons left">delete</i>
                            <!--fmt:message key="formaListadoLugares.etiqueta.eliminar" /-->
                        </a>
                    </td>
                </tr>
            </c:forEach>
        
            <tr>
                <td colspan="8" align="right"><b>Total:</b> ${formaListadoLugares.contador}</td>
            </tr>
        </tbody>
    </table>

    <!-- agergar nuevo lugar -->
    <div class="options col s12 m10 l10 push-l1 push-m1">
        <a href="solicitarRegistroLugar.do" class="waves-effect waves-light btn green">Agregar nuevo lugar...</a>
    </div>

</section>