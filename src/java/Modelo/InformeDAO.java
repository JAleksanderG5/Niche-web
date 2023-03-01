
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class InformeDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List listarInforme() {
        List<Reporte> lista = new ArrayList();
        String sql = "select sum(v.total) as total, count(v.id_tipo_venta) as conteo, t.descripcion as ventas from ventas v inner join tipo_venta t on v.id_tipo_venta = t.id_tipo_venta group by t.descripcion;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Reporte r = new Reporte();
                r.setTotal(rs.getInt("total"));
                r.setCantidad(rs.getInt("conteo"));
                r.setDescripcion(rs.getString("ventas"));
                lista.add(r);
            }
            //cn.cerrar_conexion();
        } catch (SQLException e) {
        }
        return lista;
    }
    
    public List listarInformeFecha(Reporte reporte) {
        List<Reporte> lista = new ArrayList();
        String sql = "select sum(v.total) as total, count(v.id_tipo_venta) as conteo, t.descripcion as ventas from ventas v inner join tipo_venta t on v.id_tipo_venta = t.id_tipo_venta where v.fecha between ? and ? group by t.descripcion;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, reporte.getFechaInicio());
            ps.setString(2, reporte.getFechaFin());
            rs = ps.executeQuery();
            while (rs.next()) {
                Reporte r = new Reporte();
                r.setTotal(rs.getInt("total"));
                r.setCantidad(rs.getInt("conteo"));
                r.setDescripcion(rs.getString("ventas"));
                lista.add(r);
            }
            //cn.cerrar_conexion();
        } catch (SQLException e) {
        }
        return lista;
    }
    
    
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
    
    
    
    
    
}
