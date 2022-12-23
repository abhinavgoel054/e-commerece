<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getValue("UTYPE")==null || !session.getValue("UTYPE").toString().equals("ADMIN"))
    {
    response.sendRedirect("index.jsp")
    }
    int size=request.getContentLength();
    byte[] data=new byte[size];
    java.io.InputStream in=request.getInputStream();
    int remaining=size;
    int n=0;
    while(remaining>0)
    {
        int m=in.read(data,n,remaining);
        n=n+m;
        remaining=remaining-m;
    }
    String str=new String(data);
    int p1=str.indexOf("\r\n");
    String boundary=str.substring(0,p1);
    
    p1=str.indexOf("name=\"t1\"")+13;
    int p2=str.indexOf(boundary,p1)-2;
    String s1=str.substring(p1,p2);
    
    p1=str.indexOf("name=\"t2\"",p1)+13;
    p2=str.indexOf(boundary,p1)-2;
    String s2=str.substring(p1,p2);
    
     p1=str.indexOf("name=\"t3\"",p1)+13;
    p2=str.indexOf(boundary,p1)-2;
    String s3=str.substring(p1,p2);
    
     p1=str.indexOf("name=\"t4\"",p1)+13;
    p2=str.indexOf(boundary,p1)-2;
    String s4=str.substring(p1,p2);
    
    p1=str.indexOf("name=\"t5\"",p1);
    p1=str.indexOf("filename=",p1)+10;
    p2=str.indexOf("\r\n",p1)-1;
    String filename=str.substring(p1,p2);
    
    p1=str.indexOf("Content-Type",p1)+13;
    p2=str.indexOf("\r\n\r\n",p1);
    String filetype=str.substring(p1,p2);
    
    int filestart=p2+4;
    int fileend=str.indexOf(boundary,filestart)-3;
    int filesize=fileend-filestart+1;
    byte[] filedata=new byte[filesize];
    System.arraycopy(data,filestart,filedata,0,filesize);
    Class.forName("org.gjt.mm.mysql.Driver");    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
    PreparedStatement stmt=con.prepareStatement("Select count(*)+1001 from Products");
    ResultSet rs=stmt.executeQuery();
    String pid="0";
    if(rs.next())
    {
        pid=rs.getString(1);
    }
    stmt=con.prepareStatement("Insert into products values(?,?,?,?,?,?)");
    stmt.setString(1,pid);
    stmt.setString(2,s1);
    stmt.setString(3,s2);
    stmt.setString(4,s3);
    stmt.setString(5,s4);
    stmt.setString(6,"P"+pid+".jpg");
    stmt.executeUpdate();
    String path=this.getServletContext().getRealPath("images")+"\\";
    java.io.FileOutputStream fout=new java.io.FileOutputStream(path+"P"+pid+".jpg");
    fout.write(filedata);
    fout.close();    
    response.sendRedirect("products.jsp");
%>
