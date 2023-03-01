
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class VentasDAO {
    
    Conexion cn;
    Empleado ventas;
    
    Conexion cn1 = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    
    public DefaultTableModel leer(){    
    DefaultTableModel tabla = new DefaultTableModel();
    try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query = "select v.id_venta as id, v.detalle, v.total, v.fecha, v.id_pedido, e.nombres, v.id_empleado, tp.descripcion, v.id_tipo_venta from ventas v inner join empleados e on v.id_empleado = e.id_empleado inner join tipo_venta tp on v.id_tipo_venta = tp.id_tipo_venta order by v.id_venta desc;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"id","detalle","total","fecha","id_pedido","nombres","id_empleado","descripcion","id_tipo_venta"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String[9];
        while (consulta.next()){ // .next() que haga el recorrido siempre que exista un valor siguiente
           datos[0] = consulta.getString("id");
           datos[1] = consulta.getString("detalle");
           datos[2] = consulta.getString("total");
           datos[3] = consulta.getString("fecha");
           datos[4] = consulta.getString("id_pedido");
           datos[5] = consulta.getString("nombres");
           datos[6] = consulta.getString("id_empleado");
           datos[7] = consulta.getString("descripcion");
           datos[8] = consulta.getString("id_tipo_venta");
           tabla.addRow(datos);
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    }
    return tabla;
    }
    
    public int agregar(Ventas ventas){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "insert into ventas(detalle,total,fecha,id_pedido,id_empleado,id_tipo_venta) values (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, ventas.getDetalle());
            parametro.setInt(2, ventas.getTotal());
            parametro.setString(3, ventas.getFecha());
            parametro.setInt(4, ventas.getId_pedido());
            parametro.setInt(5, ventas.getId_empleado());
            parametro.setInt(6, ventas.getId_tipo_venta());            
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
            
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        
        return retorno;
    }
    
    public int modificar(Ventas ventas){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "update ventas set detalle=?,total=?,fecha=?,id_pedido=?,id_empleado=?,id_tipo_venta=? where id_venta=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, ventas.getDetalle());
            parametro.setInt(2, ventas.getTotal());
            parametro.setString(3, ventas.getFecha());
            parametro.setInt(4, ventas.getId_pedido());
            parametro.setInt(5, ventas.getId_empleado());
            parametro.setInt(6, ventas.getId_tipo_venta());  
            parametro.setInt(7, ventas.getId_venta());  
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return retorno;
    }
    
    
    public int eliminar(Ventas ventas){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from ventas where id_venta=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);          
            parametro.setInt(1, ventas.getId_venta());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());            
        }
        
        return retorno;
    }
    
    public int listarVentasTotal(){
       int total = 0;
        String sql = "select count(id_venta) as cantidad from ventas;";
        try {
            con = cn1.getConnection();
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
    
    public int listarVentasOnline(){
       int total = 0;
        String sql = "select count(id_venta) as cantidad from ventas where id_tipo_venta = 2;";
        try {
            con = cn1.getConnection();
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
    public int listarVentasFisicas(){
       int total = 0;
        String sql = "select count(id_venta) as cantidad from ventas where id_tipo_venta = 1;";
        try {
            con = cn1.getConnection();
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
    
    public int listarTotal(){
       int total = 0;
        String sql = "select sum(v.total) total  from ventas v;";
        try {
            con = cn1.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                total = (rs.getInt("total"));
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
       
       return total;
    }
    
}
