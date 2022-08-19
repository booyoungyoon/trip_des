package com.trip.service;

import java.util.List;

import com.trip.domain.BoardVO;
import com.trip.domain.Criteria;

public interface BoardService {
	public void register(BoardVO vo);
	public BoardVO get(Long bno);
	public int modify(BoardVO vo);
	public int remove(Long bno);
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
