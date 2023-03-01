
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


public class Promocion {
    private int id_promocion;
    private String promocion;
    private int porcentaje;
    private int id_tipo_promocion;
    private Conexion cn;

    public Promocion() {
    }

    public Promocion(int id_promocion, String promocion, int porcentaje, int id_tipo_promocion) {
        this.id_promocion = id_promocion;
        this.promocion = promocion;
        this.porcentaje = porcentaje;
        this.id_tipo_promocion = id_tipo_promocion;
    }

    public int getId_promocion() {
        return id_promocion;
    }

    public void setId_promocion(int id_promocion) {
        this.id_promocion = id_promocion;
    }

    public String getPromocion() {
        return promocion;
    }

    public void setPromocion(String promocion) {
        this.promocion = promocion;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }

    public int getId_tipo_promocion() {
        return id_tipo_promocion;
    }

    public void setId_tipo_promocion(int id_tipo_promocion) {
        this.id_tipo_promocion = id_tipo_promocion;
    }
    
    public HashMap drop_promocion(){
    HashMap<String,String> drop = new HashMap();
    try{
        cn = new Conexion();
        String query = "select id_promocion as id, descripcion as promocion from promociones order by id_promocion desc;";
        cn.abrir_conexion();
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        while(consulta.next()){
         drop.put(consulta.getString("id"), consulta.getString("promocion"));
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    
    return drop;
    } 
    
}
