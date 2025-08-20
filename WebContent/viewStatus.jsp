<%@ page import="ds.appointment_manager.db.*" %>
<%@ page import="java.sql.*" %>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Appointment Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Appointment_Background_Image.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* White background with transparency */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 1000px;
            width: 100%;
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .message {
            margin-top: 20px;
            color: #d9534f;
            font-size: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Appointment Status</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>Purpose</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
            </tr>
            <%
                String uid = "1"; 
                String message = "";
                try 
                {
                    Connection con = ConnectDB.dbCon();
                   
                    String todayDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE uid = ?");
                    ps.setInt(1, Integer.parseInt(uid));
                    ResultSet rs = ps.executeQuery();
                    
                    boolean hasAppointments = false;
                    
                    while (rs.next()) 
                    {
                        hasAppointments = true;
            		%>
            		<tr>
                <td><%= rs.getInt("aid") %></td>
                 <td><%= rs.getInt("eid") %></td>
                <td><%= rs.getString("uname") %></td>
                <td><%= rs.getString("upurpose") %></td>
                <td><%= rs.getString("date") %></td>
                <td><%= rs.getString("time") %></td>
                <td><%= rs.getString("astatus") %></td>
            </tr>
            <%
                    }
                    if (!hasAppointments) 
                    {
                        message = "No appointments found.";
                    }
                } 
                catch (Exception e) 
                {
                    e.printStackTrace();
                    message = "An error occurred while retrieving appointment status.";
                }
            %>
        </table>
        <div class="message"><%= message %></div>
    </div>
</body>
</html>
