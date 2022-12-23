<%-- 
    Document   : index
    Created on : Dec 12, 2022, 8:48:38 AM
    Author     : india
--%>
<%@page import="java.io.*,java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("org.gjt.mm.mysql.Driver");    
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
PreparedStatement stmt;
ResultSet rs;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <title>E-Commerce Application</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container" style="text-align:center">
            <h2>Thanks for your Feedback<br>Happy Shopping<br>
                <a href="index.jsp">Home</a>
            </h2>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
