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
		
		
		String name,phn,had,locality,date,meddetails;
		
		
		name=request.getParameter("t1");  //txt_name
                phn=request.getParameter("t2");
                had=request.getParameter("t3");
                locality=request.getParameter("t4");
                date=request.getParameter("t5");
                meddetails=request.getParameter("t6");
                
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update medicine set  name=?, had=?, locality=?, date=?, meddetails=? where phn=?"); //sql update query 
		pstmt.setString(1,name);
		pstmt.setString(2,had);
                pstmt.setString(3,locality);
                pstmt.setString(4,date);
                pstmt.setString(5,meddetails);
                pstmt.setString(6,phn);
		
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("<script type=\"text/javascript\">");  
                out.println("alert('Update Sucessfull');");  
                out.println("window.location.href = 'adminpage.html';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>"); //after update record successfully message
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
				var had= document.myform.t2;
                                var locality= document.myform.t3;
                                var date= document.myform.t4;
                                var meddetails= document.myform.t5;
                                var phn= document.myform.t6;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (had.value == "")
				{
					window.alert("please enter your home address ?");
					had.focus();
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
                                if (meddetails.value == "")
				{
					window.alert("please enter your medicine details ?");
					meddetails.focus();
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
		
				String name,had,locality,date,meddetails;
		
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from medicine where phn=?"); // sql select query
				pstmt.setString(1,phn);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					
					name=rs.getString("name");
					phn=rs.getString("phn");
                                        had=rs.getString("had");
                                        locality=rs.getString("locality");
                                        date=rs.getString("date");
                                        meddetails=rs.getString("meddetails");
                                        
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
				<td>had</td>
				<td><input type="text" name="t3" value="<%=had%>"></td>
			</tr>	
                        <tr>
				<td>locality</td>
				<td><input type="text" name="t4" value="<%=locality%>"></td>
			</tr>	
                        <tr>
				<td>date</td>
				<td><input type="text" name="t5" value="<%=date%>"></td>
			</tr>	
                        <tr>
				<td>medicine details</td>
				<td><input type="text" name="t6" value="<%=meddetails%>"></td>
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