package Modelo;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class PedidosDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    Conexion cn1 = new Conexion();
    Connection con1;
    PreparedStatement ps1;
    ResultSet rs1;
    
    

    public List listar() {
        List<Pedidos> lista = new ArrayList();
        String sql = "select p.id_pedido, p.detalle, p.sub_total, p.total, p.fecha, p.imagen_pago, p.guia_transporte, c.nombres as cliente, p.id_cliente, tp.descripcion as pago, p.id_tipo_pago, s.descripcion as seguimiento, p.id_seguimiento from pedidos p inner join tipo_pago tp on p.id_tipo_pago = tp.id_tipo_pago inner join clientes c on p.id_cliente = c.id_cliente inner join seguimiento_pedido s on p.id_seguimiento = s.id_seguimiento order by p.id_pedido desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedidos p = new Pedidos();

                p.setId_pedido(rs.getInt("id_pedido"));
                p.setDetalle(rs.getString("detalle"));
                p.setSub_total(rs.getInt("sub_total"));
                p.setTotal(rs.getInt("total"));
                p.setFecha(rs.getString("fecha"));
                p.setImagen_pago(rs.getBinaryStream("imagen_pago"));
                p.setGuia_transporte(rs.getString("guia_transporte"));
                p.setCliente(rs.getString("cliente"));
                p.setId_cliente(rs.getInt("id_cliente"));
                p.setPago(rs.getString("pago"));
                p.setId_tipo_pago(rs.getInt("id_tipo_pago"));
                p.setSeguimiento(rs.getString("seguimiento"));
                p.setId_seguimiento(rs.getInt("id_seguimiento"));
                
                p.setDetallecompras(listarDetalles(rs.getInt("id_pedido")));
                lista.add(p);

            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public void modificar(Pedidos pedidos) {
        String sql = "update pedidos set guia_transporte=?, id_seguimiento=? where id_pedido=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pedidos.getGuia_transporte());
            ps.setInt(2, pedidos.getId_seguimiento());
            ps.setInt(3, pedidos.getId_pedido());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void eliminar(Pedidos pedidos) {
        String sql = "delete from pedidos where id_pedido=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pedidos.getId_pedido());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public HashMap drop_pago() {
        HashMap<String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "select id_tipo_pago as id, descripcion as pago from tipo_pago;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("pago"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return drop;
    }

    int r = 0;

    public int generarCompra(Pedidos pedidos) {
        int idpedido;
        String sql = "insert into pedidos(id_pedido,detalle,sub_total,total,fecha,id_cliente,id_tipo_pago,id_seguimiento) values (?,?,?,?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, pedidos.getId_pedido());
            ps.setString(2, pedidos.getDetalle());
            ps.setInt(3, pedidos.getSub_total());
            ps.setInt(4, pedidos.getTotal());
            ps.setString(5, pedidos.getFecha());
            ps.setInt(6, pedidos.getId_cliente());
            ps.setInt(7, pedidos.getId_tipo_pago());
            ps.setInt(8, pedidos.getId_seguimiento());
            r = ps.executeUpdate();

            sql = "select @@identity as id_pedido;";
            rs = ps.executeQuery(sql);
            rs.next();
            idpedido = rs.getInt("id_pedido");
            rs.close();

            for (Carrito detalle : pedidos.getDetallecompras()) {
                sql = "insert into carrito(unidades,monto,id_producto,id_pedido)values(?,?,?,?);";
                ps = con.prepareStatement(sql);
                ps.setInt(1, detalle.getCantidad());
                ps.setInt(2, detalle.getPrecio());
                ps.setInt(3, detalle.getId_producto());
                ps.setInt(4, idpedido);
                r = ps.executeUpdate();

            }

        } catch (Exception e) {
        }
        return r;
    }

    public List listarPedidos(int id) {
        List<Pedidos> lista = new ArrayList();
        String sql = "select p.id_pedido, p.detalle, p.sub_total, p.total, p.fecha, p.imagen_pago, p.guia_transporte, c.nombres as cliente, p.id_cliente, tp.descripcion as pago, p.id_tipo_pago, s.descripcion as seguimiento, p.id_seguimiento from pedidos p inner join tipo_pago tp on p.id_tipo_pago = tp.id_tipo_pago inner join clientes c on p.id_cliente = c.id_cliente inner join seguimiento_pedido s on p.id_seguimiento = s.id_seguimiento where p.id_cliente =? order by p.id_pedido desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Pedidos p = new Pedidos();

                p.setId_pedido(rs.getInt("id_pedido"));
                p.setDetalle(rs.getString("detalle"));
                p.setSub_total(rs.getInt("sub_total"));
                p.setTotal(rs.getInt("total"));
                p.setFecha(rs.getString("fecha"));
                p.setImagen_pago(rs.getBinaryStream("imagen_pago"));
                p.setGuia_transporte(rs.getString("guia_transporte"));
                p.setCliente(rs.getString("cliente"));
                p.setId_cliente(rs.getInt("id_cliente"));
                p.setPago(rs.getString("pago"));
                p.setId_tipo_pago(rs.getInt("id_tipo_pago"));
                p.setSeguimiento(rs.getString("seguimiento"));
                p.setId_seguimiento(rs.getInt("id_seguimiento"));
                
                //int idP = p.getId_pedido();    
                
                p.setDetallecompras(listarDetalles(rs.getInt("id_pedido")));
                
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarPedidosDetalles(int id) {
        List<Pedidos> lista = new ArrayList();
        String sql = "select p.id_pedido, p.detalle, p.sub_total, p.total, p.fecha, p.imagen_pago, p.guia_transporte, c.nombres as cliente, p.id_cliente, tp.descripcion as pago, p.id_tipo_pago, s.descripcion as seguimiento, p.id_seguimiento from pedidos p inner join tipo_pago tp on p.id_tipo_pago = tp.id_tipo_pago inner join clientes c on p.id_cliente = c.id_cliente inner join seguimiento_pedido s on p.id_seguimiento = s.id_seguimiento where p.id_pedido =? order by p.id_pedido desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Pedidos p = new Pedidos();

                p.setId_pedido(rs.getInt("id_pedido"));
                p.setDetalle(rs.getString("detalle"));
                p.setSub_total(rs.getInt("sub_total"));
                p.setTotal(rs.getInt("total"));
                p.setFecha(rs.getString("fecha"));
                p.setImagen_pago(rs.getBinaryStream("imagen_pago"));
                p.setGuia_transporte(rs.getString("guia_transporte"));
                p.setCliente(rs.getString("cliente"));
                p.setId_cliente(rs.getInt("id_cliente"));
                p.setPago(rs.getString("pago"));
                p.setId_tipo_pago(rs.getInt("id_tipo_pago"));
                p.setSeguimiento(rs.getString("seguimiento"));
                p.setId_seguimiento(rs.getInt("id_seguimiento"));
                
                //int idP = p.getId_pedido();    
                
                p.setDetallecompras(listarDetalles(id));
                
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public List listarDetalles(int idPedido) {
        List<Carrito> listaDetalle = new ArrayList();
        String sql = "select c.id_producto, p.nombre, p.detalle, c.unidades, c.monto from carrito c inner join productos p on c.id_producto = p.id_producto where c.id_pedido=?;";

        try {
            con1 = cn1.getConnection();
            ps1 = con1.prepareStatement(sql);
            ps1.setInt(1, idPedido);
            rs1 = ps1.executeQuery();

            while (rs1.next()) {
                Carrito carrito = new Carrito();
                
                carrito.setId_producto(rs1.getInt("id_producto"));
                carrito.setNombre(rs1.getString("nombre"));
                carrito.setDetalle(rs1.getString("detalle"));
                carrito.setCantidad(rs1.getInt("unidades"));
                carrito.setPrecio(rs1.getInt("monto"));
                listaDetalle.add(carrito);
                
            }
           // cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return listaDetalle;
        
    }
    
    
    public void modificarFoto(Pedidos pedidos) {
        String sql = "update pedidos set imagen_pago=?, id_seguimiento=? where id_pedido=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBlob(1, pedidos.getImagen_pago());
            ps.setInt(2, 3);
            ps.setInt(3, pedidos.getId_pedido());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void listarImgPago(int id, HttpServletResponse response) {
        String sql = "select * from pedidos where id_pedido=" + id + ";";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");

        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("imagen_pago");
            }

            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;

            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }

            cn.cerrar_conexion();
            inputStream.close();
            outputStream.close();
            bufferedInputStream.close();
            bufferedOutputStream.close();

        } catch (Exception e) {
        }

    }
    

}
