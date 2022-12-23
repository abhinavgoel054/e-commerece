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
        
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <div class="row">
                <%
                   
                    stmt=con.prepareStatement("select * from products order by rand()");
                    if(request.getParameter("cid")!=null)
                    {
                        stmt=con.prepareStatement("select * from products where cid=? order by rand()");
                        stmt.setString(1,request.getParameter("cid"));
                    }
                    rs=stmt.executeQuery();
                    while(rs.next())
                    {
                    String s1=rs.getString(1);
                    String s2=rs.getString(2);
                    String s3=rs.getString(3);
                    String s4=rs.getString(4);
                    String s5=rs.getString(5);
                    String s6=rs.getString(6);
                    out.write("<div class='col-lg-4' style='text-align:center'><br>");
                    out.write("<img src='images/"+s6+"'><br>");
                    out.write(s3+"<br>");
                    out.write(s4+"<br>");
                    out.write("Rs "+s5+"/-<br>");
                    out.write("<a href='addincart.jsp?pid="+s1+"'><img src='images/addtocart.jpg' style='width:150px'></a>");
                    out.write("</div>");
                }
                %>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
