package edu.tamu.ctv.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.tamu.ctv.entity.customdefined.ContactForm;
import edu.tamu.ctv.utils.session.ProjectAuthentication;

@Controller
public class HomeController
{
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired		// This a few lines were added by LD.
	private ProjectAuthentication projectAuthentication;
	
	
	@RequestMapping(value = {"/", "/Open/**"}, method = RequestMethod.GET)
	public String index(Model model)
	
	{
		System.out.println("\n\nLogin @ home: " + projectAuthentication.getCurrentUser().getLogin() + "\n\n");
		//String id = projectAuthentication.getCurrentUser().getLogin();
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		
		
		logger.debug("index()");
		return "/Open/home";
		// return "home";
	}
	
	@RequestMapping(value ="/aboutPage", method = RequestMethod.GET)
	public String showAbout(Model model)
	
	{
		logger.debug("index()");
		return "/Open/about";
		// return "home";
	}
	
	@RequestMapping(value ="/loginPage", method = RequestMethod.GET)
	public String showLogin(Model model)
	
	{
		logger.debug("index()");
		return "/Open/login";
		// return "home";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String showContact(Model model)
	{
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		logger.debug("index()");
		return "/contact";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String sendMessage(@ModelAttribute("contactForm") @Validated ContactForm contactForm, BindingResult result, Model model, final RedirectAttributes redirectAttributes)
	{
		model.addAttribute("user_id", projectAuthentication.getCurrentUser().getLogin());
		logger.debug("sendMessage() : {}", contactForm);

		if (result.hasErrors())
		{
			return "contact";
		}
		else
		{
			redirectAttributes.addFlashAttribute("css", "success");
		}
		
		return "redirect:/Open/home";
	}
}