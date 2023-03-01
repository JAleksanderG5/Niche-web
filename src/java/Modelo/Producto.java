
package Modelo;

import java.io.InputStream;


public class Producto {
    private int id_producto;
    private String nombre;
    private String detalle;
    private String marca;
    private String talla;
    private String color;
    private int precio;
    private InputStream imagen;
    private int estado;
    private String fecha;
    private String categoria;
    private int id_categoria;
    private String promocion;
    private int id_promocion;
    //private String empleado;
    //private int id_empleado;

    public Producto() {
    }

    public Producto(int id_producto, String nombre, String detalle, String marca, String talla, String color, int precio, InputStream imagen, int estado, String fecha, String categoria, int id_categoria, String promocion, int id_promocion) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.detalle = detalle;
        this.marca = marca;
        this.talla = talla;
        this.color = color;
        this.precio = precio;
        this.imagen = imagen;
        this.estado = estado;
        this.fecha = fecha;
        this.categoria = categoria;
        this.id_categoria = id_categoria;
        this.promocion = promocion;
        this.id_promocion = id_promocion;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getPromocion() {
        return promocion;
    }

    public void setPromocion(String promocion) {
        this.promocion = promocion;
    }

    public int getId_promocion() {
        return id_promocion;
    }

    public void setId_promocion(int id_promocion) {
        this.id_promocion = id_promocion;
    }

    

    
    
    
    
}
