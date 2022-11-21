<%-- 
    Document   : agregarCliente
    Created on : Nov 14, 2022, 2:34:51 PM
    Author     : faber
--%>
<div class="modal" id="agregarClienteModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar Cliente</h5> 
                <button class="close" data-dismiss="modal">
                    <i class="fa-solid fa-circle-xmark"></i>
                </button>
            </div>
            <div>
                <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
                       class="was-validated">
                    <div class="modal-body" >
                        <div class="row">
                            <div class="col">
                                <div class="form-group" >
                                    <label for="nombre">Nombres</label>
                                    <input type="text"  name="nombre" required placeholder="Ejemplo Pedro">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="apellido">Apellidos</label>
                                    <input type="text" class="form-control" name="apellido" required placeholder="Ejemplo Perez">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" required placeholder="pedroperez@ejemplo.com">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="tel" class="form-control" name="telefono" required placeholder="Ejemplo 3132564">
                        </div>
                        <div class="form-group">
                            <label for="saldo">Saldo</label>
                            <input type="number" class="form-control" name="saldo" required placeholder="Ejemplo 45000">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>

                </form>

            </div>
        </div>        
    </div>
</div>