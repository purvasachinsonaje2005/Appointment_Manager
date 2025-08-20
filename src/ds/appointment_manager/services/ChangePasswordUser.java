package ds.appointment_manager.services;

import java.io.IOException;


import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ds.appointment_manager.db.ConnectDB;
import ds.appointment_manager.db.User;

/**
 * Servlet implementation class ChangePassword
 */
public class ChangePasswordUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		try
		{
			String epassword = request.getParameter("epassword");
	        String newPassword = request.getParameter("newPassword");
	        String confirmPassword = request.getParameter("confirmPassword");
	        String uemail=User.getUemail();
	        if(!newPassword.equals(epassword))
	        {
	        	if(newPassword.equals(confirmPassword))
		        {
	        		Connection con= ConnectDB.dbCon();
	        		java.sql.PreparedStatement ps = con.prepareStatement("update users set upassword=? where uemail=?");
		        	 ps.setString(1, newPassword);
		        	 ps.setString(2, uemail);
		        	 int i= ps.executeUpdate();
		        	 if(i>0)
		        	 {
		        		 response.sendRedirect("userHome.html");
		        	 }
		        	 else
		        	 {
		        		 response.sendRedirect("error.html");
		        	 }
		        }
		        else
		        {
		        	System.out.println("The Password does not matched");
		        }
	        }
	        else
	        {
	        	System.out.println("The Password you have entered is Same as previous");
	        }
		}
		catch (Exception e) 
		{
				
			e.printStackTrace();
		}
	}

}
