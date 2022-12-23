<%-- 
    Document   : index
    Created on : Dec 12, 2022, 8:48:38 AM
    Author     : india
--%>
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
String msg="";
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
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <form method="post" action="saveproduct.jsp" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Category Name:</label>
                            <select class="form-control" name="t1">
                            <%
                                stmt=con.prepareStatement("Select * from Categories");
                                rs=stmt.executeQuery();
                                while(rs.next())
                                {
                                    String s1=rs.getString(1);
                                    String s2=rs.getString(2);
                                    out.write("<option value='"+s1+"'>"+s2+"</option>");
                                }
                            %>    
                            </select>
                        </div>
                          <div class="form-group">
                            <label>Product Name:</label>
                            <input type="text" name="t2" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Product Details:</label>
                            <input type="text" name="t3" class="form-control" required>
                        </div>
                            <div class="form-group">
                            <label>Price(Rs):</label>
                            <input type="text" name="t4" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Category Image:</label>
                            <input type="file" name="t5" accept="image/jpg" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="b1" value="Save Details" class="btn btn-danger">
                        </div>                        
                    </form>
                </div>
                <div class="col-lg-4"></div>
            </div>
            <hr>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Product Id</th>
                        <th>Category Id</th>
                        <th>Name</th>
                        <th>Details</th>
                        <th>Price (Rs)</th>
                        <th>Product Image</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        stmt=con.prepareStatement("Select * from Products");
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
                            out.write("<td>"+s3+"</td>");
                            out.write("<td>"+s4+"</td>");
                            out.write("<td>"+s5+"</td>");
                            out.write("<td><img src='../images/"+s6+"' style='width:30px'></td>");
                            out.write("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>        
    </body>
</html>
