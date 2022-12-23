<img src="images/banner6.webp" style="width:100%;height:250px">
<table class="table">
    <tr>
        <td><a href="index.jsp">Home</a></td>
        <td><a href="products.jsp">Products</a></td>
        <%
        if(session.getValue("EMAIL")!=null)
        {
            out.write("<td><a href='profile.jsp'>My Profile</a></td>");
            out.write("<td><a href='history.jsp'>Order History</a></td>");
            out.write("<td><a href='password.jsp'>Change Password</a></td>");
            out.write("<td><a href='logout.jsp'>Logout</a></td>");
        }
        else
        {
            out.write("<td><a href='register.jsp'>Register</a></td>");
            out.write("<td><a href='login.jsp'>Login</a></td>");
        }
        %>
        <td><a href="basket.jsp">Basket</a></td>
        <td><a href="contact.jsp">Contact Us</a></td>
        
    </tr>
</table>
<hr>