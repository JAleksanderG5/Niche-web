<%@page import="Modelo.SeguimientoPedido"%>
<%@page import="Modelo.PedidosDAO"%>
<%@page import="Modelo.Promocion"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ProductoDAO"%>
<%@page session="true"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <title>Niche</title>
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

            .btn-opcion-foto{
                background-color: var(--color-fondo-oscuro);
                color: #fcbe6795;
                text-align: center;
                display: inline-block;
                font-size: 0.9rem;
                font-weight: bold;
                cursor: pointer;
                border-radius: 0.5rem;
                border: none;
                padding: 0.75rem;
                transition: all 0.1s ease-out;
                width: 115px;
                height: 50px;
            }

            .btn-opcion-foto:hover{
                text-decoration: none;
                color: var(--color-primario);
                transform: scale(1.02, 1.02)
            }


            img {
                max-width: 100%;
                height: auto;
            }

            .tarjeta{
                height: 350px;
                width: 500px;
                border-radius: 1rem;
                text-align: center;

            }

            .tarjeta-group{
                width: 100%;
                height: auto;
                display: flex;
                justify-content: space-around;
            }

            .tarjeta img{
                width: 500px;
                background-color: blanchedalmond;
                height: inherit;
                object-fit: cover;
                border-radius: 1rem;

            }

        </style>
    </head>
    <body style="font-family:'Nunito Sans', sans-serif" onload="asignar();">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("correo") != null) && ((session.getAttribute("rol") == "1") || (session.getAttribute("rol") == "2"))) {
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
                    <a href="admin.jsp" >Informe Ventas</a>
                </nav>
            </section>
            <section class=" contenedor-contenido">




                <c:forEach var="dato" items="${listaPedidoDetalle}">
                    <div class="encabezado-group">
                        <p>Detalle Pedido #${dato.getId_pedido()}<p>
                            <a href="pedidos.jsp" class="btn-usuario" >
                            Regresar
                        </a> 
                    </div>

                    <p>
                        <a class="btn-usuario" type="button" data-toggle="collapse" data-target="#detalles" aria-expanded="false" aria-controls="detalles">
                            Ver Productos
                        </a>
                        <c:if test="${dato.getId_seguimiento()>2 && dato.getId_tipo_pago()<2 && dato.getId_seguimiento()<6}">
                            <button class="btn-usuario" type="button" data-toggle="collapse" data-target="#imagenPago" aria-expanded="false" aria-controls="imagenPago">
                                Imagen Pago
                            </button>                            
                        </c:if>
                    </p>

                    <div class="collapse" id="detalles">
                        <div class="card card-body">
                            <section class="contenedor-tabla">
                                <a href="SrvProducto?action=liberar&idPed=${dato.getId_pedido()}" class="btn-usuario" style="font-size: 1rem;">Liberar productos</a>
                                <br>
                                <br>
                                <table class="table">
                                    <thead style="background-color: var(--color-fondo-oscuro); color: white" >
                                        <tr>
                                            <th>Código</th>
                                            <th>Producto</th>
                                            <th>Detalle</th>
                                            <th>Imagen</th>
                                            <th>Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody id="">
                                        <c:forEach var="detalle" items="${dato.getDetallecompras()}">
                                            <tr>
                                                <td>${detalle.getId_producto()}</td>
                                                <td>${detalle.getNombre()}</td>
                                                <td>${detalle.getDetalle()}</td>
                                                <td>
                                                    <img src="SrvProductoIMG?id=${detalle.getId_producto()}" style="width: 100px; height: 100px; object-fit: cover; background-color: var(--color-fondo); border-radius: 0.25rem;">
                                                </td>
                                                <td>${detalle.getPrecio()}</td>                                                        
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </section>
                        </div>
                    </div>
                    <div class="collapse" id="imagenPago">
                        <div class="card card-body">
                            <div class="tarjeta-group" id="formFoto">
                                <div class="tarjeta">
                                    <img src="SrvPedidoIMG?idPago=${dato.getId_pedido()}" id="imagen" alt="Pago de pedido">                                        
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <br>
                <c:forEach var="dato" items="${listaPedidoDetalle}">
                    <div class="box-shadow-1" style="width: 550px; padding: 2rem; margin: 0 auto 2rem auto;">  
                        <form action="SrvPedido" method="post" class="form-group" enctype="multipart/form-data">
                            <label for="txt_id"><b>No. pedido</b></label>                                            
                            <input type="number" name="txt_id" id="txt_id" class="form-control" value="${dato.getId_pedido()}" required readonly>
                            <label for="txt_detalle"><b>Detalle</b></label>
                            <input type="text" name="txt_detalle" id="txt_detalle" class="form-control" value="${dato.getDetalle()}" required readonly>
                            <label for="txt_sub_total"><b>Sub-total</b></label>                                            
                            <input type="text" name="txt_sub_total" id="txt_sub_total" class="form-control" value="${dato.getSub_total()}" required readonly>
                            <label for="txt_total"><b>Total</b></label>                                            
                            <input type="text" name="txt_total" id="txt_total" class="form-control" value="${dato.getTotal()}" required readonly>
                            <label for="txt_fn"><b>Fecha</b></label>
                            <input type="date" name="txt_fn" id="txt_fn" class="form-control" value="${dato.getFecha()}" required readonly>
                            <label for="txt_guia"><b>Guía transporte</b></label>
                            <input type="text" name="txt_guia" id="txt_guia" class="form-control" value="${dato.getGuia_transporte()}" >
                            <label for="txt_cliente"><b>Cliente</b></label>
                            <input type="text" name="txt_cliente" id="txt_cliente" class="form-control" value="${dato.getCliente()}" required readonly>
                            <label for="txt_pago"><b>Pago</b></label>
                            <input type="text" name="txt_pago" id="txt_pago" class="form-control" value="${dato.getPago()}" required readonly>
                            <label for="drop_seguimiento"><b>Seguimiento</b></label>
                            <input type="hidden" name="txt_prueba" id="txt_prueba" class="form-control" value="${dato.getId_seguimiento()}" required readonly>
                            <select name="drop_seguimiento" id="drop_seguimiento" class="form-control" required>
                                <%
                                    SeguimientoPedido seguimiento = new SeguimientoPedido();
                                    HashMap<String, String> drop = seguimiento.drop_seguimiento();
                                    for (String i : drop.keySet()) {
                                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                    }
                                %>
                            </select>                                        

                            <div class="file-image-group" id="file-image-group" style="display: none;">
                                <label for="file_image"><b>Imagen</b></label>                                            
                                <input type="file" name="file_image" id="file_image" class="form-control" >                                            
                            </div>

                            <br>                            
                            <button id="btn_modificar" type="submit" name="accion" class="btn-opcion-modal" value="modificar" style="display:inline-block;">Modificar</button>
                            <button id="btn_eliminar" type="submit" name="accion" class="btn-opcion-modal" value="eliminar" style="display:inline-block;" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                        return false">Eliminar</button>
                        </form>
                    </div>
                </c:forEach>


            </section>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script>


                                function asignar() {

                                    let id_p = document.getElementById('txt_prueba').value;
                                    $("#drop_seguimiento").val(id_p);
                                    
                                }




        </script>



        <%            } else {
                response.sendRedirect("admin.jsp");
            }
        %> 
    </body> 

</html>
