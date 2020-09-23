package com.example.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.board.mapper.BoardMapper;

@Controller
public class LoginController {
	@Resource(name="com.example.board.mapper.BoardMapper")
    BoardMapper boardMapper;
	
	@RequestMapping("/")
	public String login() {
		System.out.println(boardMapper.selectAll().toString());
		return "login";
	}
}
