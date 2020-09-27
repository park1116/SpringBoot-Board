package com.example.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.board.dto.BoardDto;
import com.example.board.mapper.BoardMapper;

@Service("com.example.board.service.BoardService")
public class BoardService {
	@Resource(name="com.example.board.mapper.BoardMapper")
	BoardMapper mapper;
	
	public List<BoardDto> selectAll() {
		return mapper.selectAll();
	}
	
	public int insertData(BoardDto dto) {
		return mapper.insertData(dto);
	}
	
	public BoardDto selectOne(int num){
		return mapper.selectOne(num);
	}
	
	public int updateData(BoardDto dto){
		return mapper.updateData(dto);
	}
	
	public int deleteData(int num){
		return mapper.deleteData(num);
	}
	
	public List<BoardDto> searchData(String str){
		return mapper.searchData(str);
	}
}
