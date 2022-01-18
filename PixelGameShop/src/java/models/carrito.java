/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import Utils.DBUtils;
import java.sql.Connection;
//import com.mysql.jdbc.Statement;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Logger;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;


/**
 *
 * @author Deathmajorasmask
 */
public class carrito {
    
    
    private int idCar;
    private int cant;
    private int PrUn;
    private int idArt;
    private int idUsu;
    private int idEst;
    private int idAdm;
    private int idTdP;
    private String nombre;
    private String descri;
    private int idcat;
    private String catego;
    private String Est;
    private String TP;
    private String Pimg;

    public int getIdCar() {
        return idCar;
    }

    public void setIdCar(int idCar) {
        this.idCar = idCar;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public int getPrUn() {
        return PrUn;
    }

    public void setPrUn(int PrUn) {
        this.PrUn = PrUn;
    }

    public int getIdArt() {
        return idArt;
    }

    public void setIdArt(int idArt) {
        this.idArt = idArt;
    }

    public int getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(int idUsu) {
        this.idUsu = idUsu;
    }

    public int getIdEst() {
        return idEst;
    }

    public void setIdEst(int idEst) {
        this.idEst = idEst;
    }

    public int getIdAdm() {
        return idAdm;
    }

    public void setIdAdm(int idAdm) {
        this.idAdm = idAdm;
    }

    public int getIdTdP() {
        return idTdP;
    }

    public void setIdTdP(int idTdP) {
        this.idTdP = idTdP;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public int getIdcat() {
        return idcat;
    }

    public void setIdcat(int idcat) {
        this.idcat = idcat;
    }

    public String getCatego() {
        return catego;
    }

    public void setCatego(String catego) {
        this.catego = catego;
    }

    public String getEst() {
        return Est;
    }

    public void setEst(String Est) {
        this.Est = Est;
    }

    public String getTP() {
        return TP;
    }

    public void setTP(String TP) {
        this.TP = TP;
    }

    public String getPimg() {
        return Pimg;
    }

    public void setPimg(String Pimg) {
        this.Pimg = Pimg;
    }
    
    
    public carrito(int id,int preUn,int cants,int Idart,String name,String desc,int ic,String ncact,int ie,String pest,String URL, int iu, int it,String pTP){
        
    idCar=id;
    cant=cants;
     PrUn=preUn;
     idArt=Idart;
     idUsu=iu;
     idEst=ie;
     idAdm=1;
     idTdP=it;
     nombre=name;
     descri=desc;
     idcat=ic;
     catego=ncact;
     Est=pest;
     TP=pTP;
     Pimg=URL;
    
    
    
    
    }
    
    public carrito(int id){
    idArt=id;
    
    }
    
    public carrito(int cants,int Idart,String name,String desc,String ncact,String URL){
        
    cant=cants;
     idArt=Idart;
     nombre=name;
     descri=desc;
     catego=ncact;
     Pimg=URL;
    
    
    
    
    }
    
           static public void AddCarr( int arty, int cli,int cant,int TP){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_newCom);
            statement.setInt(1,arty);
            statement.setInt(2, cli);
          statement.setInt(3, cant);
          statement.setInt(4, TP);

           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
 
           
              static public List<carrito> GetCarr(String ida ){
        List<carrito> carrs = new ArrayList<carrito>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_carr);
        statement.setString(1, ida);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idcarrito");
                int preUn=rS.getInt("precUn");
                int cant=rS.getInt("cantidad");
                int Idart=rS.getInt("Id_articulo");
                String name = rS.getString("articulo");
                String desc = rS.getString("Adesc");
                int ic = rS.getInt("idcategoria");
               String ncact = rS.getString("categoria");
                int ie = rS.getInt("Id_estado");
                String est = rS.getString("estado");
                String URL = rS.getString("img");
               int iu = rS.getInt("Id_usuario");  
                 int it = rS.getInt("Id_TipoPago");  
                  String TP = rS.getString("TP");
               
              
// byte[] image = rS.getBytes("apellido");
                carrito carro = new  carrito(id,preUn,cant,Idart,name,desc,ic,ncact,ie,est,URL,iu,it,TP);
                carrs.add(carro);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return carrs;
    }
              
              
              
              static public void MoyCarr( int car, int cant){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_moCar);
            statement.setInt(1,car);
            statement.setInt(2, cant);

           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
    
              
         static public void PutCarr( int car, int cant){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_AcPeti);
            statement.setInt(1,car);
            statement.setInt(2, cant);

           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
              
              
              
              
              
                       static public void CanCarr( int car){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_canCar);
            statement.setInt(1,car);


           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
                       
                       
                       
                       
        static public List<carrito> GetPety( ){
        List<carrito> carrs = new ArrayList<carrito>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_getPet);

            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idcarrito");
                int preUn=rS.getInt("precUn");
                int cant=rS.getInt("cantidad");
                int Idart=rS.getInt("Id_articulo");
                String name = rS.getString("articulo");
                String desc = rS.getString("Adesc");
                int ic = rS.getInt("idcategoria");
               String ncact = rS.getString("categoria");
                int ie = rS.getInt("Id_estado");
                String est = rS.getString("estado");
                String URL = rS.getString("img");
               int iu = rS.getInt("Id_usuario");  
                 int it = rS.getInt("Id_TipoPago");  
                  String TP = rS.getString("TP");
               
              
// byte[] image = rS.getBytes("apellido");
                carrito carro = new  carrito(id,preUn,cant,Idart,name,desc,ic,ncact,ie,est,URL,iu,it,TP);
                carrs.add(carro);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return carrs;
    }
        
        
        static public List<carrito> GetHomi( ){
        List<carrito> carrs = new ArrayList<carrito>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_HOM);

            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int cant=rS.getInt("cantidad");
                int Idart=rS.getInt("Id_articulo");
                String name = rS.getString("articulo");
                String desc = rS.getString("Adesc");
               String ncact = rS.getString("categoria");
                String URL = rS.getString("URL");
               
              
// byte[] image = rS.getBytes("apellido");
                carrito carro = new  carrito(cant,Idart,name,desc,ncact,URL);
                carrs.add(carro);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return carrs;
    }
        
        
        
          static public void accCarr( int car){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_AcComp);
            statement.setInt(1,car);
      

           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
          
          
          
            static public List<carrito> Getperm(int ida, int idc ){
        List<carrito> carrs = new ArrayList<carrito>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_Pop);
        statement.setInt(1, ida);
        statement.setInt(2, idc);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                
                
                int Idart=rS.getInt("Id_articulo");
               
              
// byte[] image = rS.getBytes("apellido");
                carrito carro = new  carrito(Idart);
                carrs.add(carro);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return carrs;
    }
}
