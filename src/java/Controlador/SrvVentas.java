package Controlador;

import Modelo.Ventas;
import Modelo.VentasDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SrvVentas extends HttpServlet {

    Ventas ventas;
    Ventas ventas2;
    //Ventas ventas2 = new Ventas();
    VentasDAO ventasDao = new VentasDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        ventas = new Ventas(Integer.valueOf(request.getParameter("txt_id")), request.getParameter("txt_detalle"), Integer.valueOf(request.getParameter("txt_total")),
                request.getParameter("txt_fn"), Integer.valueOf(request.getParameter("txt_pedido")), Integer.valueOf(request.getParameter("drop_empleado")),
                Integer.valueOf(request.getParameter("drop_tipo_venta")));

        

        if (accion.equals("agregar")) {    
                          
            
            if (ventasDao.agregar(ventas) > 0) {
                response.sendRedirect("ventas.jsp");
            } else {
                response.sendRedirect("admin.jsp");
            }
        }
        
        if (accion.equals("modificar")) {    
               /*ventas2.setId_venta(Integer.valueOf(request.getParameter("txt_id")));
               ventas2.setDetalle(request.getParameter("txt_detalle"));
               ventas2.setTotal(Integer.valueOf(request.getParameter("txt_total")));
               ventas2.setFecha(request.getParameter("txt_fn"));
               ventas2.setId_pedido(Integer.valueOf(request.getParameter("txt_pedido")));
               ventas2.setId_empleado(Integer.valueOf(request.getParameter("drop_empleado")));
               ventas2.setId_tipo_venta(Integer.valueOf(request.getParameter("drop_tipo_venta")));*/
            
            
            
            if (ventasDao.modificar(ventas) > 0) {
                response.sendRedirect("ventas.jsp");
            } else {
                response.sendRedirect("admin.jsp");
            }
        }
        
        if (accion.equals("eliminar")) { 
            if (ventasDao.eliminar(ventas) > 0) {
                response.sendRedirect("ventas.jsp");
            } else {
                response.sendRedirect("admin.jsp");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
