package Controlador;

import Modelo.Clientes;
import Modelo.ClientesDAO;
import Modelo.DatosEnvio;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SrvCliente extends HttpServlet {

    DatosEnvio datosEnvio = new DatosEnvio();

    //Clientes clientes = new Clientes();
    //ClientesDAO clientesDao = new ClientesDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //HttpSession sesion = request.getSession();
        HttpSession sesion = request.getSession();
        String action = request.getParameter("action");

        switch (action) {
            case "listarDatosEnvio":
                int id = Integer.valueOf(request.getParameter("id_c"));

                if (datosEnvio.obtenerDatosEnvio(id) == 1) {
                    request.setAttribute("datosEnvio", datosEnvio);
                    request.setAttribute("Encontrado", "1");
                } else {
                    request.setAttribute("Encontrado", "0");
                }
                request.getRequestDispatcher("datosEnvio.jsp").forward(request, response);
                //response.sendRedirect("datosEnvio.jsp");
                break;

            default:
                request.getRequestDispatcher("clientes.jsp").forward(request, response);

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

        ClientesDAO clientesDao = new ClientesDAO();
        Clientes clientes = new Clientes();
        //List<Clientes> lista = clientesDao.listar();

        switch (accion) {
            case "listar":
                List<Clientes> listaClientes = clientesDao.listarTodos();
                request.setAttribute("lista", listaClientes);
                request.getRequestDispatcher("clientesAdmin.jsp").forward(request, response);
                break;
            case "listarNombre":
                int idBuscar = Integer.valueOf(request.getParameter("txt_id_buscar"));
                List<Clientes> listas = clientesDao.listarNombre(idBuscar);

                if (listas.size() > 0) {
                    request.setAttribute("lista", listas);

                } else {
                List<Clientes> listaCli = clientesDao.listarId(idBuscar);
                    request.setAttribute("lista", listaCli);
                }

                request.getRequestDispatcher("clientesAdmin.jsp").forward(request, response);
                break;
            case "ingresarDatosEnvio":
                datosEnvio.setDepartamento(request.getParameter("txt_departamento"));
                datosEnvio.setMunicipio(request.getParameter("txt_municipio"));
                datosEnvio.setDireccion(request.getParameter("txt_dir_exacta"));
                datosEnvio.setReferencia(request.getParameter("txt_referencia"));
                datosEnvio.setPersona(request.getParameter("txt_recibe"));
                datosEnvio.setTelefono(Integer.valueOf(request.getParameter("txt_telefono")));
                datosEnvio.setId_cliente(Integer.valueOf(request.getParameter("txt_id_cliente")));
                datosEnvio.ingresarDatosEnvio(datosEnvio);
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
                break;
            case "modificarDatosEnvio":
                datosEnvio.setId_envio(Integer.valueOf(request.getParameter("txt_id")));
                datosEnvio.setDepartamento(request.getParameter("txt_departamento"));
                datosEnvio.setMunicipio(request.getParameter("txt_municipio"));
                datosEnvio.setDireccion(request.getParameter("txt_dir_exacta"));
                datosEnvio.setReferencia(request.getParameter("txt_referencia"));
                datosEnvio.setPersona(request.getParameter("txt_recibe"));
                datosEnvio.setTelefono(Integer.valueOf(request.getParameter("txt_telefono")));
                datosEnvio.setId_cliente(Integer.valueOf(request.getParameter("txt_id_cliente")));
                datosEnvio.modificarDatosEnvio(datosEnvio);
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
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
