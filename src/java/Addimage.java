import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/Addimage")
@MultipartConfig

public class Addimage extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        PreparedStatement stmt = null;
        Connection con = null;
        InputStream is = null;
        
        String jdbcURL = "jdbc:mysql://localhost:3306/donationdb";
        String dbUser = "root";
        String dbPassword = "123456";
        
        Part filePart = request.getPart("imagefile");
        if (filePart != null){
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                
                is = filePart.getInputStream();
            }
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
            
            String sql = "insert into event(image) value(?)";
            stmt = (PreparedStatement) con.prepareStatement(sql);
            
            if(is!=null)
                stmt.setBlob(1,is);
            
            int rowsAffected = stmt.executeUpdate();
            RequestDispatcher rd;
            if (rowsAffected > 0) {
                    out.println("person added successfully!");
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                    
//                    response.sendRedirect("index.jsp");
            }
            else{
                            out.println("<center> <h3 style=\"margin-top:10px;color:darkblue;\">Failed to add person!...Please try again..!!! </h3></center>");

            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Addimage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Addimage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
