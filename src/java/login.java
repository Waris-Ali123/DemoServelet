import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class login extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ResultSet rs = null;
        String uname = request.getParameter("name");
        String password = request.getParameter("password");
        
        String jdbcURL = "jdbc:mysql://localhost:3306/donationdb";
        String dbUser = "root";
        String dbPassword = "123456";
        
        PreparedStatement stmt = null; 
        Connection con = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
            
            String sql = "Select * from person where uname= ? and password = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1,uname);
            stmt.setString(2,password);

            
            rs =  stmt.executeQuery();
            
            
            RequestDispatcher rd;
            HttpSession session = request.getSession();
            if(rs.next()){
                int userId;
                userId = rs.getInt("uid");
                
                rd = request.getRequestDispatcher("index.jsp");
//                out.println("<h1 id=\"welcomeHeading\" >Welcome " + uname + "...!</h1>");
                
//                request.setAttribute("status", "success");
                session.setAttribute("id",userId);
                session.setAttribute("uname",uname);
                
                rd.forward(request, response);
            }
            else{
//                out.println("<center> <h3 style=\"margin-top:10px;color:darkblue;\">Invalid Username and Password..!!! </h3></center>");
                rd = request.getRequestDispatcher("Sign_in.jsp");
                
                request.setAttribute("status", "failed");

//                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }
            
            
            
            
    }   catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        }

  

}
