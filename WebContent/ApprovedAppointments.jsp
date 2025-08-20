<%@ page import="ds.appointment_manager.db.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Appointment Approval</title>
    
</head>
<body>
    <h2 style="text-align: center;">Appointment Approved Successfully</h2>
   
        <% 
        try {
        	
        	String aid = request.getParameter("uid");
        	
            Connection con = ConnectDB.dbCon();
            
            PreparedStatement ps = con.prepareStatement("update appointment set astatus=? where aid=?");
            ps.setString(1, "Approved");
            ps.setInt(2, Integer.parseInt(aid));
            
            int i = ps.executeUpdate();
            
            if (i > 0) 
            {
                
                response.sendRedirect("PendingAppointment.jsp");
               
            } else {
                // Handle the case where the update was not successful
                response.sendRedirect("error.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    
</body>
</html>
