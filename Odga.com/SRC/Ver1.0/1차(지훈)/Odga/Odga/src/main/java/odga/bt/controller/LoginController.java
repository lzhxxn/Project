package odga.bt.controller;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import odga.bt.domain.Member;
import odga.bt.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService service;
	@Autowired
	private ServletContext servletContext;
	
	// 로그인 기능 구현
		/*
		@RequestMapping(value = "login.do", method = RequestMethod.POST)
		private String login(@ModelAttribute Member member, HttpSession session, HttpServletResponse response) throws Exception {
			System.out.println("############### 로그인!!!");
			Member m1 = service.login(member, response, servletContext);
			System.out.println("#####"+m1.getM_email());
			return "redirect../";
		}*/
	
		//MEMBER
		@RequestMapping(value = "login.do", method = RequestMethod.POST)
		private ModelAndView login(@ModelAttribute Member member, HttpSession session, HttpServletResponse response) throws Exception {
			
			ModelAndView mav = new ModelAndView();
			
			System.out.println("############### 로그인!!!");
			Member m1 = service.login(member, response, servletContext);
			System.out.println("#####"+m1.getM_fname());
			System.out.println("#####"+m1.getM_verify());
			session.setAttribute("LOGINUSER", m1);
			mav.setViewName("index");
			return mav;
		
		}
		
		//로그아웃 기능 
		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		private String logout(HttpServletResponse response, HttpSession session) throws Exception {
			service.logout(response, session);
			 return "redirect:/index.do";
		}
}
