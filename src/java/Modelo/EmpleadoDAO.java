
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

public class EmpleadoDAO {  
    
    Conexion cn;
    Empleado empleado;   
    
    Conexion cn1 = new Conexion();
    Connection con1;
    PreparedStatement ps1;
    ResultSet rs1;

    
    public DefaultTableModel leer(){    
    DefaultTableModel tabla = new DefaultTableModel();
    try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query = "select e.id_empleado as id, e.cui, e.nombres, e.apellidos, e.correo, e.password, e.direccion, e.telefono, e.fecha_nacimiento, u.descripcion, e.id_usuario, es.descripcion as estado, e.id_estado from empleados e inner join usuarios u on e.id_usuario = u.id_usuario inner join estado_empleado es on e.id_estado = es.id_estado order by e.id_empleado desc;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"id","cui","nombres","apellidos","correo","password","direccion","telefono","nacimiento","descripcion","id_usuario","estado","id_estado"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String[13];
        while (consulta.next()){ // .next() que haga el recorrido siempre que exista un valor siguiente
           datos[0] = consulta.getString("id");
           datos[1] = consulta.getString("cui");
           datos[2] = consulta.getString("nombres");
           datos[3] = consulta.getString("apellidos");
           datos[4] = consulta.getString("correo");
           datos[5] = consulta.getString("password");
           datos[6] = consulta.getString("direccion");
           datos[7] = consulta.getString("telefono");
           datos[8] = consulta.getString("fecha_nacimiento");
           datos[9] = consulta.getString("descripcion");
           datos[10] = consulta.getString("id_usuario");
           datos[11] = consulta.getString("estado");
           datos[12] = consulta.getString("id_estado");
           tabla.addRow(datos);
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    }
    return tabla;
    }
    
    
    
    public int agregar(Empleado empleado){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "insert into empleados(cui,nombres,apellidos,correo,password,direccion,telefono,fecha_nacimiento,id_usuario,id_estado) values (?,?,?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, empleado.getCui());
            parametro.setString(2, empleado.getNombres());
            parametro.setString(3, empleado.getApellidos());
            parametro.setString(4, empleado.getCorreo());
            parametro.setString(5, empleado.getPassword());
            parametro.setString(6, empleado.getDireccion());
            parametro.setInt(7, empleado.getTelefono());
            parametro.setString(8, empleado.getFn());
            parametro.setInt(9, empleado.getId_usuario());
            parametro.setInt(10, empleado.getId_estado());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
            
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());            
        }
        
        return retorno;
    }
    

    public int modificar(Empleado empleado){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "update empleados set cui=?,nombres=?,apellidos=?,correo=?,password=?,direccion=?,telefono=?,fecha_nacimiento=?,id_usuario=?,id_estado=? where id_empleado=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, empleado.getCui());
            parametro.setString(2, empleado.getNombres());
            parametro.setString(3, empleado.getApellidos());
            parametro.setString(4, empleado.getCorreo());
            parametro.setString(5, empleado.getPassword());
            parametro.setString(6, empleado.getDireccion());
            parametro.setInt(7, empleado.getTelefono());
            parametro.setString(8, empleado.getFn());
            parametro.setInt(9, empleado.getId_usuario());
            parametro.setInt(10, empleado.getId_estado());
            parametro.setInt(11, empleado.getId_empleado());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return retorno;
    }
    
    
    public int eliminar(Empleado empleado){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from empleados where id_empleado=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);          
            parametro.setInt(1, empleado.getId_empleado());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
          
        }catch(SQLException ex){
            System.out.println(ex.getMessage());            
        }
        
        return retorno;
    }
    
    public int buscarCorreo(String correo) {
        int resultado = 0;

        try {
            String sql = "select * from empleados where correo=?;";
            con1 = cn1.getConnection();
            ps1 = con1.prepareStatement(sql);
            ps1.setString(1, correo);
            rs1 = ps1.executeQuery();

            while (rs1.next()) {
                resultado = 1;
            }
             cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return resultado;

    }
    
    
    public HashMap drop_empleado(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_empleado as id, nombres from empleados where id_usuario != 3;";
        cn.abrir_conexion();
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        while(consulta.next()){
         drop.put(consulta.getString("id"), consulta.getString("nombres"));
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return drop;
    }
    
    public HashMap drop_estado(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_estado as id, descripcion as estado from estado_empleado;";
        cn.abrir_conexion();
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        while(consulta.next()){
         drop.put(consulta.getString("id"), consulta.getString("estado"));
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return drop;
    } 
    
    
}

