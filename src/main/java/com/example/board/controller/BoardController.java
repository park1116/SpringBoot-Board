package com.example.board.controller;

import java.util.List;

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
	
	@RequestMapping("/search")
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String str = request.getParameter("searchData");
		mav.setViewName("boardMain");
		mav.addObject("list", service.searchData(str));
		return mav;
	}
	
	@RequestMapping("/read")
	public ModelAndView read(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		mav.setViewName("read");
		mav.addObject("dto", service.selectOne(num));
		return mav;
	}

	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		mav.setViewName("update");
		mav.addObject("dto", service.selectOne(num));
		return mav;
	}
	
	@RequestMapping("/board/update")
	@ResponseBody
	public void updateData(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDto dto = new BoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setNum(num);
		service.updateData(dto);		
	}
	
	@RequestMapping("/board/delete")
	@ResponseBody
	public void delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		service.deleteData(num);		
	}
}
