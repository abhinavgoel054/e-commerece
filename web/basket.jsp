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
            if(vl.equals(""))
                {
                    out.write("Basket is Empty!!!!");
                }
                else
                {
                String[] arr=vl.split("#");
                out.write("<table class='table table-bordered'>");
                out.write("<thead><tr><th>S.No</th><th>Product</th><th>Detail</th><th>Price</th><th>Photo</th></tr></thead>");
                out.write("<tbody>");
                int total=0;
                for(int i=1;i<arr.length;i++)
                    {
                    out.write("<tr>");
                    out.write("<td>"+i+"</td>");
                    stmt=con.prepareStatement("select * from products where pid=?");
                    stmt.setString(1,arr[i]);
                    rs=stmt.executeQuery();
                    rs.next();
                    String ss1=rs.getString("pname");
                    String ss2=rs.getString("details");
                    int ss3=rs.getInt("price");
                    total=total+ss3;
                    String ss4=rs.getString("photo");
                    out.write("<td>"+ss1+"</td>");
                    out.write("<td>"+ss2+"</td>");
                    out.write("<td>&#8377; "+ss3+"/-</td>");
                    total=total+ss3;
                    out.write("<td><img src='images/"+ss4+"' style='width:50px'></td>");
                    out.write("</tr>");
                    }
            
                    out.write("</tbody>");
                    out.write("<tfoot><tr><th colspan='5'>Total Amount is&#8377; "+total+"</tr></tfoot>");
                    out.write("</table><hr>");

                    if(session.getValue("EMAIL")==null)
                        {
                            out.write("<a href='login.jsp'>LOGIN</a> to Confirm order.");
                        }
                    else
                        {

                            out.write("Please <a href='confirm.jsp'>Click Here</a> to Confirm");
                        }
            }
            %>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
