package com.example.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.board.dto.BoardDto;
import com.example.board.dto.PagingDto;

@Repository("com.example.board.mapper.BoardMapper")
public interface BoardMapper {
	public List<BoardDto> selectAll(PagingDto dto);
	
	public int insertData(BoardDto dto);
	
	public BoardDto selectOne(int num);
	
	public int updateData(BoardDto dto);
	
	public int deleteData(int num);
	
	public List<BoardDto> searchData(PagingDto dto);
	
	public int countBoard();

	public int countSearchBoard(String str);
}
