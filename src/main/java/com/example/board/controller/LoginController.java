package com.example.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.dto.LoginDto;
import com.example.board.service.LoginService;

@Controller
public class LoginController {
	@Resource(name="com.example.board.service.LoginService")
    LoginService loginService;
	
	@RequestMapping("/")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Boolean loginCheck(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("userId");
		String password = request.getParameter("password");
		LoginDto dto = new LoginDto();
		dto.setId(id);
		dto.setPassword(password);
		String loginId = loginService.loginCheck(dto);
		if(loginId==null || "".equals(loginId))
			return false;
		else {
			session.setAttribute("loginId", loginId);
			return true;
		}
	}
	
	@RequestMapping("/signUp")
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signUp");
		return mav;
	}
}
