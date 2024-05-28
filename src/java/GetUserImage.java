import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet("/GetUserImage")
public class GetUserImage extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("id");
        System.out.println("UserId in GetUserImage servlet =" + userId);
        
        PreparedStatement stmt = null;
        Connection con = null;
        try{
            String jdbcURL = "jdbc:mysql://roundhouse.proxy.rlwy.net:12449/railway";
        String dbUser = "root";
        String dbPassword = "aSJgAKmBsPORoDTdoCyuaqiFwkWNJWDy";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
            
            stmt = (PreparedStatement) con.prepareStatement("Select image from person where uid=?");
            stmt.setInt(1,Integer.parseInt(userId));
            ResultSet rs = stmt.executeQuery();

            if(rs.next()){
                byte[] imageData = rs.getBytes("image");
                OutputStream os = response.getOutputStream();
                os.write(imageData);
                os.flush();
                os.close();
            }
            else{
                System.out.println("Image not found for the user id =" +userId);
            }



        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetUserImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetUserImage.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
                   try{ if(con!=null) con.close();} catch(Exception e){e.printStackTrace();}
                }
        
        
    }

  

}
