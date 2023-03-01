<%@page import="Modelo.TipoVenta"%>
<%@page import="Modelo.VentasDAO"%>
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
                    <p>Ventas<p>
                        <button id="btn_modal" type="button" class="btn-usuario" data-toggle="modal" data-target="#modal_ventas" onclick="activarBtn(), limpiar()">Nueva venta</button>
                </div>

                <div class="cont">

                    <div class="modal fade" id="modal_ventas" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">  
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 style="text-align: center;" class="modal-title" id="staticBackdropLabel"><b>Datos empleado</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="desactivarBtn()">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="SrvVentas" method="post" class="form-group">                                                                                 
                                        <label for="txt_id"><b>No. venta</b></label>
                                        <input type="number" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                        <label for="txt_detalle"><b>Detalle</b></label>
                                        <input type="text" name="txt_detalle" id="txt_detalle" class="form-control" required>
                                        <label for="txt_total"><b>Total</b></label>
                                        <input type="number" name="txt_total" id="txt_total" class="form-control" required>
                                        <label for="txt_fn"><b>Fecha</b></label>
                                        <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                                        <label for="txt_pedido"><b>No. Pedido</b></label>
                                        <input type="number" name="txt_pedido" id="txt_pedido" class="form-control" value="1">
                                        <label for="drop_empleado"><b>Empleado</b></label>
                                        <select name="drop_empleado" id="drop_empleado" class="form-control" required>
                                            <%
                                                EmpleadoDAO empleadoDao = new EmpleadoDAO();
                                                HashMap<String, String> dropE = empleadoDao.drop_empleado();
                                                for (String i : dropE.keySet()) {
                                                    out.println("<option value='" + i + "'>" + dropE.get(i) + "</option>");
                                                }
                                            %>                                            
                                        </select>                                        
                                        
                                        <label for="drop_tipo_venta"><b>Tipo de venta</b></label><br>
                                        <select name="drop_tipo_venta" id="drop_tipo_venta" class="form-control">
                                            <%
                                                TipoVenta tipoVenta = new TipoVenta();
                                                HashMap<String, String> drop = tipoVenta.drop_tipo_venta();
                                                for (String i : drop.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
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
                                <th scope="col">No. Venta</th>
                                <th scope="col">Detalle</th>
                                <th scope="col">Total</th>
                                <th scope="col">Fecha</th>
                                <!--<th scope="col">No. Pedido</th>-->
                                <th scope="col">Empleado</th>
                                <th scope="col">Tipo venta</th>
                            </tr>
                        </thead>
                        <tbody id="tbl_ventas">
                            <%
                                VentasDAO ventasDao = new VentasDAO();
                                DefaultTableModel tabla = new DefaultTableModel();
                                tabla = ventasDao.leer();
                                for (int i = 0; i < tabla.getRowCount(); i++) {
                                    out.println("<tr data-id_empleado=" + tabla.getValueAt(i, 6) + " data-id_tipo_venta=" + tabla.getValueAt(i, 8) + ">");
                                    out.println("<td>" + tabla.getValueAt(i, 0) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 1) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 2) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 3) + "</td>");
                                    out.println("<td style='display: none;'>" + tabla.getValueAt(i, 4) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 5) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(i, 7) + "</td>");
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
                                                $("#txt_detalle").val('');
                                                $("#txt_total").val('');
                                                $("#txt_fn").val('');
                                                $("#txt_pedido").val('1');
                                                $("#drop_empleado").val(1);
                                                $("#drop_tipo_venta").val(1);
                                                
                                            }


                                            $('#tbl_ventas').on('click', 'tr td', function (evt) {

                                                var target, id_venta, id_empleado, id_tipo_venta, detalle, total, fecha, id_pedido;
                                                target = $(event.target);
                                                id_empleado = target.parent().data('id_empleado');                                                
                                                id_tipo_venta = target.parent().data('id_tipo_venta');
                                                id_venta = target.parent("tr").find("td").eq(0).html();
                                                detalle = target.parent("tr").find("td").eq(1).html();
                                                total = target.parent("tr").find("td").eq(2).html();
                                                fecha = target.parent("tr").find("td").eq(3).html();
                                                id_pedido = target.parent("tr").find("td").eq(4).html();                                                

                                                $("#txt_id").val(id_venta);
                                                $("#txt_detalle").val(detalle);
                                                $("#txt_total").val(total);
                                                $("#txt_fn").val(fecha);
                                                $("#txt_pedido").val(id_pedido);
                                                $("#drop_empleado").val(id_empleado);
                                                $("#drop_tipo_venta").val(id_tipo_venta);
                                                $("#modal_ventas").modal('show');                                                
                                                
                                                
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
