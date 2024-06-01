
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            String imageid = request.getParameter("id");
            Connection con = null;
            try{
                String jdbcURL = "jdbc:mysql://localhost:3306/donationdb";
                String dbUser = "root";
                String dbPassword = "123456";
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
                
                PreparedStatement stmt = (PreparedStatement) con.prepareStatement("Select image from event where id=?");
                stmt.setInt(1,Integer.parseInt(imageid));
                ResultSet rs = stmt.executeQuery();
                
                if(rs.next()){
                    byte[] imageData = rs.getBytes("image");
                    response.setContentType("image/png");
                    System.out.println("You are in ImageServlet");
                    OutputStream os = response.getOutputStream();
                    os.write(imageData);
                    os.flush();
                    os.close();
                }
                
                
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
                   try{ if(con!=null) con.close();} catch(Exception e){e.printStackTrace();}
                }

                    

        
        
    }

  

}
