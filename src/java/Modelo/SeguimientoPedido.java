
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


public class SeguimientoPedido {
   private int id_seguimiento;
   private String seguimiento;
   private Conexion cn;

    public SeguimientoPedido() {
    }

    public SeguimientoPedido(int id_seguimiento, String seguimiento) {
        this.id_seguimiento = id_seguimiento;
        this.seguimiento = seguimiento;
    }

    public int getId_seguimiento() {
        return id_seguimiento;
    }

    public void setId_seguimiento(int id_seguimiento) {
        this.id_seguimiento = id_seguimiento;
    }

    public String getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(String seguimiento) {
        this.seguimiento = seguimiento;
    }
   
   public HashMap drop_seguimiento(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_seguimiento as id, descripcion as seguimiento from seguimiento_pedido;";
        cn.abrir_conexion();
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        while(consulta.next()){
         drop.put(consulta.getString("id"), consulta.getString("seguimiento"));
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return drop;
    } 
   
}
