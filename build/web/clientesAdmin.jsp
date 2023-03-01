<%@page import="Modelo.Clientes"%>
<%@page import="Modelo.ClientesDAO"%>
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
                <h2 style="margin:0; font-size: 2rem">Bienvenid@ al Sistema ...</h2>
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
                    <p>Clientes<p>
                    <form action="SrvCliente" method="post" style="margin-top: -1rem;">
                        <button type="submit" name="accion" id="btnLimpiar" value="listar" class="btn-usuario" data-toggle="modal" onclick="limpiar()">Listar Todos</button>
                        <button type="button" class="btn-usuario" data-toggle="modal" data-target="#modal_buscar">Buscar</button>
                    </form>
                </div>

                <div class="cont">

                    <div class="modal fade" id="modal_cliente" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 style="text-align: center;" class="modal-title" id="staticBackdropLabel">Datos clientes</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">                                    

                                    <form action="SrvProducto" method="post" class="form-group" enctype="multipart/form-data">
                                        <label for="txt_id"><b>Id. Cliente</b></label>                                            
                                        <input type="number" name="txt_id" id="txt_id" class="form-control" required readonly>
                                        <label for="txt_nombres"><b>Nombres</b></label>                                            
                                        <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" required readonly>
                                        <label for="txt_apellidos"><b>Apellidos</b></label>                                            
                                        <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" required readonly>
                                        <label for="txt_correo"><b>Correo</b></label>                                            
                                        <input type="text" name="txt_correo" id="txt_correo" class="form-control" required readonly>
                                        <label for="txt_telefono"><b>Teléfono</b></label>                                            
                                        <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required readonly>
                                        <hr>
                                        <h5 style="text-align: center;" class="modal-title" id="staticBackdropLabel"><b>Datos Envío</b></h5>
                                        <hr>
                                        <label for="txt_dep"><b>Departamento</b></label>                                            
                                        <input type="text" name="txt_dep" id="txt_dep" class="form-control" required readonly>
                                        <label for="txt_mun"><b>Municipio</b></label>                                            
                                        <input type="text" name="txt_mun" id="txt_mun" class="form-control" required readonly>
                                        <label for="txt_direccion"><b>Direccion</b></label>                                            
                                        <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" required readonly>
                                        <label for="txt_referencia"><b>Referencia lugar</b></label>                                            
                                        <input type="text" name="txt_referencia" id="txt_referencia" class="form-control" required readonly>
                                        <label for="txt_recibe"><b>Persona que recibe</b></label>                                            
                                        <input type="text" name="txt_recibe" id="txt_recibe" class="form-control" required readonly>
                                        <label for="txt_tel_recibe"><b>Teléfono</b></label>                                            
                                        <input type="number" name="txt_tel_recibe" id="txt_tel_recibe" class="form-control" required readonly>                                        
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="modal_buscar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">                                    
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">                                   

                                    <form action="SrvCliente" method="post" class="form-group" >
                                        <label for="txt_id_buscar"><b>Ingresar el Id del cliente</b></label>                                            
                                        <input type="number" name="txt_id_buscar" id="txt_id_buscar" class="form-control" required>
                                        <br>
                                        <button type="submit" name="accion" value="listarNombre" class="btn-usuario" data-toggle="modal">Buscar</button>
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>

                </div>

                <section class="contenedor-tabla">
                    <table class="table" style="text-align: center;">
                        <thead style="background-color: var(--color-fondo-oscuro); color: white" >
                            <tr>
                                <th scope="col">Id cliente</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Teléfono</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_clientes" > 


                            <c:forEach var="dato" items="${lista}">
                                <tr data-id="${dato.getId_cliente()}">
                                    <td>${dato.getId_cliente()}</td>
                                    <td>${dato.getNombres()}</td>
                                    <td>${dato.getApellidos()}</td>
                                    <td>${dato.getCorreo()}</td>
                                    <td>${dato.getTelefono()}</td>
                                    <!--<td>${dato.getId_usuario()}</td>-->
                                    <!--<td><a href="SrvProducto?action=listarPedidoDetalle&id=${dato.getId_cliente()}"><i class="fa-solid fa-pen-to-square"></i></a></td>-->
                                    
                                        <c:forEach var="detalle" items="${dato.getListaEnvio()}">
                                            <td style="display: none">${detalle.getDepartamento()}</td>
                                            <td style="display: none">${detalle.getMunicipio()}</td>
                                            <td style="display: none">${detalle.getDireccion()}</td>
                                            <td style="display: none">${detalle.getReferencia()}</td>
                                            <td style="display: none">${detalle.getPersona()}</td>
                                            <td style="display: none">${detalle.getTelefono()}</td>
                                        </c:forEach>
                                   
                                </tr>
                                
                                
                                
                                
                                
                            </c:forEach>
                        </tbody>
                    </table>
                </section>

            </section>




        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script>

                            var img = document.getElementById('imagen');
                            var nombreUrl = "SrvProductoIMG?id=";
                            var url;


                            $('#tbl_clientes').on('click', 'tr td', function (evt) {
                                var target, id_cliente, nombres, apellidos, correo, telefono, departamento, municipio, direccion, referencia, recibe, tel_recibe;
                                target = $(event.target);
                                id_cliente = target.parent("tr").find("td").eq(0).html();
                                nombres = target.parent("tr").find("td").eq(1).html();
                                apellidos = target.parent("tr").find("td").eq(2).html();
                                correo = target.parent("tr").find("td").eq(3).html();
                                telefono = target.parent("tr").find("td").eq(4).html();
                                departamento = target.parent("tr").find("td").eq(5).html();
                                municipio = target.parent("tr").find("td").eq(6).html();
                                direccion = target.parent("tr").find("td").eq(7).html();
                                referencia = target.parent("tr").find("td").eq(8).html();
                                recibe = target.parent("tr").find("td").eq(9).html();
                                tel_recibe = target.parent("tr").find("td").eq(10).html();

                                //url = nombreUrl + id_producto;
                                // img.src = url;

                                $("#txt_id").val(id_cliente);
                                $("#txt_nombres").val(nombres);
                                $("#txt_apellidos").val(apellidos);
                                $("#txt_correo").val(correo);
                                $("#txt_telefono").val(telefono);
                                $("#txt_dep").val(departamento);
                                $("#txt_mun").val(municipio);
                                $("#txt_direccion").val(direccion);
                                $("#txt_referencia").val(referencia);
                                $("#txt_recibe").val(recibe);
                                $("#txt_tel_recibe").val(tel_recibe);
                                $("#modal_cliente").modal('show');

                            });


        </script>



        <%            } else {
                response.sendRedirect("admin.jsp");
            }
        %> 
    </body> 

</html>
