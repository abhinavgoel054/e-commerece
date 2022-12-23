<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
PreparedStatement stmt;
ResultSet rs;
String msg="";
if(request.getParameter("t1")!=null)
    {
    String s1=request.getParameter("t1");
    
    stmt=con.prepareStatement("update members set upass=? where email=?");
    stmt.setString(1,s1);
    stmt.setObject(2,session.getValue("EMAIL"));
    stmt.executeUpdate();
    msg="<div class='alert alert-primary'>Password Change Successfully!!!</div>";
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <title>E-Commerce Application</title>
        
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6" style="background-color: #ffffff;border-radius: 10px; box-shadow: 5px 5px #aaaaaa">
                        
                        <form method="post">
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="Password" name="t1" class="form-control" required>
                        <div>
                            <div class="form-group">
                            <label>Re type Password</label>
                            <input type="password" name="t2" class="form-control" required>
                        <div>
                        <br>
                        <div class="form-group">
                            <input type="submit" class="form-control"  value="Update Password" style="width:150px">    
                        </div>
                        <%=msg%>
                        </form>
                    </div>
                    <div class="col-lg-3"></div>   
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
