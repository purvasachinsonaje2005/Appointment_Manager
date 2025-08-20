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
 * Servlet implementation class bookAppintment
 */
public class bookAppointmentemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookAppointmentemp() {
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
			int aid = 0;
			String eid = request.getParameter("eid");
			
			int uid=User.getUid();
			
			String uname=User.getUname();
			String udesg=User.getUdesg();
			String udep=User.getUdep();
			String cname=User.getCname();
			String ucontact=User.getUcontact();
			String uadd=User.getUadd();
			String uemail=User.getUemail();
			
			String upurpose=request.getParameter("upurpose");
			String udesc=request.getParameter("udesc");
			String time=request.getParameter("time");
			String date=request.getParameter("date");
			String astatus="Pending";

			Connection con= ConnectDB.dbCon();
			
			PreparedStatement ps = con.prepareStatement("insert into appointment values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,aid);
			ps.setString(2, eid);
			ps.setInt(3,uid);
			ps.setString(4, uname);
			ps.setString(5, udesg);
			ps.setString(6, udep);
			ps.setString(7, cname);
			ps.setString(8, ucontact);
			ps.setString(9, uadd);
			ps.setString(10, upurpose);
			ps.setString(11, udesc);
			ps.setString(12, date);
			ps.setString(13, time);
			ps.setString(14, uemail);
			ps.setString(15, astatus);
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("userHome.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
