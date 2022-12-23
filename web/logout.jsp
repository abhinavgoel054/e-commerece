<%-- 
    Document   : logout
    Created on : Dec 15, 2022, 8:48:55 AM
    Author     : india
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>