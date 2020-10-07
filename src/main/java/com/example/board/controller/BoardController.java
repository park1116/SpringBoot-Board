package com.example.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.dto.BoardDto;
import com.example.board.dto.PagingDto;
import com.example.board.service.BoardService;

@Controller
public class BoardController {
	@Resource(name="com.example.board.service.BoardService")
    BoardService service;
	private static String S_nowPage = "1";
	private static String S_cntPerPage = "5";
	
	@RequestMapping("/boardMain")
	public ModelAndView selectAll(@RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		ModelAndView mav = new ModelAndView();
		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = S_nowPage;
			cntPerPage = S_cntPerPage;
		} else if (nowPage == null) {
			nowPage = S_nowPage;
		} else if (cntPerPage == null) { 
			cntPerPage = S_cntPerPage;
		}
		PagingDto dto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mav.setViewName("boardMain");
		mav.addObject("paging",dto);
		mav.addObject("list", service.selectAll(dto));
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
	public ModelAndView search(HttpServletRequest request, @RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		ModelAndView mav = new ModelAndView();
		String str = request.getParameter("searchData");
		int total = service.countSearchBoard(str);
		if (nowPage == null && cntPerPage == null) {
			nowPage = S_nowPage;
			cntPerPage = S_cntPerPage;
		} else if (nowPage == null) {
			nowPage = S_nowPage;
		} else if (cntPerPage == null) { 
			cntPerPage = S_cntPerPage;
		}
		PagingDto dto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		dto.setSearchData(str);
		mav.setViewName("boardMain");
		mav.addObject("paging",dto);
		mav.addObject("list", service.searchData(dto));
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
