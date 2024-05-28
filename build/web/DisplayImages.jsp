<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <style>
/*            #imageGallery {
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
                column-gap: 25px;
                row-gap: 25px;
                justify-content: space-around;
                background-color: cyan;
            }
            
            .image {
                width:400px;
                height:300px;
                display: flex;
                align-items: center;
            }
            
*/          body{
                /*background-color: gray;*/
            }
            
            .jumbotron{
                width:100%;
            }

            .container{
                background-color: black;
                width:100%;
                padding-left:35px;
            }
            img{
                /*width:inherit;*/
                display: block;
                max-width: 400px;
                max-height: 300px;
                /*height: inherit;*/
                border-radius: 15px;
                transition: transform .2s ease;
                
            }
            
            .thumbnail:hover{
                transform: scale(1.025);
                /*background-color: darkgreen;*/
                color:#fff;
                
            }
            
            h1{
                color:white;
                text-align: center;
                font-size:35px;
                margin-top:10px;
                margin-bottom:20px;
            }
            
            
            
        </style>
    </head>

        <div class="container ">
        <h1 class="jumbotron">Taiba College Memories!</h1>

                       
        <%              
                System.out.println("Connection done");  
                Connection con = null;
                PreparedStatement stmt = null;
                System.out.println("Connection done" + con);  
                System.out.println("Connection done" + stmt);
                String jdbcURL = "jdbc:mysql://localhost:3306/donationdb";
                String dbUser = "root";
                String dbPassword = "123456";
                int count=0;

                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(jdbcURL,dbUser,dbPassword);
                String sql = "Select * from event";
                System.out.println("Class added"); 
                stmt = con.prepareStatement(sql);
                System.out.println("Class added"); 
                
                ResultSet rs = stmt.executeQuery();
                while(rs.next()){
                    int imageid = rs.getInt("id");
                    System.out.println("imageid =" + imageid);

           %>
           
           <% if (count%3==0) {  %>
                <div class="row">
            <%   } %>
           
           
               
               
    <div class="col-md-4 ">
      <div class="thumbnail ">
        <a href="ImageServlet?id=<%=imageid%>" >
          <img class="image" src="ImageServlet?id=<%=imageid%>" alt="<%=imageid%>" style="width:100%">
<!--          <div class="caption">
            <p>THIS IS VERY BEAUTIFUL IMAGE</p>
          </div>-->
        </a>
      </div>
    </div>
           
           <% 
               count++;
               if (count%3==0) {  %>
                </div>     <!-- row completes -->
            <%   } %>
           
           
           <%
                    
                }//end of while

                }//end of try
                catch(Exception e){
                e.printStackTrace();
                }//end of catch
                finally{
                   try{ if(con!=null) con.close();} catch(Exception e){e.printStackTrace();}
                }
                
            %>
         
  </div>
 
    </body>
</html>
