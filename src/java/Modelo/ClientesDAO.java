package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;

public class ClientesDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    Conexion cn1 = new Conexion();
    Connection con1;
    PreparedStatement ps1;
    ResultSet rs1;

    public List listar() {
        List<Clientes> lista = new ArrayList();
        String sql = "select c.id_cliente, c.nombres, c.apellidos, c.correo, c.password, c.telefono, c.id_usuario, d.departamento, d.municipio, d.direccion_exacta, d.referencia_lugar, d.persona_recibe, d.telefono as telRecibe, d.id_dato_envio from clientes c inner join datos_envio d on c.id_cliente = d.id_cliente;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Clientes c = new Clientes();
                c.setId_cliente(rs.getInt("id_cliente"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                c.setCorreo(rs.getString("correo"));
                c.setPassword(rs.getString("password"));
                c.setTelefono(rs.getInt("telefono"));
                c.setId_usuario(rs.getInt("id_usuario"));
                c.setDepartamento(rs.getString("departamento"));
                c.setMunicipio(rs.getString("municipio"));
                c.setDireccion(rs.getString("direccion_exacta"));
                c.setReferencia(rs.getString("referencia_lugar"));
                c.setRecibe(rs.getString("persona_recibe"));
                c.setTelefono_recibe(rs.getInt("telRecibe"));
                c.setId_dato_envio(rs.getInt("id_dato_envio"));
                lista.add(c);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarTodos() {
        List<Clientes> lista = new ArrayList();
        String sql = "select * from clientes;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Clientes c = new Clientes();
                c.setId_cliente(rs.getInt("id_cliente"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                c.setCorreo(rs.getString("correo"));
                c.setPassword(rs.getString("password"));
                c.setTelefono(rs.getInt("telefono"));
                c.setId_usuario(rs.getInt("id_usuario"));

                c.setListaEnvio(listarDatos(rs.getInt("id_cliente")));
                lista.add(c);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarNombre(int idCliente) {
        List<Clientes> lista = new ArrayList();
        String sql = "select c.id_cliente, c.nombres, c.apellidos, c.correo, c.password, c.telefono, c.id_usuario, d.departamento, d.municipio, d.direccion_exacta, d.referencia_lugar, d.persona_recibe, d.telefono as telRecibe, d.id_dato_envio from clientes c inner join datos_envio d on c.id_cliente = d.id_cliente where c.id_cliente=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            rs = ps.executeQuery();
            while (rs.next()) {
                Clientes c = new Clientes();
                c.setId_cliente(rs.getInt("id_cliente"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                c.setCorreo(rs.getString("correo"));
                c.setPassword(rs.getString("password"));
                c.setTelefono(rs.getInt("telefono"));
                c.setId_usuario(rs.getInt("id_usuario"));
                c.setListaEnvio(listarDatos(rs.getInt("id_cliente")));
                lista.add(c);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarId(int idCliente) {
        List<Clientes> lista = new ArrayList();
        String sql = "select * from clientes where id_cliente=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            rs = ps.executeQuery();
            while (rs.next()) {
                Clientes c = new Clientes();
                c.setId_cliente(rs.getInt("id_cliente"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                c.setCorreo(rs.getString("correo"));
                c.setPassword(rs.getString("password"));
                c.setTelefono(rs.getInt("telefono"));
                c.setId_usuario(rs.getInt("id_usuario"));
                c.setListaEnvio(listarDatos(rs.getInt("id_cliente")));
                lista.add(c);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarDatos(int idCliente) {
        List<DatosEnvio> listaDatos = new ArrayList();
        String sql = "select * from datos_envio where id_cliente=?;";

        try {
            con1 = cn1.getConnection();
            ps1 = con1.prepareStatement(sql);
            ps1.setInt(1, idCliente);
            rs1 = ps1.executeQuery();

            while (rs1.next()) {
                DatosEnvio datosEnvio = new DatosEnvio();

                datosEnvio.setId_envio(rs1.getInt("id_dato_envio"));
                datosEnvio.setDepartamento(rs1.getString("departamento"));
                datosEnvio.setMunicipio(rs1.getString("municipio"));
                datosEnvio.setDireccion(rs1.getString("direccion_exacta"));
                datosEnvio.setReferencia(rs1.getString("referencia_lugar"));
                datosEnvio.setPersona(rs1.getString("persona_recibe"));
                datosEnvio.setTelefono(rs1.getInt("telefono"));
                datosEnvio.setId_cliente(rs1.getInt("id_cliente"));
                listaDatos.add(datosEnvio);

            }
            // cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return listaDatos;

    }

    public int buscarCorreo(String correo) {
        int resultado = 0;

        try {
            String sql = "select * from clientes where correo=?;";
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();

            while (rs.next()) {
                resultado = 1;
            }
             cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return resultado;

    }

    public void agregar(Clientes cliente) {
        String sql = "INSERT INTO clientes (nombres,apellidos,correo,password,telefono,id_usuario) VALUES (?,?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNombres());
            ps.setString(2, cliente.getApellidos());
            ps.setString(3, cliente.getCorreo());
            ps.setString(4, cliente.getPassword());
            ps.setInt(5, cliente.getTelefono());
            ps.setInt(6, 3);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void modificar(Clientes cliente) {
        String sql = "update clientes set nombres=?, apellidos=?, correo=?, password=?, telefono=?, id_usuario=? where id_cliente=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, cliente.getNombres());
            ps.setString(2, cliente.getApellidos());
            ps.setString(3, cliente.getCorreo());
            ps.setString(4, cliente.getPassword());
            ps.setInt(5, cliente.getTelefono());
            ps.setInt(6, cliente.getId_usuario());
            ps.setInt(7, cliente.getId_cliente());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int loguear(String usuario, String password) {

        int nivel = 0;

        if (nivel == 0) {
            try {
                PreparedStatement parametro;
                cn = new Conexion();
                cn.abrir_conexion();
                String query = "select c.id_cliente as id, c.nombres, c.apellidos, c.correo, c.password, c.telefono, c.id_usuario from clientes c where c.correo=? and c.password=?;";
                parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
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
        }

        return nivel;
    }

    public int cantidadClientes() {
        int total = 0;
        String sql = "select count(id_cliente) as cantidad from clientes;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                total = (rs.getInt("cantidad"));
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }

        return total;
    }

}
