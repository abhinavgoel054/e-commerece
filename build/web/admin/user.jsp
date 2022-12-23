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
        <title>E-Commerce(Administrator)</title>
    </head>
    <body>
        <jsp:include page="adminheader.jsp" />
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>State</th>
                        <th>City</th>
                        <th>Pin Code</th>
                        <th>Mobile</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            stmt=con.prepareStatement("Select * from Members");
                            rs=stmt.executeQuery();
                            while(rs.next())
                                {
                                String s1=rs.getString(1);
                                String s2=rs.getString(3);
                                String s3=rs.getString(4);
                                String s4=rs.getString(5);
                                String s5=rs.getString(6);
                                String s6=rs.getString(7);
                                String s7=rs.getString(8);
                                out.write("<tr>");
                                out.write("<td>"+s1+"</td>");
                                out.write("<td>"+s2+"</td>");
                                out.write("<td>"+s3+"</td>");
                                out.write("<td>"+s4+"</td>");
                                out.write("<td>"+s5+"</td>");
                                out.write("<td>"+s6+"</td>");
                                out.write("<td>"+s7+"</td>");                            
                                out.write("</tr>");
                                }
                            %>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </body>
</html>
