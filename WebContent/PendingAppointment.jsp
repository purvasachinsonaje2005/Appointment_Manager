<%@ page import="ds.appointment_manager.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pending Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Appointment_Background_Image.jpg');
            background-size: cover; /* Adjusts the background image size */
            background-position: center; /* Centers the background image */
            background-repeat: no-repeat; /* Ensures the background image does not repeat */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
        }
        .table-container {
            background-color: #fff; /* Solid white background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
        table {
            width: 100%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #000; /* Black color for the heading */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6); /* Black shadow for the heading */
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h2>View Pending Appointments</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>User Contact</th>
                <th>User Email</th>
                <th>Status</th>
                <th>Action-1</th>
                <th>Action-2</th>
            </tr>
            <% 
            try {
                 
                int eid = Emp.getEid();
                Connection con = ConnectDB.dbCon();
                
              	
                PreparedStatement ps1 = con.prepareStatement("SELECT * FROM appointment WHERE eid=? and astatus=?");
                
                ps1.setInt(1, eid);
                ps1.setString(2, "Pending");
               
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) 
                {
            %>
            <tr>
                <td><%= rs1.getInt(1) %></td>
                <td><%= rs1.getString(2) %></td>
                <td><%= rs1.getString(4) %></td>
                <td><%= rs1.getString(8) %></td>
                <td><%= rs1.getString(14) %></td>
                <td><%= rs1.getString(15) %></td>
                <td><a href="ApprovedAppointments.jsp?uid=<%= rs1.getInt(1) %>">Approve</a></td>
                <td><a href="DisApprovedAppointments.jsp?uid=<%= rs1.getInt(1) %>">Disapprove</a></td>
            </tr>
            <% 
                }
            } catch (Exception e) 
            {
                e.printStackTrace();
            }
            %>
        </table>
    </div>
</body>
</html>
