package edu.tamu.ctv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Controller
public class ImportController
{
	private final Logger logger = LoggerFactory.getLogger(ImportController.class);
	@Autowired		// This a few lines were added by LD.
	private ProjectAuthentication projectAuthentication;
	@RequestMapping(value = "/import", method = RequestMethod.GET)
	public String export(Model model, HttpServletRequest request)
	{
		Object projectIdObj = request.getSession().getAttribute("projectId");
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		logger.debug("import()");
		//Object projectIdObj = request.getSession().getAttribute("projectId");
		
		if (projectIdObj != null)
		{
			return "redirect:/upload?projectId="+projectIdObj;
		}
		else
		{
			model.addAttribute("todoaction", "import");
			return "redirect:/projects/select";
		}
		
	}
}
