package com.example.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.dto.BoardDto;

@Mapper
public interface BoardMapper {
	public List<BoardDto> selectAll();
	
	public int insertData(BoardDto dto);
	
	public BoardDto selectOne(int num);
	
	public int updateData(BoardDto dto);
	
	public int deleteData(int num);
	
	public List<BoardDto> searchData(String str);
}
