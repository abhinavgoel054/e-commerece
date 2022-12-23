<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getValue("UTYPE")==null || !session.getValue("UTYPE").toString().equals("ADMIN"))
{
    response.sendRedirect("index.jsp");
}
Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
    PreparedStatement stmt;
    ResultSet rs;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <style>
            .mydiv{
                background-color: antiquewhite;
                border-color: black;
                border-width: 0px;
                border-radius: 20px;
                border-style:solid;
                box-shadow: 5px 10px appworkspace;
                margin: 20px;
                height: 200px;
                text-align: center;
                padding: 10px;
                vertical-align: middle;
                
            }
            
        </style>
        <title>E-Commerce</title>
    </head>
    <body>
        <jsp:include page="adminheader.jsp" />
        <hr>
        <%
        String s1="0",s2="0",s3="0",s4="0",s5="0",s6="0";%>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 mydiv">
                    <%    
                    stmt=con.prepareStatement("select count(*) from categories");
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                    s1=rs.getString(1);
                    }
                    %>
                    <label>Total Category:</label><br>
                    <%=s1%>
                </div>
                <div class="col-lg-3 mydiv">
                    <%    
                    stmt=con.prepareStatement("select count(*) from products");
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                    s2=rs.getString(1);
                    }
                    %>
                    <label>Total Product:</label><br>
                    <%=s2%>
                </div>
                <div class="col-lg-3 mydiv">
                    <%    
                    stmt=con.prepareStatement("select count(*) from members");
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                    s3=rs.getString(1);
                    }
                    %>
                    <label>Total Member:</label><br>
                    <%=s3%>
                </div>
                <div class="col-lg-3 mydiv">
                    <%    
                    stmt=con.prepareStatement("select count(*) from orders where ostatus='New'");
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                    s4=rs.getString(1);
                    }
                    stmt=con.prepareStatement("select count(*) from orders where ostatus='Shipped'");
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                    s5=rs.getString(1);
                    }
                    stmt=con.prepareStatement("select count(*) from orders where ostatus='Delivered'");
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                    s6=rs.getString(1);
                    }
                    %>
                    <label>New Order : <%=s4%></label><br>
                    <label>Shipped Order :<%=s5%></label><br>
                    <label>Delivered Order :<%=s6%></label><br>
                </div>
                <div class="col-lg-3 mydiv"></div>
                <div class="col-lg-3 mydiv"></div>
            </div>
        </div>
    </body>
</html>
