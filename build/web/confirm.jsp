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
            <%
            Cookie[] ck=request.getCookies();
            String vl="";
            if(ck!=null)
            {
                for(Cookie c:ck)
                {
                    String nm=c.getName();
                    if(nm.equals("BASKET"))
                    {
                        vl=c.getValue();
                    }
                }
            }
            String oid="";
            if(!vl.equals(""))
            {
            String[] arr=vl.split("#");
            stmt=con.prepareStatement("select count(*)+1 from orders");
            rs=stmt.executeQuery();
            if(rs.next())
            {
                oid=rs.getString(1);
            }
            java.util.Date dt=new java.util.Date();
            String dtt=(dt.getYear()+1900)+"-"+(dt.getMonth()+1)+"-"+(dt.getDate());
            stmt=con.prepareStatement("");
            stmt=con.prepareStatement("Insert into Orders values(?,?,?,'New',0)");
            stmt.setString(1,oid);
            stmt.setString(2,dtt);
            stmt.setObject(3,session.getValue("EMAIL"));
            stmt.executeUpdate();
            int total=0;
        for(int i=1;i<arr.length;i++)
        {
            stmt=con.prepareStatement("Select * from products where pid=?");
            stmt.setString(1,arr[i]);
            rs=stmt.executeQuery();
            rs.next();
            int ss3=rs.getInt("price");
            total=total+ss3;
            stmt=con.prepareStatement("Insert into orderdetails values(?,?,?,1,?)");
            stmt.setString(1,oid);
            stmt.setString(2,arr[i]);
            stmt.setInt(3,ss3);
            stmt.setInt(4,ss3);
            stmt.executeUpdate();
        }
        stmt=con.prepareStatement("update orders set totalamt=? where oid=?");
         stmt.setInt(1,total);
         stmt.setString(2,oid);
         stmt.executeUpdate();         
         Cookie c=new Cookie("BASKET","dfdfd");
         c.setMaxAge(-1);
         response.addCookie(c);
            }
            %>
            <center>
                <h2>
                Thanks for Your Order.<br>
                We will deliver your order in COD.<br>
                Your Order Id is <%=oid%>.<br>
                <a href='index.jsp'>Home</a>
                </h2>
            </center>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
