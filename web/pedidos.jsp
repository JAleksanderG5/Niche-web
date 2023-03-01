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
                width: 300px;
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
                width: 300px;
                background-color: blanchedalmond;
                height: inherit;
                object-fit: cover;
                border-radius: 1rem;

            }

        </style>
    </head>
    <body style="font-family:'Nunito Sans', sans-serif">
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
                    <a href="informe.jsp" >Informe Ventas</a>
                </nav>
            </section>
            <section class="contenedor-contenido">     
                <div class="encabezado-group">
                    <p>Pedidos<p>                        
                </div>

                <section class="contenedor-tabla">
                    <table class="table" style="text-align: center">
                        <thead style="background-color: var(--color-fondo-oscuro); color: white" >
                            <tr>
                                <th scope="col">No. Pedido</th>
                                <th scope="col">Sub-total</th>
                                <th scope="col">Total</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Guía</th>
                                <th scope="col">Id Cliente</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Pago</th>
                                <th scope="col">Seguimiento</th>
                                <th scope="col">Accion</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_pedidos">
                            <%
                                PedidosDAO pedidosDao = new PedidosDAO();
                                List<Producto> lista = pedidosDao.listar();

                                request.setAttribute("lista", lista);
                            %>  
                            <c:forEach var="dato" items="${lista}">
                                <tr data-id_cliente="${dato.getId_cliente()}" data-id_tipo_pago="${dato.getId_tipo_pago()}" data-id_seguimiento="${dato.getId_seguimiento()}">
                                    <td><span id="id_p">${dato.getId_pedido()}</span></td>                                    
                                    <td style="display:none;">${dato.getDetalle()}</td>
                                    <td>${dato.getSub_total()}</td>
                                    <td>${dato.getTotal()}</td>
                                    <td>${dato.getFecha()}</td>
                                    <td>${dato.getGuia_transporte()}</td>
                                    <td>${dato.getId_cliente()}</td>
                                    <td>${dato.getCliente()}</td>
                                    <td>${dato.getPago()}</td>
                                    <td>${dato.getSeguimiento()}</td>                                   
                                    <td><a href="SrvProducto?action=listarPedidoDetalle&id=${dato.getId_pedido()}"><i class="fa-solid fa-pen-to-square"></i></a></td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                            
                            <c:forEach var="det" items="${listaConProductos}">
                                <span>${det.getId_producto()}</span>
                            </c:forEach>
                </section>
            </section>

            




        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script>


        </script>



        <%            } else {
                response.sendRedirect("admin.jsp");
            }
        %> 
    </body> 

</html>
