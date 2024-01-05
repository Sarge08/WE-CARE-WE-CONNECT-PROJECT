<%@page import="java.sql.*" %>

<%
try
{	
	 Class.forName("org.apache.derby.jdbc.ClientDriver");
             Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/wc2helpcenter;create=true","root","root");

	if(request.getParameter("delete")!=null)
	{
		String phn=request.getParameter("delete");
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("delete from medicine where phn=? "); //sql delete query
		pstmt.setString(1,phn);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>

	<head>
	
		<title>medicine report</title>
		
		<!--css for div main class and table -->
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
		
		
	</head>	
	
<body>
		<div class="main">
		
			<center>
                            <h1><button><a href="Book_medicine.html"><font color="blue" size="16"><marquee behaviour="scroll">Add Record</marquee></font></a></button></h1>
                            <form action="" method="get">
                                    <input type="text" name="q" placeholder="Search Here">  
                                </form>
                            
			</center>
		
		<table>
		
			<tr>
				
				<th>Name</th>
				<th>Phone no</th>
                                <th>Home address</th>
                                <th>Locality</th>
                                <th>Date</th>
                                
                                <th>Medicine details</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		<%
		
		try
		{	
			Class.forName("org.apache.derby.jdbc.ClientDriver");
             Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/wc2helpcenter;create=true","root","root");
             
			 Statement stmt=null;
           ResultSet rs=null;
           stmt=con.createStatement();
           String query=request.getParameter("q");
         String data;
if(query!=null)
{
  data="select * from medicine where name like'%"+query+"%' or phn like '%"+query+"%' or had like '%"+query+"%' or locality like '%"+query+"%' or date like '%"+query+"%' or meddetails like '%";
  
}
else
{
data="select * from medicine order by name desc";
}
rs=stmt.executeQuery(data);
			while(rs.next())
			{	
		%>
				<tr>
					
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                              		<td><%=rs.getString(5)%></td>
                                       	<td><%=rs.getString(6)%></td>
                                       	



					
                                        <td><button><a href="med_update.jsp?edit=<%=rs.getString(2)%> ">Edit</a></button></td>
                                        <td><button><a href="?delete=<%=rs.getString(2)%> ">Delete</a></button></td>
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
		
		</div>
		
		
</body>

</html>