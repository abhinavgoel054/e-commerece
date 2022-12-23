<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
PreparedStatement stmt;
ResultSet rs;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <title>E-Commerce Application</title>
        <style>
            .mydiv{
            background-color: #dddddd;
            border-radius:10px;
            box-shadow:5px 10px #aaaaaa;
            height: 400px;
            }
            
        </style>
        
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6 mydiv">
                   <label style="width:250px;font-weight: 700">Registered Mail Id :</label>
                   <input type="email" name="t1" id="t1"style="width:400px"><br><br>
                   
                   <label style="width:250px;font-weight: 700">Issue :</label>
                   <textarea name="t2" id="t1" style="width:400px; height:200px"></textarea><br><br>
                   
                   <a href="feedback.jsp"><input type="button" value="submit" name="t3" id="t3" class="btn btn-primary"></a>
                </div>
            <div class="col-lg-3"></div>
            </div>
            <br><br><hr>
            
            <footer>
                <div style="font-weight: 700; font-size: 20px" >Corporate Office :</div>
                    <div style="font-weight: 500; font-size:15px">Plot No 4,Sector-10 Dwarka </div>
                    <div style="font-weight: 500; font-size:15px">New Delhi-110075</div>
                    <div style="font-weight: 500; font-size:15px">Contact No. (+91) 897-977-3731</div>
            </footer>
            
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
