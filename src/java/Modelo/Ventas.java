
package Modelo;


public class Ventas {
    public int id_venta;
    public String detalle;
    public int total;
    public String fecha;
    public int id_pedido;
    public int id_empleado;
    public int id_tipo_venta;

    public Ventas() {
    }

    public Ventas(int id_venta, String detalle, int total, String fecha, int id_pedido, int id_empleado, int id_tipo_venta) {
        this.id_venta = id_venta;
        this.detalle = detalle;
        this.total = total;
        this.fecha = fecha;
        this.id_pedido = id_pedido;
        this.id_empleado = id_empleado;
        this.id_tipo_venta = id_tipo_venta;
    }
    
    

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_tipo_venta() {
        return id_tipo_venta;
    }

    public void setId_tipo_venta(int id_tipo_venta) {
        this.id_tipo_venta = id_tipo_venta;
    }
    
    
    
}
