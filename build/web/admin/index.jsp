<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
String msg="";
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
PreparedStatement stmt;
ResultSet rs;
if(request.getParameter("b1")!=null)
{
    String s1=request.getParameter("t1");
    String s2=request.getParameter("t2");
    stmt=con.prepareStatement("Select * from admin where ulogin=? and upass=?");
    stmt.setString(1,s1);
    stmt.setString(2,s2);
    rs=stmt.executeQuery();
    if(rs.next())
    {
        session.putValue("UTYPE","ADMIN");
        response.sendRedirect("admin.jsp");
    }
    else
    {
        msg="<div class='alert alert-danger' >INVALID USER/PASSWORD</div>";
    }
}
con.close();
%>


<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="../css/bootstrap.min.css">
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
       <title>E-Commerce</title>
    </head>
    <body>
        <br><br><br>
        <div class="container" style="background-color: antiquewhite">
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <form method="post">
                        <div class="form-group">
                            <label>Username :</label>
                            <input type="text" class="form-control" name="t1" placeholder="Enter Username" required>
                        </div>
                        <div class="form-group">
                            <label>Password :</label>
                            <input type="Password" class="form-control" name="t2" placeholder="Enter Password" required>
                        </div>
                        <div>
                            <input type="submit" class="btn btn-danger" name="b1" value="Login">
                        </div>
                        <span style="color: red"><%=msg%></span>  
                    </form>
                </div>
                <div class="col-lg-4"></div>
            </div>  
        </div>
        
    </body>
</html>
