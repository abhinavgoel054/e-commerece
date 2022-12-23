
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
PreparedStatement stmt;
ResultSet rs;

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <title>E-Commerce Application</title>
        
        <style>
            .mydiv{
                background-color: #dddddd;
                border-color: black;
                border-width: 0px;
                border-radius: 20px;
                border-style:solid;
                box-shadow: 5px 10px #aaaaaa;
                margin: 20px;
                height: 600px;
                
                padding: 10px;
                vertical-align: middle;
                
            }
            .mytext{
                text-align: left;
                font-size: 20px;
                font-weight: 700;
                padding: 10px;
                width: 250px;
            }
            .innertext{
                padding: 70px;
                font-size: 20px;
                color: red;
            }
            
            
        </style>
                    
            
            
        
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 mydiv">
                   <%
                   stmt=con.prepareStatement("select * from members where email=?");
                   stmt.setObject(1,session.getValue("EMAIL"));
                   rs=stmt.executeQuery();
                   while(rs.next())
                   {
                   String s1=rs.getString(1);
                   
                   String s3=rs.getString(3);
                   String s4=rs.getString(4);
                   String s5=rs.getString(5);
                   String s6=rs.getString(6);
                   String s7=rs.getString(7);
                   String s8=rs.getString(8);
                   
                   out.write("<span><label class=mytext>Registered Mail Id :</label></span>");
                   out.write("<span class=innertext>"+s1+"</span><br><br>");
                   
                   out.write("<span><label class=mytext>Name :</label><span>");
                   out.write("<span class=innertext>"+s3+"</span><br><br>");
                   
                   out.write("<label class=mytext>Address :</label>");
                   out.write("<span class=innertext>"+s4+"</span><br><br>");
                   
                   out.write("<label class=mytext>State :</label>");
                   out.write("<span class=innertext>"+s5+"</span><br><br>");
                   
                   out.write("<label class=mytext>City :</label>");
                   out.write("<span class=innertext>"+s6+"</span><br><br>");
                   out.write("<label class=mytext>Pincode :</label>");
                   out.write("<span class=innertext>"+s7+"</span><br><br>");
                   out.write("<label class=mytext>Registered Mobile No :</label>");
                   out.write("<span class=innertext>"+s8+"</span><br><br>");
                   }
                   %>
                    
                </div>
                <div class="col-lg-2"></div>
            </div>
        
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
