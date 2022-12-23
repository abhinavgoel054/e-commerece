<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
PreparedStatement stmt;
ResultSet rs;

if(request.getParameter("t1")!=null)
{
    String s1=request.getParameter("t1");
    String s2=request.getParameter("t3");
    String s3=request.getParameter("t2");
    String s4=request.getParameter("t5");
    String s5=request.getParameter("t6");
    String s6=request.getParameter("t7");
    String s7=request.getParameter("t9");
    String s8=request.getParameter("t8");
    stmt=con.prepareStatement("Insert into members values(?,?,?,?,?,?,?,?)");
    stmt.setString(1,s1);
    stmt.setString(2,s2);
    stmt.setString(3,s3);
    stmt.setString(4,s4);
    stmt.setString(5,s5);
    stmt.setString(6,s6);
    stmt.setString(7,s7);
    stmt.setString(8,s8);
    stmt.executeUpdate();
    response.sendRedirect("thanks.jsp");
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
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8" style="background-color: #dddddd; border-radius: 10px;box-shadow: 5px 5px #aaaaaa">
                    <form method="post">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label>Email</label>
                                <input type="email" name="t1" class="form-control" required>
                            </div>                        
                            <div class="form-group col-lg-6">
                                <label>Name</label>
                                <input type="text" name="t2" class="form-control" required>
                            </div>

                                <div class="form-group col-lg-6">
                                <label>Password</label>
                                <input type="password" name="t3" class="form-control" required>
                            </div>                        
                            <div class="form-group col-lg-6">
                                <label>Re Type Password</label>
                                <input type="password" name="t4" class="form-control" required>
                            </div>
                              <div class="form-group col-lg-12">
                                <label>Address</label>
                                <textarea class="form-control" name="t5"></textarea>
                            </div>
                            <div class="form-group col-lg-6">
                                <label>State</label>
                                <select class="form-control" name="t6" required>
                                <%
                                    stmt=con.prepareStatement("select distinct states from cities order by states");
                                    rs=stmt.executeQuery();
                                    while(rs.next())
                                    {
                                        out.write("<option>"+rs.getString(1)+"</option>");
                                    }
                                %>
                                </select>
                            </div>                        
                            <div class="form-group col-lg-6">
                                <label>City</label>
                                <select class="form-control" name="t7" required>
                                    <%
                                        String s1=request.getParameter("t6");
                                    stmt=con.prepareStatement("select distinct city from cities where city is not null order by city");
                                    rs=stmt.executeQuery();
                                    while(rs.next())
                                    {
                                        out.write("<option>"+rs.getString(1)+"</option>");
                                    }
                                    
                                    %>
                                    
                                </select>
                                
                            </div>
                          <div class="form-group col-lg-6">
                                <label>Mobile</label>
                                <input type="number" name="t8" class="form-control" required>
                            </div>                        
                            <div class="form-group col-lg-6">
                                <label>Pin Code</label>
                                <input type="number" name="t9" class="form-control" required>
                            </div>
                            <div class="form-group col-lg-6">
                               <input type="image" src="images/register2.png" style="width:150px">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
