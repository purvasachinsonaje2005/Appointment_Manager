<%@page import="java.sql.*" %>
<%@ page import = "ds.appointment_manager.db.ConnectDB" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employee</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('Appointment_Background_Image.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 50px auto; /* Centered and added margin from top */
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: rgba(255, 255, 255, 0.9); /* White background with slight transparency */
    }
    h1 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f4f4f4;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    a {
        text-decoration: none;
        color: #007bff;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

    <div class="container">
        <h1>View All Employees</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Employee Name</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
            <%
                try 
                {
                    Connection con = ConnectDB.dbCon();
                    PreparedStatement ps = con.prepareStatement("select * from employee ");
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()) 
                    {
                        %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><a href="bookAppointment.jsp?eid=<%=rs.getInt(1)%>">Book</a></td>
                        </tr>
                        <%
                    }
                } 
                catch(Exception e)
                {
                     e.printStackTrace();
                }
            %>
        </table>
    </div>

</body>
</html>
