package Controlador;

import Modelo.InformeDAO;
import Modelo.Reporte;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SrvInforme extends HttpServlet {
    
    
    InformeDAO informeDao = new InformeDAO();
    Reporte reporte = new Reporte();
    List<Reporte> listaReporte = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

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
            case "listarInforme":
                
                String fechaInicio = request.getParameter("txt_fn_inicio");
                String fechaFin = request.getParameter("txt_fn_fin");
                
                reporte.setFechaInicio(fechaInicio);
                reporte.setFechaFin(fechaFin);
                listaReporte = informeDao.listarInformeFecha(reporte);
                
                
                
                //List<Reporte> lista = informeDao.listarInforme();
                //request.setAttribute("lista", lista);
                
                
                request.setAttribute("listaReporte", listaReporte);
                request.getRequestDispatcher("informe.jsp").forward(request, response);
                //response.sendRedirect("informe.jsp");
                break;
            default:
                response.sendRedirect("admin.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
