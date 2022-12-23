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
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form method="post" action="savecategory.jsp" enctype="multipart/form-data">
                        
                        <div class="form-group">
                            <label>Category Name :</label>
                            <input type="text" name="t1" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Category Detail :</label>
                            <input type="text" name="t2" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Category Photo :</label>
                            <input type="file" name="t3" class="form-control">
                        </div>
                        <div class="form-group">
                           
                            <input type="submit"  value="Save" name="b1" class="btn btn-primary">
                        </div>
                    </form>
                </div>
                <div class="col-lg-3"></div>
                <hr>
                <div class="col-lg-12">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Category_Id</th>
                            <th>Category_Name</th>
                            <th>Category_Detail</th>
                            <th>Category_Photo</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
                            stmt=con.prepareStatement("select * from categories");
                            rs=stmt.executeQuery();
                            while(rs.next())
                            {
                                String s1=rs.getString(1);
                                String s2=rs.getString(2);
                                String s3=rs.getString(3);
                                String s4=rs.getString(4);
                                out.write("<tr>");
                                out.write("<td>"+s1+"</td>");
                                out.write("<td>"+s2+"</td>");
                                out.write("<td>"+s3+"</td>");
                                out.write("<td><img src='../images/"+s4+"' style='width:30px'></td>");
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
