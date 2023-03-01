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
                transition: all 1s ease-in-out;
            }

            .tarjeta img:hover{
                transform: scale(1.5, 1.5);
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
                    <p>Productos<p>
                        <button type="button" class="btn-usuario" data-toggle="modal" data-target="#modal_producto" onclick="desactivarCard(), activarBtn(), limpiar(), activarFileImg()">Nuevo producto</button>
                </div>

                <div class="cont">

                    <div class="modal fade" id="modal_producto" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 style="text-align: center;" class="modal-title" id="staticBackdropLabel"><b>Datos productos</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="activarCard(), desactivarForm(), desactivarBtn(), desactivarFileImg()">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <section class="tarjeta-section" id="tarjeta-section">                                        
                                        <div class="tarjeta-group" id="tarjeta-group">
                                            <div class="tarjeta">
                                                <img src="" id="imagen" alt="artículo de vestir">                                        
                                            </div>
                                            <div>
                                                <button id="btn_editar_img" type="submit" name="" class="btn-opcion-modal" value="" onclick="activarForm()">Cambiar img</button> 
                                            </div>
                                        </div>
                                        <br>
                                        <form action="SrvProducto" method="post" class="form-group" style="display: none;" id="formFoto" enctype="multipart/form-data">
                                            <hr>
                                            <input type="number" name="txt_idNueva" id="txt_idNueva" class="form-control" value="0" readonly required style="display:none;" >
                                            <label>Seleccione la nueva imagen</label>
                                            <input type="file" name="fileFotoNueva" required>                                            
                                            <button type="submit" name="accion" class="btn-opcion-foto" value="modificarFoto">Aceptar</button> 
                                            <hr>
                                        </form>
                                    </section>



                                    <form action="SrvProducto" method="post" class="form-group" enctype="multipart/form-data">
                                        <label for="txt_id"><b>Código</b></label>                                            
                                        <input type="number" name="txt_id" id="txt_id" class="form-control" value="0" required readonly>
                                        <label for="txt_nombre"><b>Nombre</b></label>                                            
                                        <input type="text" name="txt_nombre" id="txt_nombre" class="form-control" required>
                                        <label for="txt_detalle"><b>Detalle</b></label>
                                        <input type="text" name="txt_detalle" id="txt_detalle" class="form-control" required>
                                        <label for="txt_marca"><b>Marca</b></label>
                                        <input type="text" name="txt_marca" id="txt_marca" class="form-control" required>
                                        <label for="txt_talla"><b>Talla</b></label>
                                        <input type="text" name="txt_talla" id="txt_talla" class="form-control" required>                                        
                                        <label for="txt_color"><b>Color</b></label>
                                        <input type="text" name="txt_color" id="txt_color" class="form-control" required>   
                                        <label for="txt_precio"><b>Precio</b></label>
                                        <input type="number" name="txt_precio" id="txt_precio" class="form-control" required>
                                        <label for="txt_estado"><b>Estado</b></label>                                            
                                        <input type="number" name="txt_estado" id="txt_estado" class="form-control" value="1" required readonly>
                                        <label for="txt_fn"><b>Fecha ingreso</b></label>
                                        <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                                        <label for="drop_categoria"><b>Categoría</b></label>
                                        <select name="drop_categoria" id="drop_categoria" class="form-control" required>
                                            <%
                                                Categoria cat = new Categoria();
                                                HashMap<String, String> dropC = cat.drop_categoria();
                                                for (String i : dropC.keySet()) {
                                                    out.println("<option value='" + i + "'>" + dropC.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                        <label for="drop_promocion"><b>Promoción</b></label>
                                        <select name="drop_promocion" id="drop_promocion" class="form-control" required>
                                            <%
                                                Promocion prom = new Promocion();
                                                HashMap<String, String> dropP = prom.drop_promocion();
                                                for (String i : dropP.keySet()) {
                                                    out.println("<option value='" + i + "'>" + dropP.get(i) + "</option>");
                                                }
                                            %>
                                        </select>                                        
                                        <div class="file-image-group" id="file-image-group" style="display: none;">
                                            <label for="file_image"><b>Imagen</b></label>                                            
                                            <input type="file" name="file_image" id="file_image" class="form-control">                                            
                                        </div>

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
                                <th scope="col">Código</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Talla</th>
                                <th scope="col">Color</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Fecha ingreso</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Promoción</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_productos">                         

                            <%
                                ProductoDAO productoDao = new ProductoDAO();
                                List<Producto> lista = productoDao.listar();

                                request.setAttribute("lista", lista);
                            %>  
                            <c:forEach var="dato" items="${lista}">
                                <c:if test="${dato.getEstado()>1}">
                                    <tr style="background-color: var(--color-fondo-2)" data-id="${dato.getId_producto()}" data-id_categoria="${dato.getId_categoria()}" data-id_promocion="${dato.getId_promocion()}">
                                        <td>${dato.getId_producto()}</td>
                                        <td>${dato.getNombre()}</td>
                                        <td style="display:none;">${dato.getDetalle()}</td>
                                        <td>${dato.getMarca()}</td>
                                        <td>${dato.getTalla()}</td>
                                        <td>${dato.getColor()}</td>
                                        <td>${dato.getPrecio()}</td>
                                        <td style="display:none;">${dato.getEstado()}</td>
                                        <td>${dato.getFecha()}</td>
                                        <td>${dato.getCategoria()}</td>
                                        <td>${dato.getPromocion()}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${dato.getEstado()<2}">
                                    <tr data-id="${dato.getId_producto()}" data-id_categoria="${dato.getId_categoria()}" data-id_promocion="${dato.getId_promocion()}">
                                        <td>${dato.getId_producto()}</td>
                                        <td>${dato.getNombre()}</td>
                                        <td style="display:none;">${dato.getDetalle()}</td>
                                        <td>${dato.getMarca()}</td>
                                        <td>${dato.getTalla()}</td>
                                        <td>${dato.getColor()}</td>
                                        <td>${dato.getPrecio()}</td>
                                        <td style="display:none;">${dato.getEstado()}</td>
                                        <td>${dato.getFecha()}</td>
                                        <td>${dato.getCategoria()}</td>
                                        <td>${dato.getPromocion()}</td>
                                    </tr>
                                </c:if>
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

                                            function limpiar() {
                                                $("#txt_id").val(0);
                                                $("#txt_idNueva").val(0);
                                                $("#txt_nombre").val('');
                                                $("#txt_detalle").val('');
                                                $("#txt_marca").val('');
                                                $("#txt_talla").val('');
                                                $("#txt_color").val('');
                                                $("#txt_precio").val('');
                                                $("#txt_estado").val(1);
                                                $("#txt_fn").val('');
                                                $("#drop_categoria").val(1);
                                                $("#drop_promocion").val(1);
                                            }


                                            $('#tbl_productos').on('click', 'tr td', function (evt) {
                                                var target, id, id_producto, id_categoria, id_promocion, nombre, detalle, marca, talla, color, precio, estado, fecha; // target, sirve para extraer los elementos de id, id_puesto
                                                target = $(event.target);
                                                id = target.parent().data('id');
                                                id_categoria = target.parent().data('id_categoria');
                                                id_promocion = target.parent().data('id_promocion');
                                                id_producto = target.parent("tr").find("td").eq(0).html();
                                                nombre = target.parent("tr").find("td").eq(1).html();
                                                detalle = target.parent("tr").find("td").eq(2).html();
                                                marca = target.parent("tr").find("td").eq(3).html();
                                                talla = target.parent("tr").find("td").eq(4).html();
                                                color = target.parent("tr").find("td").eq(5).html();
                                                precio = target.parent("tr").find("td").eq(6).html();
                                                estado = target.parent("tr").find("td").eq(7).html();
                                                fecha = target.parent("tr").find("td").eq(8).html();

                                                url = nombreUrl + id_producto;
                                                img.src = url;


                                                $("#txt_id").val(id_producto);
                                                $("#txt_idNueva").val(id_producto);
                                                $("#txt_nombre").val(nombre);
                                                $("#txt_detalle").val(detalle);
                                                $("#txt_marca").val(marca);
                                                $("#txt_talla").val(talla);
                                                $("#txt_color").val(color);
                                                $("#txt_precio").val(precio);
                                                $("#txt_estado").val(estado);
                                                $("#txt_fn").val(fecha);
                                                $("#drop_categoria").val(id_categoria);
                                                $("#drop_promocion").val(id_promocion);
                                                $("#modal_producto").modal('show');
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

                                            function activarForm() {
                                                document.getElementById('formFoto').style.display = "inline-block"; // show
                                            }
                                            function desactivarForm() {
                                                document.getElementById('formFoto').style.display = "none";
                                            }
                                            function desactivarCard() {
                                                document.getElementById('tarjeta-section').style.display = "none";

                                            }
                                            function activarCard() {
                                                document.getElementById('tarjeta-section').style.display = "inline";
                                                img.src = "";
                                            }
                                            function activarFileImg() {
                                                document.getElementById('file-image-group').style.display = "inline";
                                            }
                                            function desactivarFileImg() {
                                                document.getElementById('file-image-group').style.display = "none";
                                            }


        </script>



        <%            } else {
                response.sendRedirect("admin.jsp");
            }
        %> 
    </body> 

</html>
