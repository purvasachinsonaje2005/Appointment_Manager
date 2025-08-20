<%@ page import = "ds.appointment_manager.db.ConnectDB" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Appointment_Background_Image.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.85); /* White background with transparency */
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }
        h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        input[type="text"], input[type="email"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        textarea {
            height: 100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <% String eid = request.getParameter("eid"); %>
        <h3>Book Appointment</h3>
        <form action="bookAppointmentemp" method="post">
            <input type="text" name="eid" value="<%= eid %>">
            <input type="text" name="upurpose" placeholder="Purpose of Appointment" required>
            <textarea name="udesc" placeholder="udesc" required></textarea>
            <input type="date" name="date" required>
            <input type="time" name="time" required>
            <input type="submit" value="Book Appointment">
        </form>
    </div>
</body>
</html>
