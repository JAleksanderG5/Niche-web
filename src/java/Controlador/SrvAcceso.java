package Controlador;

import Modelo.Carrito;
import Modelo.Clientes;
import Modelo.ClientesDAO;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.Usuarios;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SrvAcceso extends HttpServlet {

    List<Carrito> listaCarrito = new ArrayList<>();
    String result;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        EmpleadoDAO empleadoDao = new EmpleadoDAO();
        Empleado empleado = new Empleado();
        Usuarios usuarios = new Usuarios();
        ClientesDAO clientesDao = new ClientesDAO();
        Clientes cliente = new Clientes();
        HttpSession sesion = request.getSession();

        String accion = request.getParameter("accion");
        String action = "null";
        String mensaje;

        String nuevoCorreo = "";
        String nuevoPass = "";
        String nuevoCorreoE = "";
        String nuevoPassE = "";

        int estadoAcceso = 0;

        if (accion.equals("ingresar")) {
            int estado;
            String correo = request.getParameter("txt_correo");
            String pass = request.getParameter("txt_pass");

            if (estadoAcceso == 0) {

                switch (usuarios.loguear(correo, pass)) {
                    case 1:
                        sesion.setAttribute("correo", correo);
                        sesion.setAttribute("rol", "1");
                        estado = usuarios.getId_estado();
                        if (estado == 1) {
                            sesion.setAttribute("empleado", usuarios);
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("login.jsp");
                        }

                        estadoAcceso = 1;
                        break;
                    case 2:
                        sesion.setAttribute("correo", correo);
                        sesion.setAttribute("rol", "2");

                        estado = usuarios.getId_estado();
                        if (estado == 1) {
                            sesion.setAttribute("empleado", usuarios);
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("login.jsp");
                        }

                        estadoAcceso = 1;
                        break;
                    default:
                        estadoAcceso = 0;
                        break;
                }

            }

            if (estadoAcceso == 0) {
                switch (cliente.loguear(correo, pass)) {
                    case 3:
                        sesion.setAttribute("correo", correo);
                        sesion.setAttribute("rol", "3");

                        
                        sesion.setAttribute("cliente", cliente);

                        response.sendRedirect("clientes.jsp");
                        break;
                    default:
                        mensaje = "Credenciales invalidas";
                        request.setAttribute("error", mensaje);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                }
            }

        } else if (accion.equals("registrar")) {

            nuevoCorreo = request.getParameter("txt_correo");
            nuevoPass = request.getParameter("txt_pass");

            if (clientesDao.buscarCorreo(nuevoCorreo) == 1) {
                mensaje = "El correo ya esta registrado";
                request.setAttribute("errorCorreo", mensaje);
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }else if( empleadoDao.buscarCorreo(nuevoCorreo) == 1){   
                mensaje = "El correo ya esta registrado";
                request.setAttribute("errorCorreo", mensaje);
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }else{

            action = "nuevoRegistro";

            String nombres = request.getParameter("txt_nombres");
            String apellidos = request.getParameter("txt_apellidos");
            String correo = request.getParameter("txt_correo");
            String pass = request.getParameter("txt_pass");

            int telefono = Integer.valueOf(request.getParameter("txt_telefono"));
            cliente.setNombres(nombres);
            cliente.setApellidos(apellidos);
            cliente.setCorreo(correo);
            cliente.setPassword(pass);
            cliente.setTelefono(telefono);
            clientesDao.agregar(cliente);

            sesion.setAttribute("correo", correo);
            sesion.setAttribute("rol", "3");
            }

        } else if (accion.equals("modificarCliente")) {

            nuevoCorreo = request.getParameter("txt_correo");
            nuevoPass = request.getParameter("txt_pass");

            action = "nuevoRegistro";

            cliente.setId_cliente(Integer.valueOf(request.getParameter("txt_id")));
            cliente.setNombres(request.getParameter("txt_nombres"));
            cliente.setApellidos(request.getParameter("txt_apellidos"));
            cliente.setCorreo(request.getParameter("txt_correo"));
            cliente.setPassword(request.getParameter("txt_pass"));
            cliente.setTelefono(Integer.valueOf(request.getParameter("txt_telefono")));
            cliente.setId_usuario(3);
            clientesDao.modificar(cliente);

        } else if (accion.equals("modificarEmpleado")) {

            nuevoCorreoE = request.getParameter("txt_correo");
            nuevoPassE = request.getParameter("txt_pass");

            action = "nuevoRegistroEmpleado";

            empleado.setId_empleado(Integer.valueOf(request.getParameter("txt_id")));
            empleado.setCui(Integer.valueOf(request.getParameter("txt_cui")));
            empleado.setNombres(request.getParameter("txt_nombres"));
            empleado.setApellidos(request.getParameter("txt_apellidos"));
            empleado.setCorreo(request.getParameter("txt_correo"));
            empleado.setPassword(request.getParameter("txt_pass"));
            empleado.setDireccion(request.getParameter("txt_direccion"));
            empleado.setTelefono(Integer.valueOf(request.getParameter("txt_telefono")));
            empleado.setFn(request.getParameter("txt_fn"));
            empleado.setId_usuario(Integer.valueOf(request.getParameter("txt_idUsuario")));
            empleado.setId_estado(Integer.valueOf(request.getParameter("txt_idEstado")));
            empleadoDao.modificar(empleado);

        } else if (accion.equals("cerrar")) {
            sesion.invalidate();
            response.sendRedirect("index.jsp");

        } else if (accion.equals("cerrarCliente")) {
            sesion.invalidate();
            response.sendRedirect("SrvProducto?action=CarritoSalir");
        }
//********************************** nuevo *************************
        if (action.equals("nuevoRegistro")) {
            String correo = nuevoCorreo;
            String pass = nuevoPass;

            switch (cliente.loguear(correo, pass)) {
                case 3:
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("rol", "3");

                    sesion.setAttribute("cliente", cliente);
                    response.sendRedirect("clientes.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp");
                    break;
            }
        }

        if (action.equals("nuevoRegistroEmpleado")) {
            String correo = nuevoCorreoE;
            String pass = nuevoPassE;
            int estado;
            switch (usuarios.loguear(correo, pass)) {
                case 1:
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("rol", "1");
                    

                    estado = usuarios.getId_estado();
                    if (estado == 1) {
                        sesion.setAttribute("empleado", usuarios);
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }

                    estadoAcceso = 1;
                    break;
                case 2:
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("rol", "2");
                    mensaje = "";
                    sesion.setAttribute("error", mensaje);

                    estado = usuarios.getId_estado();
                    if (estado == 1) {
                        sesion.setAttribute("empleado", usuarios);
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }

                    estadoAcceso = 1;
                    break;
                default:
                    estadoAcceso = 0;
                    break;
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
