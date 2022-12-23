<%@page import="java.io.*,java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <title>E-Commerce (Administrator)</title>
    </head>
    <body>        
        <jsp:include page="adminheader.jsp" />
        <div class="container">            
            <hr>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Order Date</th>
                        <th>Customer Email</th>
                        <th>Current Status</th>
                        <th>Total Amount</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        stmt=con.prepareStatement("Select * from Orders where ostatus='Delivered'");
                        rs=stmt.executeQuery();
                        while(rs.next())
                        {
                            String s1=rs.getString(1);
                            String s2=rs.getString(2);
                            String s3=rs.getString(3);
                            String s4=rs.getString(4);
                            String s5=rs.getString(5);
                            out.write("<tr>");
                            out.write("<td>"+s1+"</td>");
                            out.write("<td>"+s2+"</td>");
                            out.write("<td>"+s3+"</td>");
                            out.write("<td>"+s4+"</td>");
                            out.write("<td>"+s5+"</td>");
                            out.write("<td><a href='deliveredorder.jsp?opr=D&oid="+s1+"'>Show Details</a></td>");
                                                     
                            out.write("</tr>");
                        }
                    %>
                </tbody>
            </table>
                <br>
                <hr>
                <table class="table table-striped">
                <thead><tr>
                <th>Product Name</th><th>Details</th><th>Price</th><th>Qty</th><th>Amount</th><th>Photo</th>
                </tr>
                </thead>
                <tbody>
                    <%
                    if(request.getParameter("oid")!=null && request.getParameter("opr").equals("D"))
                    {
                    stmt=con.prepareStatement("Select pname,details,photo,orderdetails.price,qty,amt from Products,OrderDetails where OrderDetails.pcode=products.pid and orderdetails.oid=?");
                    stmt.setString(1,request.getParameter("oid"));
                    rs=stmt.executeQuery();
                    while(rs.next())
                        {
                            String s1=rs.getString(1);
                            String s2=rs.getString(2);
                            String s3=rs.getString(3);
                            String s4=rs.getString(4);
                            String s5=rs.getString(5);
                            String s6=rs.getString(6);  
                            out.write("<tr>");
                                out.write("<td>"+s1+"</td>");
                                out.write("<td>"+s2+"</td>");
                                out.write("<td>"+s4+"</td>");
                                out.write("<td>"+s5+"</td>");
                                out.write("<td>"+s6+"</td>");
                                out.write("<td><img src='../images/"+s3+"' width='70px'></td>");
                                
                            out.write("</tr>");
                        }
                        
                    }
                    %>
                </tbody>
                </table>
        </div>        
    </body>
</html>
