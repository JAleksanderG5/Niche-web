
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


public class TipoVenta {
    private int id_tipo_venta;
    private String tipo;
    private Conexion cn;

    public TipoVenta() {
    }

    public TipoVenta(int id_tipo_venta, String tipo) {
        this.id_tipo_venta = id_tipo_venta;
        this.tipo = tipo;
    }

    public int getId_tipo_venta() {
        return id_tipo_venta;
    }

    public void setId_tipo_venta(int id_tipo_venta) {
        this.id_tipo_venta = id_tipo_venta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public HashMap drop_tipo_venta(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_tipo_venta as id, descripcion from tipo_venta;";
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
