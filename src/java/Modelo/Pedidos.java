
package Modelo;

import java.io.InputStream;
import java.util.List;


public class Pedidos {
    private int id_pedido;
    private String detalle;
    private int sub_total;
    private int total;
    private String fecha;
    private InputStream imagen_pago;
    private String guia_transporte;
    private String cliente;
    private int id_cliente;
    private String pago;
    private int id_tipo_pago;
    private String seguimiento;
    private int id_seguimiento;    
    
    private List<Carrito>detallecompras;

    public Pedidos() {
    }

    public Pedidos(int id_pedido, String detalle, int sub_total, int total, String fecha, InputStream imagen_pago, String guia_transporte, String cliente, int id_cliente, String pago, int id_tipo_pago, String seguimiento, int id_seguimiento, List<Carrito> detallecompras) {
        this.id_pedido = id_pedido;
        this.detalle = detalle;
        this.sub_total = sub_total;
        this.total = total;
        this.fecha = fecha;
        this.imagen_pago = imagen_pago;
        this.guia_transporte = guia_transporte;
        this.cliente = cliente;
        this.id_cliente = id_cliente;
        this.pago = pago;
        this.id_tipo_pago = id_tipo_pago;
        this.seguimiento = seguimiento;
        this.id_seguimiento = id_seguimiento;
        this.detallecompras = detallecompras;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getSub_total() {
        return sub_total;
    }

    public void setSub_total(int sub_total) {
        this.sub_total = sub_total;
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

    public InputStream getImagen_pago() {
        return imagen_pago;
    }

    public void setImagen_pago(InputStream imagen_pago) {
        this.imagen_pago = imagen_pago;
    }

    public String getGuia_transporte() {
        return guia_transporte;
    }

    public void setGuia_transporte(String guia_transporte) {
        this.guia_transporte = guia_transporte;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public int getId_tipo_pago() {
        return id_tipo_pago;
    }

    public void setId_tipo_pago(int id_tipo_pago) {
        this.id_tipo_pago = id_tipo_pago;
    }

    public String getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(String seguimiento) {
        this.seguimiento = seguimiento;
    }

    public int getId_seguimiento() {
        return id_seguimiento;
    }

    public void setId_seguimiento(int id_seguimiento) {
        this.id_seguimiento = id_seguimiento;
    }

    public List<Carrito> getDetallecompras() {
        return detallecompras;
    }

    public void setDetallecompras(List<Carrito> detallecompras) {
        this.detallecompras = detallecompras;
    }
    
}
