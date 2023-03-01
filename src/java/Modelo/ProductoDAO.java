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
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listar() {
        List<Producto> lista = new ArrayList();
        String sql = "select p.id_producto, p.nombre, p.detalle, p.marca, p.talla, p.color, p.precio, p.imagen, p.estado, p.fecha_ingreso, c.descripcion as categoria, p.id_categoria, pr.descripcion as promocion, p.id_promocion from productos p inner join categorias c on p.id_categoria = c.id_categoria inner join promociones pr on p.id_promocion = pr.id_promocion order by p.id_producto desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDetalle(rs.getString("detalle"));
                p.setMarca(rs.getString("marca"));
                p.setTalla(rs.getString("talla"));
                p.setColor(rs.getString("color"));
                p.setPrecio(rs.getInt("precio"));
                p.setImagen(rs.getBinaryStream("imagen"));
                p.setEstado(rs.getInt("estado"));
                p.setFecha(rs.getString("fecha_ingreso"));
                p.setCategoria(rs.getString("categoria"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPromocion(rs.getString("promocion"));
                p.setId_promocion(rs.getInt("id_promocion"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }
    
    
    public List listarProductos(int id) {
        List<Producto> lista = new ArrayList();
        String sql = "select c.id_producto from carrito c where c.id_pedido=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }
    
    
    public List listarDamas() {
        List<Producto> lista = new ArrayList();
        String sql = "select p.id_producto, p.nombre, p.detalle, p.marca, p.talla, p.color, p.precio, p.imagen, p.estado, p.fecha_ingreso, c.descripcion as categoria, p.id_categoria, pr.descripcion as promocion, p.id_promocion from productos p inner join categorias c on p.id_categoria = c.id_categoria inner join promociones pr on p.id_promocion = pr.id_promocion where p.estado = 1 and p.id_categoria = 1 order by p.id_producto desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDetalle(rs.getString("detalle"));
                p.setMarca(rs.getString("marca"));
                p.setTalla(rs.getString("talla"));
                p.setColor(rs.getString("color"));
                p.setPrecio(rs.getInt("precio"));
                p.setImagen(rs.getBinaryStream("imagen"));
                p.setEstado(rs.getInt("estado"));
                p.setFecha(rs.getString("fecha_ingreso"));
                p.setCategoria(rs.getString("categoria"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPromocion(rs.getString("promocion"));
                p.setId_promocion(rs.getInt("id_promocion"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }
    public List listarCaballeros() {
        List<Producto> lista = new ArrayList();
        String sql = "select p.id_producto, p.nombre, p.detalle, p.marca, p.talla, p.color, p.precio, p.imagen, p.estado, p.fecha_ingreso, c.descripcion as categoria, p.id_categoria, pr.descripcion as promocion, p.id_promocion from productos p inner join categorias c on p.id_categoria = c.id_categoria inner join promociones pr on p.id_promocion = pr.id_promocion where p.estado = 1 and p.id_categoria = 2 order by p.id_producto desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDetalle(rs.getString("detalle"));
                p.setMarca(rs.getString("marca"));
                p.setTalla(rs.getString("talla"));
                p.setColor(rs.getString("color"));
                p.setPrecio(rs.getInt("precio"));
                p.setImagen(rs.getBinaryStream("imagen"));
                p.setEstado(rs.getInt("estado"));
                p.setFecha(rs.getString("fecha_ingreso"));
                p.setCategoria(rs.getString("categoria"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPromocion(rs.getString("promocion"));
                p.setId_promocion(rs.getInt("id_promocion"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }
    public List listarNinios() {
        List<Producto> lista = new ArrayList();
        String sql = "select p.id_producto, p.nombre, p.detalle, p.marca, p.talla, p.color, p.precio, p.imagen, p.estado, p.fecha_ingreso, c.descripcion as categoria, p.id_categoria, pr.descripcion as promocion, p.id_promocion from productos p inner join categorias c on p.id_categoria = c.id_categoria inner join promociones pr on p.id_promocion = pr.id_promocion where p.estado = 1 and p.id_categoria = 3 order by p.id_producto desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDetalle(rs.getString("detalle"));
                p.setMarca(rs.getString("marca"));
                p.setTalla(rs.getString("talla"));
                p.setColor(rs.getString("color"));
                p.setPrecio(rs.getInt("precio"));
                p.setImagen(rs.getBinaryStream("imagen"));
                p.setEstado(rs.getInt("estado"));
                p.setFecha(rs.getString("fecha_ingreso"));
                p.setCategoria(rs.getString("categoria"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPromocion(rs.getString("promocion"));
                p.setId_promocion(rs.getInt("id_promocion"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public List listarAccesorios() {
        List<Producto> lista = new ArrayList();
        String sql = "select p.id_producto, p.nombre, p.detalle, p.marca, p.talla, p.color, p.precio, p.imagen, p.estado, p.fecha_ingreso, c.descripcion as categoria, p.id_categoria, pr.descripcion as promocion, p.id_promocion from productos p inner join categorias c on p.id_categoria = c.id_categoria inner join promociones pr on p.id_promocion = pr.id_promocion where p.estado = 1 and p.id_categoria = 4 order by p.id_producto desc;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDetalle(rs.getString("detalle"));
                p.setMarca(rs.getString("marca"));
                p.setTalla(rs.getString("talla"));
                p.setColor(rs.getString("color"));
                p.setPrecio(rs.getInt("precio"));
                p.setImagen(rs.getBinaryStream("imagen"));
                p.setEstado(rs.getInt("estado"));
                p.setFecha(rs.getString("fecha_ingreso"));
                p.setCategoria(rs.getString("categoria"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPromocion(rs.getString("promocion"));
                p.setId_promocion(rs.getInt("id_promocion"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from productos where id_producto=" + id + ";";
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
                inputStream = rs.getBinaryStream("imagen");
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

    public Producto listarId(int id) {
        String query = "select * from productos where id_producto=" + id;
        Producto producto = new Producto();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                producto.setId_producto(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDetalle(rs.getString("detalle"));
                producto.setMarca(rs.getString("marca"));
                producto.setTalla(rs.getString("talla"));
                producto.setColor(rs.getString("color"));
                producto.setPrecio(rs.getInt("precio"));
                producto.setImagen(rs.getBinaryStream("imagen"));
                producto.setEstado(rs.getInt("estado"));
                producto.setFecha(rs.getString("fecha_ingreso"));                
            }
        } catch (Exception e) {
        }
        return producto;
    }

    public void agregar(Producto producto) {
        String sql = "INSERT INTO productos (nombre,detalle,marca,talla,color,precio,imagen,estado,fecha_ingreso,id_categoria,id_promocion) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDetalle());
            ps.setString(3, producto.getMarca());
            ps.setString(4, producto.getTalla());
            ps.setString(5, producto.getColor());
            ps.setInt(6, producto.getPrecio());
            ps.setBlob(7, producto.getImagen());
            ps.setInt(8, producto.getEstado());
            ps.setString(9, producto.getFecha());
            ps.setInt(10, producto.getId_categoria());
            ps.setInt(11, producto.getId_promocion());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void modificar(Producto producto) {
        String sql = "update productos set nombre=?, detalle=?, marca=?, talla=?, color=?, precio=?, estado=?, fecha_ingreso=?, id_categoria=?, id_promocion=? where id_producto=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDetalle());
            ps.setString(3, producto.getMarca());
            ps.setString(4, producto.getTalla());
            ps.setString(5, producto.getColor());
            ps.setInt(6, producto.getPrecio());
            ps.setInt(7, producto.getEstado());
            ps.setString(8, producto.getFecha());
            ps.setInt(9, producto.getId_categoria());
            ps.setInt(10, producto.getId_promocion());
            ps.setInt(11, producto.getId_producto());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void modificarFoto(Producto producto) {
        String sql = "update productos set imagen=? where id_producto=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBlob(1, producto.getImagen());
            ps.setInt(2, producto.getId_producto());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
    public void modificarEstado(int idProducto){
    String sql= "update productos set estado=2 where id_producto=?;";
    try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void modificarEstadoActivo(int idProducto){
    String sql= "update productos set estado=1 where id_producto=?;";
    try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void modificarCarrito(int idProducto){
    String sql= "delete from carrito where id_producto=?;";
    try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProducto);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
    public void eliminar(Producto producto) {
        String sql = "delete from productos where id_producto=?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getId_producto());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List listarDetalle(int idDetalle) {
        List<Producto> lista = new ArrayList();
        String sql = "select p.id_producto, p.nombre, p.detalle, p.marca, p.talla, p.color, p.precio, p.imagen, p.estado, p.fecha_ingreso, c.descripcion as categoria, p.id_categoria, pr.descripcion as promocion, p.id_promocion from productos p inner join categorias c on p.id_categoria = c.id_categoria inner join promociones pr on p.id_promocion = pr.id_promocion where p.id_producto=" + idDetalle + ";";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDetalle(rs.getString("detalle"));
                p.setMarca(rs.getString("marca"));
                p.setTalla(rs.getString("talla"));
                p.setColor(rs.getString("color"));
                p.setPrecio(rs.getInt("precio"));
                p.setImagen(rs.getBinaryStream("imagen"));
                p.setEstado(rs.getInt("estado"));
                p.setFecha(rs.getString("fecha_ingreso"));
                p.setCategoria(rs.getString("categoria"));
                p.setId_categoria(rs.getInt("id_categoria"));
                p.setPromocion(rs.getString("promocion"));
                p.setId_promocion(rs.getInt("id_promocion"));
                lista.add(p);
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public int cantidadProductos(){
       int total = 0;
        String sql = "select count(id_producto) as cantidad from productos;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                total = (rs.getInt("cantidad"));
            }
            cn.cerrar_conexion();
        } catch (Exception e) {
        }
       
       return total;
    }
    
    

}
