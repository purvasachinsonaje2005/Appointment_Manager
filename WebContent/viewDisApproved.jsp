<%@ page import="ds.appointment_manager.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Disapproved Appointments</title>
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
        .unique-box {
            width: 80%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            border-radius: 10px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #ffffff; /* Solid white background for table */
            border-radius: 8px;
            overflow: hidden;
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
    </style>
</head>
<body>
    <h2>View Disapproved Appointments</h2>
    <div class="unique-box">
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>User Contact</th>
                <th>User Email</th>
                <th>Status</th>
            </tr>
            <% 
            try {
                // Establish database connection
                
                Connection con = ConnectDB.dbCon();
                
                // Prepare SQL statement to select disapproved appointments
                PreparedStatement ps = con.prepareStatement("select * from appointment where astatus=? ");
                ps.setString(1, "Disapproved");
                
                ResultSet rs1 = ps.executeQuery();
                
                // Iterate through result set and display each disapproved appointment
                while(rs1.next()) {
            %>
            <tr>
                 <td><%= rs1.getInt(1) %></td>
                <td><%= rs1.getString(2) %></td>
                <td><%= rs1.getString(4) %></td>
                <td><%= rs1.getString(8) %></td>
                <td><%= rs1.getString(14) %></td>
                <td><%= rs1.getString(15) %></td>
            </tr>
            <% 
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
    </div>
</body>
</html>
