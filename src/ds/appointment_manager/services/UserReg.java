package ds.appointment_manager.services;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ds.appointment_manager.db.ConnectDB;
import ds.appointment_manager.db.User;

/**
 * Servlet implementation class UserReg
 */
public class UserReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReg() {
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
			int uid=0;
			String uname=request.getParameter("uname");
			String udesg=request.getParameter("udesg");
			String udep=request.getParameter("udep");
			String cname=request.getParameter("cname");
			String ucontact=request.getParameter("ucontact");
			String uadd=request.getParameter("uadd");
			String uemail=request.getParameter("uemail");
			String upassword=request.getParameter("upassword");

			Connection con= ConnectDB.dbCon();
			
			PreparedStatement ps = con.prepareStatement("insert into users values (?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,uid);
			ps.setString(2, uname);
			ps.setString(3, udesg);
			ps.setString(4, udep);
			ps.setString(5, cname);
			ps.setString(6, ucontact);
			ps.setString(7, uadd);
			ps.setString(8, uemail);
			ps.setString(9, upassword);
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("userHome.html");
			}
			else
			{
				response.sendRedirect("AddUser.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
