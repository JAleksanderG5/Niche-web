
package Controlador;

import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SrvEmpleado extends HttpServlet {
    
    Empleado empleado;
    EmpleadoDAO empleadoDao = new EmpleadoDAO();

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        empleado = new Empleado(Integer.valueOf(request.getParameter("txt_id")), Integer.valueOf(request.getParameter("txt_cui")), request.getParameter("txt_nombres"),
                request.getParameter("txt_apellidos"), request.getParameter("txt_correo"), request.getParameter("txt_pass"),
                request.getParameter("txt_direccion"), Integer.valueOf(request.getParameter("txt_telefono")), request.getParameter("txt_fn"),
                Integer.valueOf(request.getParameter("drop_usuario")),Integer.valueOf(request.getParameter("drop_estado")));

        if (accion.equals("agregar")) {
            if (empleadoDao.agregar(empleado) > 0) {
                response.sendRedirect("empleados.jsp");
            } else {
                request.getRequestDispatcher("admin.jsp");
            }
        }

        if (accion.equals("modificar")) {
            if (empleadoDao.modificar(empleado) > 0) {
                response.sendRedirect("empleados.jsp");
            } else {
                request.getRequestDispatcher("admin.jsp");
            }
        }
        
        
        if (accion.equals("eliminar")) {
            if (empleadoDao.eliminar(empleado) > 0) {
                response.sendRedirect("empleados.jsp");
            } else {
                response.sendRedirect("admin.jsp");
            }
        }
        
        if (accion.equals("modificarUsuario")) {
            if (empleadoDao.modificar(empleado) > 0) {
                response.sendRedirect("SrvAcceso?accion=cerrar");
            } else {
                request.getRequestDispatcher("admin.jsp");
            }
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
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
