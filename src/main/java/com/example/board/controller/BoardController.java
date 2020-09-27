package com.example.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.dto.BoardDto;
import com.example.board.service.BoardService;

@Controller
public class BoardController {
	@Resource(name="com.example.board.service.BoardService")
    BoardService service;
	
	@RequestMapping("/boardMain")
	public ModelAndView selectAll() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardMain");
		mav.addObject("list", service.selectAll());
		return mav;
	}
	
	@RequestMapping("/create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("create");
		return mav;
	}
	
	@RequestMapping("/board/insert")
	@ResponseBody
	public void insert(HttpServletRequest request, HttpSession session) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String name = (String) session.getAttribute("loginId");
		BoardDto dto = new BoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setName(name);
		service.insertData(dto);		
	}
}
