
package Controll;
import java.sql.Connection;
import java.sql.DriverManager;

public class Logic {
    public static Connection conn() {
        Connection con=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");//load the driver
            //Create the connection
            //Connection is an interface
            //Drivermanager is a class and getConnetcion()is a static metod of DriverManager class whose return type is Connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SayariKiDhuniya","root","1234"); 
            //type iv url=jdbc:oracle:thin:@//localhost:1521/xe
            //user name=infinite
            //password=5151
        }
        catch(Exception e){
            System.out.println(e);
        }
        return con; //return the connection
    }
}
