package com.example.board.mapper;

import java.util.List;

<<<<<<< HEAD
import org.springframework.stereotype.Repository;

import com.example.board.dto.BoardDto;

@Repository("com.example.board.mapper.BoardMapper")
=======
import org.apache.ibatis.annotations.Mapper;

import com.example.board.dto.BoardDto;

@Mapper
>>>>>>> refs/remotes/origin/master
public interface BoardMapper {
	public List<BoardDto> selectAll();
	
	public int insertData(BoardDto dto);
	
	public BoardDto selectOne(int num);
	
	public int updateData(BoardDto dto);
	
	public int deleteData(int num);
	
	public List<BoardDto> searchData(String str);
}
