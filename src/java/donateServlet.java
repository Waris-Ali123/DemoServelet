import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

public class donateServlet extends HttpServlet {
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String uname = request.getParameter("uname");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");
            String amount = request.getParameter("amount");
            
            out.println(uname);
            out.println(contact);
            out.println(email);
            out.println(amount);
        PreparedStatement stmt = null; 
        Connection con = null;
        try {

            String jdbcURL = "jdbc:mysql://localhost:3306/donationdb";
            String dbUser = "root";
            String dbPassword = "123456";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
            out.println("CONNECTION SUCCESSFULL...");
           
            String sql = "Insert into donation(uname,contact,email,amount) values(?,?,?,?)";
            stmt = (PreparedStatement) con.prepareStatement(sql);
            stmt.setString(1,uname);
            stmt.setString(2,contact);
            stmt.setString(3,email);
            stmt.setString(4,amount);
            
        
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
            out.println("donation added successfully!");
            response.sendRedirect("Home.jsp");
            } else {
            out.println("Failed to add donation!");
            }
           
        } 
        catch (SQLException ex) {
            Logger.getLogger(donateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(donateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
               if (stmt != null) {
                   stmt.close();
               }
               if (con != null) {
                   con.close();
               }
           } catch (SQLException e) {
               e.printStackTrace();
           }

        }
 }



}
