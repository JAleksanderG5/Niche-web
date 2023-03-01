package Controlador;

import Modelo.Pedidos;
import Modelo.PedidosDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class SrvPedido extends HttpServlet {

    PedidosDAO pedidosDao = new PedidosDAO();
    Pedidos pedidos = new Pedidos();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "ver":
                response.sendRedirect("compras.jsp");
                break;

            //***************** métodos para carrito de ventas *************************    
            default:
                response.sendRedirect("admin.jsp");
                break;

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        switch (accion) {
            case "modificar":
                String guia = request.getParameter("txt_guia");
                int id_seguimiento = Integer.valueOf(request.getParameter("drop_seguimiento"));
                int id_pedido = Integer.valueOf(request.getParameter("txt_id"));

                pedidos.setGuia_transporte(guia);
                pedidos.setId_seguimiento(id_seguimiento);
                pedidos.setId_pedido(id_pedido);
                pedidosDao.modificar(pedidos);
                response.sendRedirect("pedidos.jsp");

                break;
            case "eliminar":
                
                int idPedido = Integer.valueOf(request.getParameter("txt_id"));
                pedidos.setId_pedido(idPedido);
                pedidosDao.eliminar(pedidos);
                response.sendRedirect("pedidos.jsp");
                //int id_eliminar = Integer.valueOf(request.getParameter("txt_id"));
                //producto.setId_producto(id_eliminar);
                //productoDao.eliminar(producto);
                //response.sendRedirect("productos.jsp");
                break;
            
            case "ver":
                response.sendRedirect("compras.jsp");
                break;

            //***************** métodos para carrito de ventas *************************    
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
