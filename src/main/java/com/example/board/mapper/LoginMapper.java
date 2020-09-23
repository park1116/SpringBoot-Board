package com.example.board.mapper;

import org.springframework.stereotype.Repository;

import com.example.board.dto.LoginDto;

@Repository("com.example.board.mapper.LoginMapper")
public interface LoginMapper {
	public String loginCheck(LoginDto dto);
	
	public int idCheck(String id);
}
