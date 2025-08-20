<%@ page import="ds.appointment_manager.db.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View All Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Appointment_Background_Image.jpg');
            background-size: cover; /* Adjusts the background image size */
            background-position: center; /* Centers the background image */
            background-repeat: no-repeat; /* Ensures the background image does not repeat */
            background-color: rgba(173, 216, 230, 0.5); /* Fallback color if image is unavailable */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
        }
        h2 {
            text-align: center;
            color: #fff; /* White color for the heading */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6); /* Black shadow for the heading */
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #ffffffdd;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
        }
        .action-buttons form {
            margin: 0;
        }
        .action-buttons button {
            margin: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
        }
        .action-buttons button[value="Approved"] {
            background-color: #28a745; /* Green for approve */
        }
        .action-buttons button[value="Approved"]:hover {
            background-color: #218838; /* Darker green on hover */
        }
        .action-buttons button[value="Disapproved"] {
            background-color: #dc3545; /* Red for disapprove */
        }
        .action-buttons button[value="Disapproved"]:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <h2>View All Appointments</h2>
    <table>
        <tr>
            <th>Id</th>
            <th>Employee Name</th>
            <th>Designation</th>
            <th>Department</th>
            <th>Contact Number</th>
            <th>Email</th>
            <th>Company Name</th>
            <th>Address</th>
            <th>Purpose</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <% 
        try {
            Connection con = ConnectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE eid=?");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) { 
        %>
        <tr>
            <td><%= rs.getInt(2) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(8) %></td>
            <td><%= rs.getString(14) %></td>
            <td><%= rs.getString(7) %></td>
            <td><%= rs.getString(9) %></td>
            <td><%= rs.getString(10) %></td>
            <td><%= rs.getString(11) %></td>
            <td class="action-buttons">
                <form action="ApprovedAppointments.jsp" method="post">
                    <input type="hidden" name="uid" value="<%= rs.getInt(1) %>">
                    <button type="submit" name="astatus" value="Approved">Approve</button>
                </form>
                <form action="DisApprovedAppointments.jsp" method="post">
                    <input type="hidden" name="uid" value="<%= rs.getInt(1) %>">
                    <button type="submit" name="astatus" value="Disapproved">Disapprove</button>
                </form>
            </td>
        </tr>
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
