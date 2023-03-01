package Modelo;

public class Empleado {
    
    private int id_empleado;
    private int cui;
    private String nombres;
    private String apellidos;
    private String correo;
    private String password;
    private String direccion;
    private int telefono;
    private String fn;
    private int id_usuario;
    private int id_estado;

    public Empleado() {
    }

    public Empleado(int id_empleado, int cui, String nombres, String apellidos, String correo, String password, String direccion, int telefono, String fn, int id_usuario, int id_estado) {
        this.id_empleado = id_empleado;
        this.cui = cui;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.password = password;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fn = fn;
        this.id_usuario = id_usuario;
        this.id_estado = id_estado;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getCui() {
        return cui;
    }

    public void setCui(int cui) {
        this.cui = cui;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getFn() {
        return fn;
    }

    public void setFn(String fn) {
        this.fn = fn;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    
}
