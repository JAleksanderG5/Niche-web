
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DatosEnvio {
    private int id_envio;
    private String departamento;
    private String municipio;
    private String direccion;
    private String referencia;
    private String persona;
    private int telefono;
    private int id_cliente;

    public DatosEnvio() {
    }

    public DatosEnvio(int id_envio, String departamento, String municipio, String direccion, String referencia, String persona, int telefono, int id_cliente) {
        this.id_envio = id_envio;
        this.departamento = departamento;
        this.municipio = municipio;
        this.direccion = direccion;
        this.referencia = referencia;
        this.persona = persona;
        this.telefono = telefono;
        this.id_cliente = id_cliente;
    }

    public int getId_envio() {
        return id_envio;
    }

    public void setId_envio(int id_envio) {
        this.id_envio = id_envio;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
    
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;  
    
    public int obtenerDatosEnvio(int id) {

        int nivel = 0;

        if (nivel == 0) {
            try {
                PreparedStatement parametro;
                cn = new Conexion();
                cn.abrir_conexion();
                String query = "select d.id_dato_envio, d.departamento, d.municipio, d.direccion_exacta, d.referencia_lugar, d.persona_recibe, d.telefono, d.id_cliente from datos_envio d inner join clientes c on d.id_cliente = c.id_cliente where d.id_cliente=?;";
                parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query); // para establecer parametros en la consulta
                parametro.setInt(1, id);
                ResultSet consulta = parametro.executeQuery();
                while (consulta.next()) {
                    setId_envio(consulta.getInt("id_dato_envio"));
                    setDepartamento(consulta.getString("departamento"));
                    setMunicipio(consulta.getString("municipio"));
                    setDireccion(consulta.getString("direccion_exacta"));
                    setReferencia(consulta.getString("referencia_lugar"));
                    setPersona(consulta.getString("persona_recibe"));
                    setTelefono(consulta.getInt("telefono"));
                    nivel = 1;
                }
                cn.cerrar_conexion();
            } catch (SQLException e) {
                nivel = 0;
            }
        }

        return nivel;
    }
    
   
    public void ingresarDatosEnvio(DatosEnvio envio) {
        String sql = "INSERT INTO datos_envio (departamento,municipio,direccion_exacta,referencia_lugar,persona_recibe,telefono,id_cliente) VALUES (?,?,?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, envio.getDepartamento());
            ps.setString(2, envio.getMunicipio());
            ps.setString(3, envio.getDireccion());
            ps.setString(4, envio.getReferencia());
            ps.setString(5, envio.getPersona());
            ps.setInt(6, envio.getTelefono());
            ps.setInt(7, envio.getId_cliente());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void modificarDatosEnvio(DatosEnvio envio) {
        String sql = "update datos_envio set departamento=?, municipio=?, direccion_exacta=?, referencia_lugar=?, persona_recibe=?, telefono=?, id_cliente=? where id_dato_envio=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, envio.getDepartamento());
            ps.setString(2, envio.getMunicipio());
            ps.setString(3, envio.getDireccion());
            ps.setString(4, envio.getReferencia());
            ps.setString(5, envio.getPersona());
            ps.setInt(6, envio.getTelefono());
            ps.setInt(7, envio.getId_cliente());
            ps.setInt(8, envio.getId_envio());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
}
