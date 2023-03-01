
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    public Connection conexionBD;   
    private final String puerto= "3306";
    private final String bd= "db_niche";
    private final String urlConexion = String.format("jdbc:mysql://localhost:%s/%s?serverTimezone=UTC&autoReconnect=true&useSSL=false",puerto, bd);
    private final String usuario = "root";
    private final String contra = "Aleks#10";
    //String url="jdbc:mysql://niche-db.mysql.database.azure.com:3306/db_niche?useSSL=true"; Azure
    //private final String usuario = "Administrador"; Azure
    //private final String contra = "Izote$45&"; Azure
    private final String jdbc ="com.mysql.cj.jdbc.Driver";
    
    public void abrir_conexion(){
            try{
                Class.forName(jdbc);
                conexionBD = DriverManager.getConnection(urlConexion,usuario,contra);
                //conexionBD = DriverManager.getConnection(url, "Administrador", "Izote$45"); Azure
                
            }catch(ClassNotFoundException | SQLException ex){
                    System.out.println("Error: " + ex.getMessage());
            }
    }
    
    public void cerrar_conexion(){
        try{
            conexionBD.close();
        }catch(SQLException ex){
            System.out.println("Error: " + ex.getMessage());
        }
    
    }
    
    Connection con; 

    public Connection getConnection() {
        
        try {
            Class.forName(jdbc);
            con = DriverManager.getConnection(urlConexion,usuario,contra);
            //con = DriverManager.getConnection(url, "Administrador", "Izote$45"); Azure
        } catch (Exception e) {
        }

        return con;
    }
    
}



