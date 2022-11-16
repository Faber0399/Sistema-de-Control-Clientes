<%-- 
    Document   : listadoClientes
    Created on : Nov 11, 2022, 12:33:51 PM
    Author     : faber
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_MX"/>

<section id="clientes">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de clientes</h4>
                    </div>
                    <table class="table table-hover" >
                        <caption text-center>Informacion acerca de los usuarios</caption>
                        <thead >
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Saldo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iteramos cada elemento de la lista de clientes -->
                            <c:forEach var="cliente" items="${clientes}">
                                <tr><th scope="row">${cliente.idCliente}</th>
                                    <td>${cliente.nombre} ${cliente.apellido}</td>
                                    <td><fmt:formatNumber value="${cliente.saldo}" type="currency"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}"
                                           class="btn btn-secondary btn-sm" >
                                            <i class="fa-sharp fa-solid fa-user-pen"></i>
                                        </a>
                                    </td></tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <%--Inicio de las tarjetas --%>
            <div class="col-md-4">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Saldo Total</h3>
                        <h3 class="display-4">
                            <i class="fa-solid fa-sack-dollar"></i>
                            <fmt:formatNumber value="${saldoTotal}" type="currency" />
                        </h3>
                    </div>
                </div>
                <div>
                    <div class="card text-center bg-success text-white mb-3">
                        <div class="card-body">
                            <h3>Total Clientes</h3>
                            <h3 class="display-4">
                                <i class="fas fa-users"></i> ${totalClientes}
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <%--Fin de las tarjetas --%>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/paginas/clientes/agregarCliente.jsp"/>