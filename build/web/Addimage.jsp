<%-- 
    Document   : Addimage
    Created on : May 21, 2024, 1:50:54 AM
    Author     : win 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Addimage" method="post" enctype="multipart/form-data" style="display:flex;flex-direction: column;align-items: center;justify-content: center;gap: 55px">
            <input type="file" name="imagefile" >
            <input type="submit" value="Add the image">
        </form>
        
    </body>
</html>
