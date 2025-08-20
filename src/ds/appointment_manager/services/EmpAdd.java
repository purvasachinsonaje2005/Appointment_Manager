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
 * Servlet implementation class EmpAdd
 */
public class EmpAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpAdd() {
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
			int eid=0;
			String ename=request.getParameter("ename");
			String edesg=request.getParameter("edesg");
			String edep=request.getParameter("edep");
			String econtact=request.getParameter("econtact");
			String email=request.getParameter("email");
			String epassword=request.getParameter("epassword");

			Connection con= ConnectDB.dbCon();
			
			PreparedStatement ps = con.prepareStatement("insert into employee values (?,?,?,?,?,?,?)");
			ps.setInt(1,eid);
			ps.setString(2, ename);
			ps.setString(3, edesg);
			ps.setString(4, edep);
			ps.setString(5, econtact);
			ps.setString(6, email);
			ps.setString(7, epassword);
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("adminHome.html");
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
