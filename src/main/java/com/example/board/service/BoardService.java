package com.example.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.board.dto.BoardDto;
import com.example.board.dto.PagingDto;
import com.example.board.mapper.BoardMapper;

@Service("com.example.board.service.BoardService")
public class BoardService {
	@Resource(name="com.example.board.mapper.BoardMapper")
	BoardMapper mapper;
	
	public List<BoardDto> selectAll(PagingDto dto) {
		return mapper.selectAll(dto);
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
	
	public List<BoardDto> searchData(PagingDto dto){
		return mapper.searchData(dto);
	}

	public int countBoard() {
		return mapper.countBoard();
	}
	
	public int countSearchBoard(String str) {
		return mapper.countSearchBoard(str);
	}
}
