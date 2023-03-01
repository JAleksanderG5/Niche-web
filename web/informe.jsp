<%@page import="Modelo.Reporte"%>
<%@page import="Modelo.Clientes"%>
<%@page import="Modelo.InformeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Modelo.ClientesDAO"%>
<%@page import="Modelo.ProductoDAO"%>
<%@page import="Modelo.VentasDAO"%>
<%@page session="true"%>
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
            if ((sesion.getAttribute("correo") != null) && ((session.getAttribute("rol") == "1"))) {
        %>  
        <header  class="cabecera">
            <div class="cabecera-grupo">                
                <h2 style="margin:0; font-size: 2.5rem"><b>Sistema tienda de ropa Niche</b></h2>
                <div class="dropdown">
                    <a style="color: #c04c71; font-size: 1.35rem"  type="button" data-toggle="dropdown" aria-expanded="false">
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
                    <p>Informe</p>
                </div>
                <div class="contenido-informe">
                    <div class="alert alert-primary" role="alert">
                        <%
                            VentasDAO ventas = new VentasDAO();
                            int noVentas;
                            noVentas = ventas.listarVentasTotal();
                            request.setAttribute("totalVentas", noVentas);

                        %>
                        <p><b>Numero de Ventas:</b></p>
                        <p>${totalVentas}</p>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        <%                            int noVentasOnline;
                            noVentasOnline = ventas.listarVentasOnline();
                            request.setAttribute("totalVentasOnline", noVentasOnline);

                        %>
                        <p><b>Ventas en Línea:</b></p>
                        <p>${totalVentasOnline}</p>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        <%                            int noVentasF;
                            noVentasF = ventas.listarVentasFisicas();
                            request.setAttribute("totalVentasFisicas", noVentasF);

                        %>
                        <p><b>Ventas Físicas:</b></p>
                        <p>${totalVentasFisicas}</p>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        <%                            int totalVentas;
                            totalVentas = ventas.listarTotal();
                            request.setAttribute("totalVentas", totalVentas);

                        %>
                        <p><b>Total de ventas:</b></p>
                        <p>Q${totalVentas}</p>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        <%                            ProductoDAO productoDao = new ProductoDAO();
                            int noProductos;
                            noProductos = productoDao.cantidadProductos();
                            request.setAttribute("totalProductos", noProductos);

                        %>
                        <p><b>Cantidad de Productos:</b></p>
                        <p>${totalProductos}</p>
                    </div>
                    <div class="alert alert-primary" role="alert">
                        <%                            ClientesDAO clientes = new ClientesDAO();
                            int noClientes;
                            noClientes = clientes.cantidadClientes();
                            request.setAttribute("totalClientes", noClientes);
                        %>
                        <p><b>Cantidad de Clientes:</b></p>
                        <p>${totalClientes}</p>
                    </div>
                </div>
                <br><br>

                <p>
                    <a class="btn-usuario" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Listar</a>
                    <span style="display: block;"><b>Nota: </b>Para listar resultados por fecha</span>
                </p>
                <div class="row">
                    <div class="col">
                        <div class="collapse multi-collapse" id="multiCollapseExample1">
                            <div class="box-shadow-1" style="padding: 2rem; width: 500px; margin: 0 auto;">
                                <form action="SrvInforme" method="post" >
                                    <label><b>Fecha inicio</b></label>
                                    <input type="date" id="txt_fn_inicio" name="txt_fn_inicio" class="form-control" required>
                                    <label><b>Fecha final</b></label>
                                    <input type="date" id="txt_fn_fin" name="txt_fn_fin" class="form-control" required>
                                    <br>
                                    <button type="submit" class="btn-usuario" name="accion" value="listarInforme">Aceptar</button>
                                </form>
                            </div>                            
                        </div>
                    </div>
                </div>

                <br>
                <c:if test="${listaReporte.size() > 0}">
                    <div style="width: 600px; margin: 0 auto;">
                        <table class="table">
                            <thead style="background-color: var(--color-fondo-oscuro); color: white; text-align: center" >
                                <tr>
                                    <th scope="col">Tipo venta</th>
                                    <th scope="col">Cantidad de ventas</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>    
                            <tbody style="text-align: center;">
                                <%
                                    //InformeDAO informeDao = new InformeDAO();
                                    //List<Reporte> lista = informeDao.listarInforme();
                                    //request.setAttribute("lista", lista);
                                %>
                                <c:forEach var="dato" items="${listaReporte}">
                                    <tr>
                                        <td>${dato.getDescripcion()}</td>
                                        <td>${dato.getCantidad()}</td>
                                        <td>Q${dato.getTotal()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>





                <!-- modal -->
                <div class="container">
                    <div class="modal fade" id="modal_empleado" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 style="text-align: center;" class="modal-title" id="staticBackdropLabel"><b>Actualización de datos</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="SrvAcceso" method="post">
                                        <div class="form-group">                                            
                                            <input type="hidden" name="txt_id" id="txt_id" class="form-control" required="" value="${empleado.getId()}">
                                            <label for="txt_cui"><b>CUI</b></label>                                            
                                            <input type="number" name="txt_cui" id="txt_cui" class="form-control" required="" value="${empleado.getCui()}">
                                            <label for="txt_nombres"><b>Nombres</b></label>
                                            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" required="" value="${empleado.getNombres()}">
                                            <label for="txt_apellidos"><b>Apellidos</b></label>
                                            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" required="" value="${empleado.getApellidos()}">
                                            <label for="txt_correo"><b>Correo</b></label>
                                            <input type="email" name="txt_correo" id="txt_correo" class="form-control" required="" value="${empleado.getCorreo()}">
                                            <label for="txt_pass"><b>Contraseña</b></label>
                                            <input type="password" name="txt_pass" id="txt_pass" class="form-control" required="" value="${empleado.getPassword()}">
                                            <label for="txt_direccion"><b>Direccion</b></label>
                                            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" required="" value="${empleado.getDireccion()}">
                                            <label for="txt_telefono"><b>Teféfono</b></label>
                                            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required="" value="${empleado.getTelefono()}">
                                            <label for="txt_fn"><b>Fecha nacimiento</b></label>
                                            <input type="date" name="txt_fn" id="txt_fn" class="form-control" required="" value="${empleado.getFn()}">
                                            <input type="hidden" name="txt_idUsuario" id="txt_idUsuario" class="form-control" required="" value="${empleado.getId_usuario()}">
                                            <input type="hidden" name="txt_idEstado" id="txt_idEstado" class="form-control" required="" value="${empleado.getId_estado()}">
                                        </div>
                                        <button type="submit" name="accion" class="btn-usuario" value="modificarEmpleado">Modificar</button>
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <%            } else {
                response.sendRedirect("admin.jsp");
            }
        %>
    </body>
</html>
