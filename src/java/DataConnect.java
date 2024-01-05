import java.sql.*;
public class DataConnect {
     public static Connection condb() 
    {
     
      Connection con=null; 
    
         try {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
             con=DriverManager.getConnection("jdbc:derby://localhost:1527/wc2helpcenter;create=true","root","root");
         } catch (Exception ex) {
             System.out.println(ex);
           
         }
     
    return con;
    }
}