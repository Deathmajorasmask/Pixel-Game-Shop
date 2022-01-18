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
public class usuer {
    
    private int idUser;
    private String namePUser;
    private String nameLUser;
    private String nickUser;
    private String password;
    private byte[] imageUser;
    private boolean active;
    private String emailUser;
    private String direccion;
    
    private String telefono;

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getNamePUser() {
        return namePUser;
    }

    public void setNamePUser(String namePUser) {
        this.namePUser = namePUser;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password =password;
    }
    
    public String getNameLUser() {
        return nameLUser;
    }

    public void setNameLUser(String nameLUser) {
        this.nameLUser = nameLUser;
    }

    public String getNickUser() {
        return nickUser;
    }

    public void setNickUser(String nickUser) {
        this.nickUser = nickUser;
    }

    public byte[] getImageUser() {
        return imageUser;
    }

    public void setImageUser(byte[] imageUser) {
        this.imageUser = imageUser;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
    public usuer(){}

     public usuer(int Pid, String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel,String Ppass){
          this.idUser=Pid;
          this.namePUser=NPuser;
          this.nameLUser=NLuser;
          this.nickUser=Pnick;
          this.emailUser=Pemail;
          this.direccion=Pdire;
          this.telefono=tel;
          this.password=Ppass;
     
     }

     public usuer(int Pid, String NPuser, String NLuser){
          this.idUser=Pid;
          this.namePUser=NPuser;
          this.nameLUser=NLuser;
     
     }
      public usuer(int Pid, String NPuser, String NLuser,String dir){
          this.idUser=Pid;
          this.namePUser=NPuser;
          this.nameLUser=NLuser;
          this.direccion=dir;
     
     }
     
     public usuer(int Pid){
          this.idUser=Pid;
      
     }

        public usuer( String NPuser, String NLuser, byte[] image){
          
          this.namePUser=NPuser;
          this.nameLUser=NLuser;
          this.imageUser=image;
     }  
     
     public usuer(usuer other){
     
          this.idUser= other.idUser;
          this.namePUser=other.namePUser;
          this.nameLUser=other.nameLUser;
          this.nickUser= other.nickUser;
          this.emailUser=other.emailUser;
          this.direccion=other.direccion;
          this.telefono=other.telefono;
          this.password=other.password;
               
     }
     
        //Agregar un usuario
    static public void AddUser(String NPuser, String NLuser, String Pemail, String Pnick, String Pdire, String tel, String Pass, InputStream userImage){
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

            statement = con.prepareCall(DBUtils.P_ADD_USER);
            statement.setString(1, NPuser);
            statement.setString(2, NLuser);
            statement.setString(3, Pemail);
            statement.setString(4, Pnick);
            statement.setString(5, Pass);         
            statement.setString(6, tel);
            statement.setString(7, Pdire);
            statement.setBinaryStream(8, userImage);
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
 

    
    static public List<usuer> GetAllUsers(int Activate){
        List<usuer> users = new ArrayList<usuer>();
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
            statement = con.prepareCall(DBUtils.P_GETALL_USER);
            statement.setInt(1, Activate);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idusuario");
                String name = rS.getString("nombre");
               String apel =rS.getString("apellido");
// byte[] image = rS.getBytes("apellido");
                usuer user = new usuer(id,name,apel);
                users.add(user);
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
        return users;
    }
    
     static public List<usuer> GetUsers(int Activate){
        List<usuer> users = new ArrayList<usuer>();
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
            statement = con.prepareCall(DBUtils.P_GET_US);
            statement.setInt(1, Activate);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idusuario");
                String name = rS.getString("nombre");
               String apel =rS.getString("apellido");
               String direc=rS.getString("dereccion");
// byte[] image = rS.getBytes("apellido");
                usuer user = new usuer(id,name,apel,direc);
                users.add(user);
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
        return users;
    }
    
    
      static public void ModyUser(int id, String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, String Pass, InputStream userImage){
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

            statement = con.prepareCall(DBUtils.P_ADD_USER);
            statement.setString(1, NPuser);
            statement.setString(2, NLuser);
            statement.setString(3, Pemail);
            statement.setString(4, Pnick);
            statement.setString(5, Pass);         
            statement.setString(6, tel);
            statement.setString(7, Pdire);
            statement.setBinaryStream(8, userImage);
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
    
   
    
      static public List<usuer> GetLogUsers(int Activate){
        List<usuer> users = new ArrayList<usuer>();
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
            statement = con.prepareCall(DBUtils.P_GET_US);
            statement.setInt(1, Activate);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idusuario");

                String name = rS.getString("nombre");
               String apel =rS.getString("apellido");
              //   byte[] image = rS.getBytes("imagen");
               // usuer user = new usuer(name,apel,image);
                 usuer user = new usuer(id,name,apel);
               users.add(user);
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
        return users;
    }
      
      
    static public List<usuer> GetLogedUsers(String nick, String pass){
        List<usuer> users = new ArrayList<usuer>();
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
            statement = con.prepareCall(DBUtils.P_LOG);
            statement.setString(1, nick);
            statement.setString(2, pass);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idusuario");

              //   byte[] image = rS.getBytes("imagen");
               // usuer user = new usuer(name,apel,image);
                 usuer user = new usuer(id);
               users.add(user);
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
        return users;
    }
    
     
         static public byte[] GetImageUser(int idUser){
        byte[] imageBytes = null;
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

            statement = con.prepareCall(DBUtils.P_IMAGE_USER);
            statement.setInt(1, idUser);
            rS = statement.executeQuery();
            while(rS.next()){
                imageBytes = rS.getBytes("imagen");
            }
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
        return imageBytes;
    }
         
         
         
         
          static public List<usuer> GetLogedAdm(String nick, String pass){
        List<usuer> users = new ArrayList<usuer>();
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
            statement = con.prepareCall(DBUtils.P_ADM);
            statement.setString(1, nick);
            statement.setString(2, pass);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("id_admin");

              //   byte[] image = rS.getBytes("imagen");
               // usuer user = new usuer(name,apel,image);
                 usuer user = new usuer(id);
               users.add(user);
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
        return users;
    }
    
}
