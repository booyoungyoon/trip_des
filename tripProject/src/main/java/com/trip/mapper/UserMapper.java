package com.trip.mapper;

import java.util.List;

import com.trip.domain.BoardVO;
import com.trip.domain.UserVO;

public interface UserMapper {
	public List<UserVO> getList();
	public void insert(UserVO vo);
	public void kakaoInsert(UserVO vo);
	public UserVO read(UserVO vo);
	public UserVO get(int userNum);
	public UserVO getId(UserVO vo);
	public UserVO getPw(UserVO vo);
	public UserVO getNickName(UserVO vo);
	public List<UserVO> getFindId(UserVO vo);
	public int delete(int userNum);
	public int update(UserVO vo);
	public void insertSelectKey(BoardVO vo);
}