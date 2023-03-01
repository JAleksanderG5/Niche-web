
package Modelo;

public class Carrito {
    private int item;
    private int id_producto;
    private String nombre;    
    private String detalle;
    private String marca;
    private String color;    
    private String categoria;    
    private int precio;
    private int cantidad;
    private int sub_total;

    public Carrito() {
    }

    public Carrito(int item, int id_producto, String nombre, String detalle, String marca, String color, String categoria, int precio, int cantidad, int sub_total) {
        this.item = item;
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.detalle = detalle;
        this.marca = marca;
        this.color = color;
        this.categoria = categoria;
        this.precio = precio;
        this.cantidad = cantidad;
        this.sub_total = sub_total;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getSub_total() {
        return sub_total;
    }

    public void setSub_total(int sub_total) {
        this.sub_total = sub_total;
    }

    
    
    
    
    
}
