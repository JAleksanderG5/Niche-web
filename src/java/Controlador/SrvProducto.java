package Controlador;

import Modelo.Carrito;
import Modelo.Fecha;
import Modelo.Pedidos;
import Modelo.PedidosDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class SrvProducto extends HttpServlet {

    ProductoDAO productoDao = new ProductoDAO();
    Producto producto = new Producto();
    PedidosDAO pedidosDao = new PedidosDAO();
    Pedidos pedidos = new Pedidos();
    List<Carrito> listaCarrito = new ArrayList<>();
    List<Producto> productoDetalle = new ArrayList<>();
    List<Producto> listaProductoElim = new ArrayList<>();
    List<Pedidos> listaPedidos = new ArrayList<>();
    List<Pedidos> listaPedidoDetalle = new ArrayList<>();

    int cantidad = 1;
    int item;
    int totalPagar;
    int totalPagarEnvio;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        int id_producto;
        int id_cat;
        Carrito carrito;
        String result;

        switch (action) {
            case "agregarCarrito":
                int posicion = 0;
                cantidad = 1;

                id_producto = Integer.parseInt(request.getParameter("id"));
                id_cat = Integer.parseInt(request.getParameter("id_cat"));
                producto = productoDao.listarId(id_producto);

                if (listaCarrito.size() > 0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (id_producto == listaCarrito.get(i).getId_producto()) {
                            posicion = i;
                        }
                    }

                    if (id_producto == listaCarrito.get(posicion).getId_producto()) {
                        cantidad = listaCarrito.get(posicion).getCantidad();
                        int subtotal = listaCarrito.get(posicion).getPrecio() * cantidad;
                        listaCarrito.get(posicion).setCantidad(cantidad);
                        listaCarrito.get(posicion).setSub_total(subtotal);
                    } else {
                        item = item + 1;
                        carrito = new Carrito();
                        carrito.setItem(item);
                        carrito.setId_producto(producto.getId_producto());
                        carrito.setNombre(producto.getNombre());
                        carrito.setCategoria(producto.getCategoria());
                        carrito.setDetalle(producto.getDetalle());
                        carrito.setMarca(producto.getMarca());
                        carrito.setColor(producto.getColor());
                        carrito.setPrecio(producto.getPrecio());
                        carrito.setCantidad(cantidad);
                        carrito.setSub_total(cantidad * producto.getPrecio());
                        listaCarrito.add(carrito);
                    }
                } else {
                    item = item + 1;
                    carrito = new Carrito();
                    carrito.setItem(item);
                    carrito.setId_producto(producto.getId_producto());
                    carrito.setNombre(producto.getNombre());
                    carrito.setCategoria(producto.getCategoria());
                    carrito.setDetalle(producto.getDetalle());
                    carrito.setMarca(producto.getMarca());
                    carrito.setColor(producto.getColor());
                    carrito.setPrecio(producto.getPrecio());
                    carrito.setCantidad(cantidad);
                    carrito.setSub_total(cantidad * producto.getPrecio());
                    listaCarrito.add(carrito);
                }

                if (listaCarrito.isEmpty()) {
                    result = "0";
                } else {
                    result = "1";
                }
                sesion.setAttribute("listaEstadoCarrito", result);
                request.setAttribute("contador", listaCarrito.size());

                productoDao.modificarEstado(id_producto);

                if (id_cat == 1) {
                    request.getRequestDispatcher("damas.jsp").forward(request, response);
                } else if (id_cat == 2) {
                    request.getRequestDispatcher("caballeros.jsp").forward(request, response);
                } else if (id_cat == 3) {
                    request.getRequestDispatcher("niños.jsp").forward(request, response);
                } else if (id_cat == 4){
                    request.getRequestDispatcher("accesorios.jsp").forward(request, response);
                }

                break;
            case "Carrito":
                totalPagar = 0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSub_total();
                }

                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);

                if (listaCarrito.isEmpty()) {
                    result = "0";
                } else {
                    result = "1";
                }
                sesion.setAttribute("listaEstadoCarrito", result);
                break;
            case "CarritoSalir":
                totalPagar = 0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSub_total();
                }


                if (listaCarrito.isEmpty()) {
                    result = "0";
                } else {
                    result = "1";
                }
                sesion.setAttribute("listaEstadoCarrito", result);
                request.setAttribute("totalPagar", totalPagar);
                //response.sendRedirect("carrito.jsp");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "eliminarProductosCarrito":

                listaCarrito.clear();
                if (listaCarrito.isEmpty()) {
                    result = "0";
                } else {
                    result = "1";
                }
                sesion.setAttribute("listaEstadoCarrito", result);
                response.sendRedirect("index.jsp");
                // request.getRequestDispatcher("SrvProducto?action=Carrito").forward(request, response);
                break;

            case "listarPedidos":

                int id_p = Integer.valueOf(request.getParameter("id_p"));

                request.setAttribute("prueba", id_p);

                listaPedidos = pedidosDao.listarPedidos(id_p);
                request.setAttribute("listaPedido", listaPedidos);
                request.getRequestDispatcher("compras.jsp").forward(request, response);
                break;
            case "listarPedidoDetalle":

                int idPedidoDetalle = Integer.valueOf(request.getParameter("id"));
                listaPedidoDetalle = pedidosDao.listarPedidosDetalles(idPedidoDetalle);
                request.setAttribute("listaPedidoDetalle", listaPedidoDetalle);
                request.getRequestDispatcher("detallePedido.jsp").forward(request, response);
                break;
            case "liberar":
                int idPed = Integer.valueOf(request.getParameter("idPed"));

                listaProductoElim = productoDao.listarProductos(idPed);

                for (int i = 0; i < listaProductoElim.size(); i++) {
                    productoDao.modificarEstadoActivo(listaProductoElim.get(i).getId_producto());
                    productoDao.modificarCarrito(listaProductoElim.get(i).getId_producto());
                }
                ;

                request.setAttribute("listaConProductos", listaProductoElim);
                request.getRequestDispatcher("SrvProducto?action=listarPedidoDetalle&id=" + idPed).forward(request, response);
                
                break;
            default:
                request.getRequestDispatcher("damas.jsp").forward(request, response);
                break;
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();

        switch (accion) {
            case "agregar":
                String nombre = request.getParameter("txt_nombre");
                String detalle = request.getParameter("txt_detalle");
                String marca = request.getParameter("txt_marca");
                String talla = request.getParameter("txt_talla");
                String color = request.getParameter("txt_color");
                int precio = Integer.valueOf(request.getParameter("txt_precio"));
                int estado = Integer.valueOf(request.getParameter("txt_estado"));
                String fecha = request.getParameter("txt_fn");
                int categoria = Integer.valueOf(request.getParameter("drop_categoria"));
                int promocion = Integer.valueOf(request.getParameter("drop_promocion"));
                Part part = request.getPart("file_image");
                InputStream inputStream = part.getInputStream();
                producto.setNombre(nombre);
                producto.setDetalle(detalle);
                producto.setMarca(marca);
                producto.setTalla(talla);
                producto.setColor(color);
                producto.setPrecio(precio);
                producto.setEstado(estado);
                producto.setFecha(fecha);
                producto.setId_categoria(categoria);
                producto.setId_promocion(promocion);
                producto.setImagen(inputStream);
                productoDao.agregar(producto);
                response.sendRedirect("productos.jsp");
                break;
            case "modificar":
                int id = Integer.valueOf(request.getParameter("txt_id"));
                String nombreM = request.getParameter("txt_nombre");
                String detalleM = request.getParameter("txt_detalle");
                String marcaM = request.getParameter("txt_marca");
                String tallaM = request.getParameter("txt_talla");
                String colorM = request.getParameter("txt_color");
                int precioM = Integer.valueOf(request.getParameter("txt_precio"));
                int estadoM = Integer.valueOf(request.getParameter("txt_estado"));
                String fechaM = request.getParameter("txt_fn");
                int categoriaM = Integer.valueOf(request.getParameter("drop_categoria"));
                int promocionM = Integer.valueOf(request.getParameter("drop_promocion"));

                producto.setId_producto(id);
                producto.setNombre(nombreM);
                producto.setDetalle(detalleM);
                producto.setMarca(marcaM);
                producto.setTalla(tallaM);
                producto.setColor(colorM);
                producto.setPrecio(precioM);
                producto.setEstado(estadoM);
                producto.setFecha(fechaM);
                producto.setId_categoria(categoriaM);
                producto.setId_promocion(promocionM);
                productoDao.modificar(producto);

                response.sendRedirect("productos.jsp");
                break;
            case "modificarFoto":
                int idNueva = Integer.valueOf(request.getParameter("txt_idNueva"));
                Part partNueva = request.getPart("fileFotoNueva");
                InputStream inputStreamNueva = partNueva.getInputStream();
                producto.setId_producto(idNueva);
                producto.setImagen(inputStreamNueva);
                productoDao.modificarFoto(producto);
                response.sendRedirect("productos.jsp");

                break;
            case "eliminar":
                int id_eliminar = Integer.valueOf(request.getParameter("txt_id"));
                producto.setId_producto(id_eliminar);
                productoDao.eliminar(producto);
                response.sendRedirect("productos.jsp");
                break;
            case "verDetalle":
                int idDetalle = Integer.valueOf(request.getParameter("id_detalle"));
                productoDetalle = productoDao.listarDetalle(idDetalle);
                request.setAttribute("productosDetalle", productoDetalle);
                request.getRequestDispatcher("damas.jsp").forward(request, response);
                // response.sendRedirect("damas.jsp");
                break;

            /*Métodos para Carrito de compras*/
            case "Carrito":
                totalPagar = 0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSub_total();
                }
                String result;
                if (listaCarrito.isEmpty()) {
                    result = "0";
                } else {
                    result = "1";
                }

                sesion.setAttribute("listaEstadoCarrito", result);

                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);

                break;
            case "EliminarProducto":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getId_producto() == idproducto) {
                        listaCarrito.remove(i);
                        productoDao.modificarEstadoActivo(idproducto);
                    }

                }
                break;
            //****************** OPCIONES PARA PEDIDIOS **************************
            case "registrarPedido":
                

                pedidos.setId_pedido(0);
                pedidos.setDetalle("Compra en línea");
                pedidos.setSub_total(Integer.valueOf(request.getParameter("txt_subtotal")));
                pedidos.setTotal(Integer.valueOf(request.getParameter("total")));
                pedidos.setFecha(Fecha.FechaBD());
                pedidos.setId_cliente(Integer.valueOf(request.getParameter("txt_idCliente")));
                pedidos.setId_tipo_pago(Integer.valueOf(request.getParameter("drop_pago")));
                pedidos.setId_seguimiento(1);
                pedidos.setDetallecompras(listaCarrito);

                int resultado = pedidosDao.generarCompra(pedidos);

                if (resultado != 0 && totalPagar > 0) {
                    listaCarrito.clear();
                    if (listaCarrito.isEmpty()) {
                        result = "0";
                    } else {
                        result = "1";
                    }
                    sesion.setAttribute("listaEstadoCarrito", result);
                    response.sendRedirect("index.jsp");
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case "registrarPagoImg":

                int idCliente = (Integer.valueOf(request.getParameter("txt_idCliente")));

                pedidos.setId_pedido(Integer.valueOf(request.getParameter("txt_idPedido")));
                Part partPedidoImg = request.getPart("file_image");
                InputStream inputStreamPedidoImg = partPedidoImg.getInputStream();
                pedidos.setImagen_pago(inputStreamPedidoImg);
                pedidosDao.modificarFoto(pedidos);
                response.sendRedirect("SrvProducto?action=listarPedidos&id_p=" + idCliente);
                break;

            default:
                response.sendRedirect("admin.jsp");
                break;
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
