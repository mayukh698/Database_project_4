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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;

import edu.tamu.ctv.servlets.ApproveReject;
import edu.tamu.ctv.servlets.UserReject;
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
		        
		//model.addAttribute("ProjectId", projectId);
		//response.sendRedirect("/Protected/approval");	
		return "/Open/approval";
		
		
	}
	@RequestMapping(value = "/approval/accept/{id}", method = RequestMethod.GET)
	public String userAccept(@PathVariable("id") int id,Model model, HttpServletRequest request) throws Exception
	{
		logger.debug("userAccept()");
			
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		ApproveReject approveReject = new ApproveReject();
		approveReject.updateAccept(id);
		
		return "/Open/approval";
		
		
	}
	@RequestMapping(value = "/approval/reject/{id}", method = RequestMethod.GET)
	public String userReject(@PathVariable("id") int id,Model model, HttpServletRequest request) throws Exception
	{
		logger.debug("userReject()");
			
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		UserReject userReject = new UserReject();
		userReject.updateAccept(id);
		
		return "/Open/approval";
		
		
	}
	
}
