<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getValue("UTYPE")==null || !session.getValue("UTYPE").toString().equals("ADMIN"))
    {
        response.sendRedirect("index.jsp");
    }
    int size=request.getContentLength();
    byte[] data=new byte[size];
    java.io.InputStream in=request.getInputStream();
    int remaining = size;
    int n=0;
    while(remaining>0)
    {
        int m=in.read(data,n,remaining);
        n=n+m;
        remaining=remaining-m;
    }
    String str=new String(data);
    String str1=str.replace("\r\n","#$");
    int p1=str1.indexOf("#$");
    String boundary=str1.substring(0,p1);

    p1=str1.indexOf("name=\"t1\"")+13;
    int p2=str1.indexOf(boundary,p1)-2;
    String s1=str1.substring(p1,p2);
    

    p1=str1.indexOf("name=\"t2\"")+13;
    p2=str1.indexOf(boundary,p1)-2;
    String s2=str1.substring(p1,p2);
    

    p1=str1.indexOf("name=\"t3\"");
    p1=str1.indexOf("filename=",p1)+10;
    p2=str1.indexOf("#$",p1)-1;
    String filename=str1.substring(p1,p2);

    p1=str1.indexOf("Content-Type",p1)+13;
    p2=str1.indexOf("#$#$",p1);
    String filetype=str1.substring(p1,p2);
    
    int filestart=p2+4;
    int fileend=str1.indexOf(boundary,filestart)-2;
    int filesize=fileend-filestart+1;
    byte[] filedata=new byte[filesize];
    System.arraycopy(data,filestart,filedata,0,filesize);
        Class.forName("org.gjt.mm.mysql.Driver");    
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dbecom","root","");
        PreparedStatement stmt=con.prepareStatement("Select count(*)+101 from Categories");
        ResultSet rs=stmt.executeQuery();
        String cid="0";
        if(rs.next())
        {
            cid=rs.getString(1);
        }
        stmt=con.prepareStatement("Insert into categories values(?,?,?,?)");
        stmt.setString(1,cid);
        stmt.setString(2,s1);
        stmt.setString(3,s2);
        stmt.setString(4,"C"+cid+".jpg");
        stmt.executeUpdate();
        String path=this.getServletContext().getRealPath("images")+"//";
        java.io.FileOutputStream fout=new java.io.FileOutputStream(path+"C"+cid+".jpg");
        fout.write(filedata);
        
        fout.close();
        response.sendRedirect("categories.jsp");
        
%>

