
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class Usuario {
    
    private int id_usuario;
    private String descripcion;
    private Conexion cn;

    public Usuario() {
    }

    public Usuario(int id_usuario, String descripcion) {
        this.id_usuario = id_usuario;
        this.descripcion = descripcion;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public HashMap drop_usuario(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_usuario as id, descripcion from usuarios where id_usuario != 3;";
        cn.abrir_conexion();
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        while(consulta.next()){
         drop.put(consulta.getString("id"), consulta.getString("descripcion"));
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return drop;
    }    
    
}
