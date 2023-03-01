
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


public class Categoria {
    private int id_categoria;
    private String categoria;
    private Conexion cn;

    public Categoria() {
    }

    public Categoria(int id_categoria, String categoria) {
        this.id_categoria = id_categoria;
        this.categoria = categoria;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    public HashMap drop_categoria(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_categoria as id, descripcion as categoria from categorias";
        cn.abrir_conexion();
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        while(consulta.next()){
         drop.put(consulta.getString("id"), consulta.getString("categoria"));
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return drop;
    } 
    
}
