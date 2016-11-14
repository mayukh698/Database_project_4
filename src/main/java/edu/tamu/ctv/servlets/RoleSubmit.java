package edu.tamu.ctv.servlets;

import java.io.IOException;
import java.sql.SQLException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

public class RoleSubmit extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void rSubmit(long k, int userId)
	throws IOException, ServletException{
		//String submitVal=request.getParameter("userApprove");
		//int submitValue = Integer.parseInt(submitVal);
		long submitValue=k;
		int uId= userId;
		System.out.print("Value in ApproveReject: "+submitValue);
		
		
		java.sql.Connection con1;
		
		java.sql.PreparedStatement pst1;
		con1=null;
		
		pst1=null;
		
		String url1= 
		"jdbc:postgresql://localhost:5433/webtoxpi";
		String id1= "postgres";
		String pass1 = "postgres";
		try{
			

			Class.forName("org.postgresql.Driver").newInstance();
		con1 = java.sql.DriverManager.getConnection(url1, id1, pass1);

		} catch(ClassNotFoundException cnfex){
		cnfex.printStackTrace();

		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql1 = "Update users set approved='Y' Where user_id=?";
		try{
		pst1 = con1.prepareStatement(sql1);
		pst1.setLong(1,submitValue);
		pst1.executeUpdate();
		}
		catch(Exception e){e.printStackTrace();}
		
        
        
		
	}
}