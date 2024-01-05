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
		
		
		String name,adh,dopos,phn,address,pwd,gender;
		
		
		name=request.getParameter("t1");  //txt_name
		adh=request.getParameter("t2"); //txt_owner
		dopos=request.getParameter("t3");
                phn=request.getParameter("t4");
                address=request.getParameter("t5");
                pwd=request.getParameter("t6");
                gender=request.getParameter("t7");
                
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update signup set  name=?, adh=?, dopos=?, address=?, pwd=?, gender=? where phn=?"); //sql update query 
		pstmt.setString(1,name);
		pstmt.setString(2,adh);
                pstmt.setString(3,dopos);
                pstmt.setString(4,address);
                pstmt.setString(5,pwd);
                pstmt.setString(6,gender);
                pstmt.setString(7,phn);
		
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("<script type=\"text/javascript\">");  
                out.println("alert('Update Sucessfull');");  
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
  border-radius: 10px;
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
				var adh= document.myform.t2;
                                var dopos= document.myform.t3;
                                var address= document.myform.t4;
                                var pwd= document.myform.t5;
                                var gender= document.myform.t6;
                                var phn= document.myform.t7;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (adh.value == "")
				{
					window.alert("please enter aadhar number ?");
					adh.focus();
					return false;
				}
                                if (dopos.value == "")
				{
					window.alert("please enter date of positivity ?");
					dopos.focus();
					return false;
				}
                                if (address.value == "")
				{
					window.alert("please enter address ?");
					address.focus();
					return false;
				}
                                if (pwd.value == "")
				{
					window.alert("please enter password ?");
					pwd.focus();
					return false;
				}
                                if (gender.value == "")
				{
					window.alert("please enter gender ?");
					gender.focus();
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

	<div class="body">

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
		
				String name,adh,dopos,address,pwd,gender;
		
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from signup where phn=?"); // sql select query
				pstmt.setString(1,phn);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					
					name=rs.getString("name");
					adh=rs.getString("adh");
                                        dopos=rs.getString("dopos");
                                        phn=rs.getString("phn");
                                        address=rs.getString("address");
                                        pwd=rs.getString("pwd");
                                        gender=rs.getString("gender");
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="t1" value="<%=name%>"></td>
			</tr>
			
			<tr>
				<td>adh</td>
				<td><input type="text" name="t2" value="<%=adh%>"></td>
			</tr>	
                        <tr>
				<td>dopos</td>
				<td><input type="text" name="t3" value="<%=dopos%>"></td>
			</tr>	
                        <tr>
				<td>phn</td>
				<td><input type="text" name="t4" value="<%=phn%>"></td>
			</tr>	
                        <tr>
				<td>address</td>
				<td><input type="text" name="t5" value="<%=address%>"></td>
			</tr>	
                        <tr>
				<td>pwd</td>
				<td><input type="text" name="t6" value="<%=pwd%>"></td>
			</tr>	
                        <tr>
				<td>gender</td>
				<td><input type="text" name="t7" value="<%=gender%>"></td>
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