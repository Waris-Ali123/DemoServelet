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
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/register")
@MultipartConfig(maxFileSize = 16177215)
public class register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            PreparedStatement stmt = null;
            Connection con = null;
            InputStream is = null;
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
        
        try {
            
            String uname = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String city = request.getParameter("city");
            String password = request.getParameter("password1");
            Part filePart = request.getPart("image");
            
            String jdbcURL = "jdbc:mysql://localhost:3306/donationdb";
            String dbUser = "root";
            String dbPassword = "123456";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
            
            String sql = "Insert into person(uname,email,contact,city,password,image) values(?,?,?,?,?,?)";
            stmt = con.prepareStatement(sql);
            
            stmt.setString(1,uname);
            stmt.setString(2,email);
            stmt.setString(3,contact);
            stmt.setString(4,city);
            stmt.setString(5,password);
            
            if (filePart != null){
//                System.out.println("Nothing is passed in the image");
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                
                if(filePart.getSize()!=0){
                is = filePart.getInputStream();
                }
                else{
                String filePath = "C:/NetBeansProjects/DemoServelet/web/Images/Screenshot_20221203_115750.png" ;
                is = new FileInputStream(filePath);  
                }
            }
            
            
            if(is != null)
                stmt.setBlob(6,is);
           
            
            
            int rowsAffected = stmt.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("Sign_up.jsp");
            if (rowsAffected > 0) {
//            out.println("person added successfully!");
//            out.println("<h1 id=\"welcomeHeading\" >Please login with the same credentials " + uname + "...!</h1>");
//            request.setAttribute("id",userId);
            request.setAttribute("status", "success");
//            response.sendRedirect("Home.html");
            } else {
//            out.println("");
//            out.println("<center> <h3 style=\"margin-top:10px;color:darkblue;\">Failed to add person!...Please try again..!!! </h3></center>");
            request.setAttribute("status", "failed");

//                RequestDispatcher rd = request.getRequestDispatcher(".html");
//                rd.forward(request, response);
            }
            rd.forward(request, response);
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
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
