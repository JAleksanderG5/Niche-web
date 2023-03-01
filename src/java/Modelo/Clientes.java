
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Clientes {
    private int id_cliente;
    private String nombres;
    private String apellidos;
    private String correo;
    private String password;
    private int telefono;
    private int id_usuario;
    private String departamento;
    private String municipio;
    private String direccion;
    private String referencia;
    private String recibe;
    private int telefono_recibe;
    private int id_dato_envio;
    private List<DatosEnvio> listaEnvio;
    

    public Clientes() {
    }

    public Clientes(int id_cliente, String nombres, String apellidos, String correo, String password, int telefono, int id_usuario, String departamento, String municipio, String direccion, String referencia, String recibe, int telefono_recibe, int id_dato_envio, List<DatosEnvio> listaEnvio) {
        this.id_cliente = id_cliente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.password = password;
        this.telefono = telefono;
        this.id_usuario = id_usuario;
        this.departamento = departamento;
        this.municipio = municipio;
        this.direccion = direccion;
        this.referencia = referencia;
        this.recibe = recibe;
        this.telefono_recibe = telefono_recibe;
        this.id_dato_envio = id_dato_envio;
        this.listaEnvio = listaEnvio;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
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

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getRecibe() {
        return recibe;
    }

    public void setRecibe(String recibe) {
        this.recibe = recibe;
    }

    public int getTelefono_recibe() {
        return telefono_recibe;
    }

    public void setTelefono_recibe(int telefono_recibe) {
        this.telefono_recibe = telefono_recibe;
    }

    public int getId_dato_envio() {
        return id_dato_envio;
    }

    public void setId_dato_envio(int id_dato_envio) {
        this.id_dato_envio = id_dato_envio;
    }

    public List<DatosEnvio> getListaEnvio() {
        return listaEnvio;
    }

    public void setListaEnvio(List<DatosEnvio> listaEnvio) {
        this.listaEnvio = listaEnvio;
    }

   

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;  
    
    public int loguear(String usuario, String password) {

        int nivel = 0;

        if (nivel == 0) {
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
                    //Clientes clientes = new Clientes();
                    setId_cliente(consulta.getInt("id"));
                    setNombres(consulta.getString("nombres"));
                    setApellidos(consulta.getString("apellidos"));
                    setCorreo(consulta.getString("correo"));
                    setPassword(consulta.getString("password"));
                    setTelefono(consulta.getInt("telefono"));
                    setId_usuario(consulta.getInt("id_usuario"));
                    nivel = (consulta.getInt("id_usuario"));
                }
                cn.cerrar_conexion();
            } catch (SQLException e) {
                nivel = 0;
            }
        }

        return nivel;
    }
    
    
}
