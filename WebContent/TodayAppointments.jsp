<%@ page import="java.sql.*" %>
<%@ page import="ds.appointment_manager.db.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Today's Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Appointment_Background_Image.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: rgba(173, 216, 230, 0.5); /* Fallback color if image is unavailable */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
        }
        .unique-box {
            width: 90%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            border-radius: 10px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff; /* Solid white background for table */
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f0f0f0;
            color: #333333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h1 {
            color: #ffffff; /* White color for the heading */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6); /* Black shadow for the heading */
        }
    </style>
</head>
<body>
    <h1>Today's Appointments</h1>
    <div class="unique-box">
        <table>
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Company Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Purpose</th>
                <th>Description</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
            </tr>
            <%
                try 
            {
                    
                	int uid = User.getUid();
                	Connection con = ConnectDB.dbCon();
                    String todayDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE date = ? AND uid = ? AND astatus = ?");
                    ps.setString(1, todayDate);
                    ps.setInt(2, uid);
                    ps.setString(3, "Approved");
                    ResultSet rs = ps.executeQuery();
                    
                    while (rs.next()) 
                    {
            %>
            <tr>
                <td><%= rs.getInt("uid") %></td>
                <td><%= rs.getString("uname") %></td>
                <td><%= rs.getString("udesg") %></td>
                <td><%= rs.getString("udep") %></td>
                <td><%= rs.getString("cname") %></td>
                <td><%= rs.getString("ucontact") %></td>
                <td><%= rs.getString("uadd") %></td>
                <td><%= rs.getString("upurpose") %></td>
                <td><%= rs.getString("udesc") %></td>
                <td><%= rs.getString("date") %></td>
                <td><%= rs.getString("time") %></td>
                <td><%= rs.getString("astatus") %></td>
            </tr>
            <%
                    }
                } 
            catch (Exception e) 
            {
                  e.printStackTrace();
            }
            %>
        </table>
    </div>
</body>
</html>
