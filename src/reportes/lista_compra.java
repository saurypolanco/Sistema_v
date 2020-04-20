/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

/**
 *
 * @author ING.DARWIN GARCIA
 */
public class lista_compra {
    private String articulo;
    private String precio_compra;
    private String precio_venta;
    private String cantidad;
    private String descripcion;
    //private String balance;

    public lista_compra(String articulo, String precio_compra, String precio_venta,String cantidad, String descripcion) {
     
        this.articulo = articulo;
        this.precio_compra = precio_compra;
        this.precio_venta = precio_venta;
        this.cantidad= cantidad;
        this.descripcion = descripcion;
       // this.balance = balance;
  
    }

    public lista_compra(String string, String string0, String string1, String string2) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public String getid_articulo() {
        return articulo;
    }

    public void setid_equipo(String articulo) {
        this.articulo = articulo;
    }

    public String getprecio_compra() {
        return precio_compra;
    }

    public void setprecio_compra(String precio_compra) {
        this.precio_compra = precio_compra;
    }

       public String getprecio_venta() {
        return precio_venta;
    }

    public void setprecio_venta(String precio_venta) {
        this.precio_venta = precio_venta;
    }
    
    public String getcantidad() {
        return cantidad;
    }

    public void setdiagnostico(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getdescripcion() {
        return descripcion;
    }

    public void setdescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}



    

