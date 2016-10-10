package edu.tamu.ctv.controller;

//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;

//import edu.tamu.ctv.entity.UserDetail;
import edu.tamu.ctv.utils.session.ProjectAuthentication;
//Class added by Mayukh for user requests contrl by admin
@Controller
public class UserRequestController
{
	private final Logger logger = LoggerFactory.getLogger(UserRequestController.class);
	@Autowired		// This a few lines were added by LD.
	//public Connection conn = null;
    //private String db;

	private ProjectAuthentication projectAuthentication;
	@RequestMapping(value = "/approval", method = RequestMethod.GET)
	public String userRequest(Model model, HttpServletRequest request) throws Exception
	{
		logger.debug("userRequest()");
		//ArrayList userReq = new ArrayList();
		Object projectIdObj = request.getSession().getAttribute("projectId");
		String id = projectAuthentication.getCurrentUser().getLogin();

		//model.addAttribute("users", userRepository.findAll());		// This line is very important.
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		/*
        try {
            Class.forName("org.postgresql.Driver");



        }
        catch (java.lang.ClassNotFoundException e) {
            java.lang.System.err.print("ClassNotFoundException: Postgres Server JDBC");
            java.lang.System.err.println(e.getMessage());
            throw new Exception("No JDBC Driver found in Server");
        }

        //Trying to connectpostgresql:/
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/webtoxpi","postgres","postgres");
            System.out.println("Connection with: "+"postgres"+"!!");
            String sql = "SELECT lastname, firstname, phone FROM users";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            UserDetail userdetail = null;
            while(rs.next()){
            	userdetail = new UserDetail();
            	userdetail.setLastname(rs.getString("lastname")); //set your firstName
            	userdetail.setFirstname(rs.getString("firstname")); //set your MiddleName
            	userdetail.setPhone(rs.getString("phone")); //set your LastName
            	System.out.println("Phone: "+rs.getString("phone"));
            	userReq.add(userdetail); 
            	request.setAttribute("userReq", userReq);
                //RequestDispatcher view = request.getRequestDispatcher("DemoJSP.jsp");
                //view.forward(request, response);
            }
        }
        catch (SQLException E) {

            java.lang.System.out.println("SQLException: " + E.getMessage());
            java.lang.System.out.println("SQLState: " + E.getSQLState());
            java.lang.System.out.println("VendorError: " + E.getErrorCode());

        }
        try {
            conn.close();
            System.out.println("Connection close ");
        } catch (SQLException E) {


            java.lang.System.out.println("SQLException: " + E.getMessage());
            java.lang.System.out.println("SQLState: " + E.getSQLState());
            java.lang.System.out.println("VendorError: " + E.getErrorCode());
            throw E;
        }*/
        
		//model.addAttribute("ProjectId", projectId);
		//response.sendRedirect("/Protected/approval");	
		return "/Protected/approval";
		
		
	}
}
