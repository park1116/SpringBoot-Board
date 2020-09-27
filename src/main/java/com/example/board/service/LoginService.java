package com.example.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.board.dto.LoginDto;
import com.example.board.mapper.LoginMapper;

@Service("com.example.board.service.LoginService")
public class LoginService {
	@Resource(name="com.example.board.mapper.LoginMapper")
	LoginMapper mapper;
	
	public String loginCheck(LoginDto dto) {
		return mapper.loginCheck(dto);
	}
	
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	public int insertData(LoginDto dto) {
		return mapper.insertData(dto);
	}
}
