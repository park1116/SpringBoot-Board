package com.example.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.dto.LoginDto;

@Mapper
public interface LoginMapper {
	public String loginCheck(LoginDto dto);
	
	public int idCheck(String id);
}
