<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce</title>
    </head>
    <body>
        <%
        String pid=request.getParameter("pid");
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
        Cookie c=new Cookie("BASKET",vl+"#"+pid);
        c.setMaxAge(3*24*60*60);
        response.addCookie(c);
        response.sendRedirect("products.jsp");
        %>
        
    </body>
</html>
