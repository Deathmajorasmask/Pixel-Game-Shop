/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author Deathmajorasmask
 */
public class DBUtils {
    public static String P_ADD_USER = "CALL AddUser(?,?,?,?,?,?,?,?);";
    
    
    public static String P_REMOVE_USER = "CALL RemoveUser(?);";
    public static String P_GETALL_USER = "CALL GetAllUsers(?);";
    public static String P_IMAGE_USER = "CALL GetImageUser(?);";
    public static String P_GETALL_PROD = "CALL getAllPrd()";
    public static String P_ADD_PROD1 = "CALL addarticulo1(?,?,?,?,?,?)";
    
    public static String P_ADD_PROD2 = "CALL addarticulo2(?,?,?,?,?,?,?)";
    public static String P_ADD_PROD3 = "CALL addarticulo3(?,?,?,?,?,?,?,?)";
    public static String P_GETOPRD = "CALL getonePRD(?)";
    
    public static String P_LOG = "CALL logUS(?,?)";
    public static String P_GET_US = "CALL getUS(?)";
    
        
    public static String P_GET_CP = "CALL getprodbyCt(?)";
     public static String P_GET_BS = "CALL buscar(?)";
 
     public static String P_newCom = "CALL new_comp(?,?,?,?)";
     public static String P_carr = "CALL carrito(?)";
     
    public static String P_moCar = "CALL modcantCar(?,?)";
    public static String P_canCar= "CALL cancelar_compra(?)";
         
    public static String P_getPet= "CALL getPeti()";
     
          
    public static String P_AcPeti = "CALL acepCarr(?,?)";
    public static String P_ADM = "CALL logAD(?,?)";
    
    public static String P_HOM = "CALL inicio()";
     
     
    public static String P_AcComp = "CALL compra(?)";
       
       
    public static String P_ListComs = "CALL ListCom(?)";
    public static String P_AddComnt = "CALL addCom(?,?,?,?)";
     
             
             public static String P_Pop = "CALL Puedo(?,?)";
   
}
