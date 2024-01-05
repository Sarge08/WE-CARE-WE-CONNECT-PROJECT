<%-- 
    Document   : user_update
    Created on : 3 Jul, 2021, 10:08:34 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>


      

<%
try
{
	 Class.forName("org.apache.derby.jdbc.ClientDriver");
             Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/wc2helpcenter;create=true","root","root");
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		
		
		String name,phn,relphn,hhad,locality,date,prescribe;
		
		
		name=request.getParameter("t1");  //txt_name
                phn=request.getParameter("t2");
                relphn=request.getParameter("t3");
                hhad=request.getParameter("t4");
                locality=request.getParameter("t5");
                date=request.getParameter("t6");
                prescribe=request.getParameter("t7");
                
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update cylinder set  name=?, relphn=?, hhad=?, locality=?, date=?, prescribe=? where phn=?"); //sql update query 
		pstmt.setString(1,name);
                pstmt.setString(2,relphn);
		pstmt.setString(3,hhad);
                pstmt.setString(4,locality);
                pstmt.setString(5,date);
                pstmt.setString(6,prescribe);
                pstmt.setString(7,phn);
		
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("<script type=\"text/javascript\">");  
                out.println("alert('Update Sucessfully');");  
                out.println("window.location.href = 'adminpage.html';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");//after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Update</title>
		
	<!--css for div main class and table-->
	<style type="text/css">
		
		body{
  
  display: flex;
  justify-content: center;
  align-items: top;
  width: 100%;
  height: 100vh;
  background-image: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url(assets/images/jsp-1.jpg);
  background-size: contain;
  background-position: center;
  margin: 0 0;
}
                table{
  border-collapse: collapse;
  border-radius: 10px;
  background-color: darkturquoise;
}
table th{
  text-align: left;
  background-color: #04048C;
  color: #ebecf1;
  padding: 4px 30px 4px 8px;
}
table td{
  
  padding: 4px 8px;
  color:white;
}
table tr:nth-child(odd) td{
  background-color: #ACE4FC;
  color:black;
}
th:first-of-type {
  border-top-left-radius: 10px;
}
th:last-of-type {
  border-top-right-radius: 10px;
}
tr:last-of-type td:first-of-type {
  border-bottom-left-radius: 10px;
}
tr:last-of-type td:last-of-type {
  border-bottom-right-radius: 10px;
}
		</style>	
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var name = document.myform.t1;
                                var relphn= document.myform.t2;
				var hhad= document.myform.t3;
                                var locality= document.myform.t4;
                                var date= document.myform.t5;
                                var prescribe= document.myform.t6;
                                var phn= document.myform.t7;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
                                  if (relphn.value == "")
				{
					window.alert("please enter relative phone no ?");
					relphn.focus();
					return false;
				}
				if (hhad.value == "")
				{
					window.alert("please enter your home address ?");
					hhad.focus();
					return false;
				}
                                if (locality.value == "")
				{
					window.alert("please enter your locality ?");
					locality.focus();
					return false;
				}
                                if (date.value == "")
				{
					window.alert("please enter date ?");
					date.focus();
					return false;
				}
                                if (prescribe.value == "")
				{
					window.alert("please enter your oxygen cylinder details ?");
					prescribe.focus();
					return false;
				}
                                if (phn.value == "")
				{
					window.alert("please enter phone no ?");
					phn.focus();
					return false;
				}
                                
                                
			}
			
		</script>
		
	</head>
	
<body>

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
                    <h1><font color="white">Update Record</font></h1>
		</center>
		
		<table>	
		   <%
		try
		{
			 Class.forName("org.apache.derby.jdbc.ClientDriver");
              Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/wc2helpcenter;create=true","root","root");
	
			if(request.getParameter("edit")!=null) 
			{
				String phn=request.getParameter("edit");
		
				String name,relphn,hhad,locality,date,prescribe;
		
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from cylinder where phn=?"); // sql select query
				pstmt.setString(1,phn);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					
					name=rs.getString("name");
					phn=rs.getString("phn");
                                        relphn=rs.getString("relphn");
                                        hhad=rs.getString("hhad");
                                        locality=rs.getString("locality");
                                        date=rs.getString("date");
                                        prescribe=rs.getString("prescribe");
                                        
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="t1" value="<%=name%>"></td>
			</tr>
			
			<tr>
				<td>phn</td>
				<td><input type="text" name="t2" value="<%=phn%>"></td>
			</tr>	
                        <tr>
				<td>relphn</td>
				<td><input type="text" name="t3" value="<%=relphn%>"></td>
			</tr>	
                        <tr>
				<td>hhad</td>
				<td><input type="text" name="t4" value="<%=hhad%>"></td>
			</tr>	
                        <tr>
				<td>locality</td>
				<td><input type="text" name="t5" value="<%=locality%>"></td>
			</tr>	
                        <tr>
				<td>date</td>
				<td><input type="text" name="t6" value="<%=date%>"></td>
			</tr>	
                        <tr>
				<td>prescribe</td>
				<td><input type="text" name="t7" value="<%=prescribe%>"></td>
			</tr>	
                    
                        <tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		
		
	</form>

	</div>
	
		

</body>

</html>