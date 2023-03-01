<%@page session="true"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style-admin.css"/>
        <link rel="favicon" href="https://nichegt.azurewebsites.net/assets/logoNiche.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
        <title>Tienda Niche</title>
        <style>
            .btn-usuario{
                background-color: var(--color-fondo-oscuro);
                color: #fcbe6795;
                text-align: center;
                display: inline-block;
                font-size: 1.10rem;
                font-weight: bold;
                cursor: pointer;
                width: 160px;
                border-radius: 0.5rem;
                border: none;
                padding: 0.75rem;
                transition: all 0.1s ease-out;
            }
            .btn-usuario:hover{
                text-decoration: none;
                color: var(--color-primario);
                transform: scale(1.02, 1.02)
            }

            .btn-opcion-modal{
                background-color: var(--color-fondo-oscuro);
                color: #fcbe6795;
                text-align: center;
                display: inline-block;
                font-size: 1.10rem;
                font-weight: bold;
                cursor: pointer;
                width: 160px;
                border-radius: 0.5rem;
                border: none;
                padding: 0.75rem;
                transition: all 0.1s ease-out;
                width: 150px;
            }
            .btn-opcion-modal:hover{
                text-decoration: none;
                color: var(--color-primario);
                transform: scale(1.02, 1.02)
            }

        </style>
    </head>
    <body style="font-family:'Nunito Sans', sans-serif">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("correo") != null) && ((sesion.getAttribute("rol").equals("1")))) {
        %>  
        <header  class="cabecera">
            <div class="cabecera-grupo">                
                <h2 style="margin:0; font-size: 2.5rem"><b>Sistema tienda de ropa Niche</b></h2>
                <div class="dropdown">
                    <a style="color: #c04c71; font-size: 1.35rem" type="button" data-toggle="dropdown" aria-expanded="false">
                        <i style="color: white;" class="fa-solid fa-user"></i>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="SrvAcceso?accion=cerrar" >Salir</a>
                    </div>
                </div>
            </div>
        </header>

        <div class="contenedor">
            <section class="contenedor-nav">                
                <nav class="menu">
                    <span><b>MANTENIMIENTO</b></span>
                    <a href="admin.jsp">Inicio</a>
                    <a href="pedidos.jsp" >Pedidos</a>
                    <a href="clientesAdmin.jsp" >Clientes</a>
                    <a href="ventas.jsp" >Ventas</a>
                    <a href="productos.jsp" >Productos</a>
                    <span><b>ADMINISTRACION</b></span>
                    <a href="empleados.jsp">Empleados</a>
                    <a href="informe.jsp" >Informe Ventas</a>
                </nav>
            </section>
            <section class="contenedor-contenido">     
                <div class="encabezado-group">
                    <p>Empleados<p>
                        <button id="btn_modal" type="button" class="btn-usuario" data-toggle="modal" data-target="#modal_empleado" onclick="activarBtn(), limpiar()">Agregar nuevo</button>
                </div>

                <div class="cont">

                    <div class="modal fade" id="modal_empleado" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">  
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 style="text-align: center;" class="modal-title" id="staticBackdropLabel"><b>Datos empleado</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="desactivarBtn()">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="SrvEmpleado" method="post" class="form-group">                                                                                 
                                        <input type="number" name="txt_id" id="txt_id" class="form-control" value="0" readonly required style="display:none;">
                                        <label for="txt_cui"><b>CUI</b></label>                                            
                                        <input type="number" name="txt_cui" id="txt_cui" class="form-control" required>
                                        <label for="txt_nombres"><b>Nombres</b></label>
                                        <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" required>
                                        <label for="txt_apellidos"><b>Apellidos</b></label>
                                        <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" required>
                                        <label for="txt_correo"><b>Correo</b></label>
                                        <input type="email" name="txt_correo" id="txt_correo" class="form-control" title="Email incorrecto"
                                               pattern="^[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,15})$" required>
                                        <label for="txt_pass"><b>Contraseña</b></label>
                                        <input type="password" name="txt_pass" id="txt_pass" class="form-control" required>
                                        <label for="txt_direccion"><b>Direccion</b></label>
                                        <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" required>
                                        <label for="txt_telefono"><b>Teléfono</b></label>
                                        <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required>
                                        <label for="txt_fn"><b>Fecha nacimiento</b></label>
                                        <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                                        <label for="drop_usuario"><b>Usuario</b></label><br>
                                        <select name="drop_usuario" id="drop_usuario" class="form-control">
                                            <%
                                                Usuario usuario = new Usuario();
                                                HashMap<String, String> drop = usuario.drop_usuario();
                                                for (String i : drop.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                        <label for="drop_estado"><b>Estado</b></label><br>
                                        <select name="drop_estado" id="drop_estado" class="form-control">
                                            <%
                                                EmpleadoDAO estado = new EmpleadoDAO();
                                                HashMap<String, String> dropE = estado.drop_estado();
                                                for (String i : dropE.keySet()) {
                                                    out.println("<option value='" + i + "'>" + dropE.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                        <br>
                                        <button id="btn_agregar" type="submit" name="accion" class="btn-opcion-modal" value="agregar" style="display: none;" >Agregar</button>
                                        <button id="btn_modificar" type="submit" name="accion" class="btn-opcion-modal" value="modificar" style="display:inline-block;">Modificar</button>
                                        <button id="btn_eliminar" type="submit" name="accion" class="btn-opcion-modal" value="eliminar" style="display:inline-block;" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                                    return false">Eliminar</button>
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>

                <section class="contenedor-tabla">
                    <table class="table">
                        <thead style="background-color: var(--color-fondo-oscuro); color: white" >
                            <tr>
                                <th scope="col">CUI</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Correo</th>
                                <!-- <th scope="col">Password</th> -->
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Nacimiento</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Estado</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_empleados">
                            <%
                                EmpleadoDAO empleadoDao = new EmpleadoDAO();
                                DefaultTableModel tabla = new DefaultTableModel();
                                tabla = empleadoDao.leer();
                                for (int i = 0; i < tabla.getRowCount(); i++) {
                                    out.println("<tr data-id=" + tabla.getValueAt(i, 0) + " data-id_usuario=" + tabla.getValueAt(i, 10) + " data-id_estado=" + tabla.getValueAt(i, 12) + ">");
                                    out.println("<td>" + tabla.getValueAt(i, 1) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 2) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 3) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 4) + "</td>");
                                    out.println("<td style='display:none;'>" + tabla.getValueAt(i, 5) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 6) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 7) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 8) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 9) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 11) + "</td>");
                                    out.println("</tr>");
                                }
                            %>                           
                        </tbody>
                    </table>
                </section>
            </section>



        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script>
                                            function limpiar() {
                                                $("#txt_id").val(0);
                                                $("#txt_cui").val('');
                                                $("#txt_nombres").val('');
                                                $("#txt_apellidos").val('');
                                                $("#txt_correo").val('');
                                                $("#txt_pass").val('');
                                                $("#txt_direccion").val('');
                                                $("#txt_telefono").val('');
                                                $("#txt_fn").val('');
                                                $("#drop_usuario").val(2);
                                                $("#drop_estado").val(1);
                                            }


                                            $('#tbl_empleados').on('click', 'tr td', function (evt) {
                                                var target, id, id_usuario, id_estado, cui, nombres, apellidos, correo, password, direccion, telefono, nacimiento; // target, sirve para extraer los elementos de id, id_puesto
                                                target = $(event.target);
                                                id = target.parent().data('id');
                                                id_usuario = target.parent().data('id_usuario');
                                                id_estado = target.parent().data('id_estado');
                                                cui = target.parent("tr").find("td").eq(0).html();
                                                nombres = target.parent("tr").find("td").eq(1).html();
                                                apellidos = target.parent("tr").find("td").eq(2).html();
                                                correo = target.parent("tr").find("td").eq(3).html();
                                                password = target.parent("tr").find("td").eq(4).html();
                                                direccion = target.parent("tr").find("td").eq(5).html();
                                                telefono = target.parent("tr").find("td").eq(6).html();
                                                nacimiento = target.parent("tr").find("td").eq(7).html();

                                                $("#txt_id").val(id);
                                                $("#txt_cui").val(cui);
                                                $("#txt_nombres").val(nombres);
                                                $("#txt_apellidos").val(apellidos);
                                                $("#txt_correo").val(correo);
                                                $("#txt_pass").val(password);
                                                $("#txt_direccion").val(direccion);
                                                $("#txt_telefono").val(telefono);
                                                $("#txt_fn").val(nacimiento);
                                                $("#drop_usuario").val(id_usuario);
                                                $("#drop_estado").val(id_estado);                                                
                                                $("#modal_empleado").modal('show');
                                            });                                     
                                            
                                            
                                            function activarBtn() {                                                                                           
                                                    document.getElementById('btn_agregar').style.display = "inline-block"; // show
                                                    document.getElementById('btn_modificar').style.display = "none";
                                                    document.getElementById('btn_eliminar').style.display = "none";                                               
                                            }
                                            
                                            function desactivarBtn() {                                                                                           
                                                    document.getElementById('btn_agregar').style.display = "none"; // show
                                                    document.getElementById('btn_modificar').style.display = "inline-block";
                                                    document.getElementById('btn_eliminar').style.display = "inline-block";                                               
                                            }



        </script>
        <%
            } else {
                response.sendRedirect("admin.jsp");
            }
        %> 
    </body> 

</html>

