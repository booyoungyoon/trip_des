package com.trip.mapper;

import java.util.List;
import java.util.Map;

import com.trip.domain.BoardVO;
import com.trip.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int insert(BoardVO vo);
	public int insertSelectKey(BoardVO vo);
	public int update(BoardVO vo);
	public List<BoardVO> getListWithPagging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	//�˻�����
	public List<BoardVO> searchTest(Map<String, Map<String,String>>map);

}