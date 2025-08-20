<%@ page import = "ds.appointment_manager.db.ConnectDB" %>


<%@ page import = "java.sql.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<% 
	try
	{
		String eid=request.getParameter("eid");
		Connection con=ConnectDB.dbCon();
		PreparedStatement ps=con.prepareStatement("delete from employee where eid=?");
		ps.setInt(1,Integer.parseInt(eid));
		int i=ps.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("viewEmp.jsp");
		}
		else
		{
			response.sendRedirect("adminHome.html");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	%>




</body>
</html>