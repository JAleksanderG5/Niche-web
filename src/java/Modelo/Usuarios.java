package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuarios {

    private int id;
    private int cui;
    private String nombres;
    private String apellidos;
    private String correo;
    private String password;
    private String direccion;
    private int telefono;
    private String fn;
    private int id_usuario;
    private int id_estado;
    Conexion cn;

    public Usuarios() {
    }

    public Usuarios(int id, int cui, String nombres, String apellidos, String correo, String password, String direccion, int telefono, String fn, int id_usuario, int id_estado) {
        this.id = id;
        this.cui = cui;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.password = password;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fn = fn;
        this.id_usuario = id_usuario;
        this.id_usuario = id_estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCui() {
        return cui;
    }

    public void setCui(int cui) {
        this.cui = cui;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getFn() {
        return fn;
    }

    public void setFn(String fn) {
        this.fn = fn;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public int loguear(String usuario, String password) {

        int nivel = 0;

        try {
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "select e.id_empleado as id, e.cui, e.nombres, e.apellidos, e.correo, e.password, e.direccion, e.telefono, e.fecha_nacimiento, e.id_usuario, e.id_estado from empleados e where e.correo=? and e.password=?;";
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query); // para establecer parametros en la consulta
            parametro.setString(1, usuario);
            parametro.setString(2, password);
            ResultSet consulta = parametro.executeQuery();
            while (consulta.next()) {
                setId(consulta.getInt("id"));
                setCui(consulta.getInt("cui"));
                setNombres(consulta.getString("nombres"));
                setApellidos(consulta.getString("apellidos"));
                setCorreo(consulta.getString("correo"));
                setPassword(consulta.getString("password"));
                setDireccion(consulta.getString("direccion"));
                setTelefono(consulta.getInt("telefono"));
                setFn(consulta.getString("fecha_nacimiento"));
                setId_estado(consulta.getInt("id_estado"));
                setId_usuario(consulta.getInt("id_usuario"));
                nivel = (consulta.getInt("id_usuario"));
            }
            cn.cerrar_conexion();
        } catch (SQLException e) {
            //nivel = 0;
        }

        /*if (nivel == 0) {
            try {
                PreparedStatement parametro;
                cn = new Conexion();
                cn.abrir_conexion();
                String query = "select c.id_cliente as id, c.nombres, c.apellidos, c.correo, c.password, c.telefono, c.id_usuario from clientes c where c.correo=? and c.password=?;";
                parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query); // para establecer parametros en la consulta
                parametro.setString(1, usuario);
                parametro.setString(2, password);
                ResultSet consulta = parametro.executeQuery();
                while (consulta.next()) {
                    Clientes clientes = new Clientes();
                    clientes.setId_cliente(consulta.getInt("id"));
                    clientes.setNombres(consulta.getString("nombres"));
                    clientes.setApellidos(consulta.getString("apellidos"));
                    clientes.setCorreo(consulta.getString("correo"));
                    clientes.setPassword(consulta.getString("password"));
                    clientes.setTelefono(consulta.getInt("telefono"));
                    clientes.setId_usuario(consulta.getInt("id_usuario"));
                    nivel = (consulta.getInt("id_usuario"));
                }
                cn.cerrar_conexion();
            } catch (SQLException e) {
                nivel = 0;
            }
        }*/

        return nivel;
    }

}
