package com.injung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.vo.UserVO;
import com.injung.dao.UserDAO;


@Service
public class UserService{
	
	@Inject
	private UserDAO dao;
	
	public UserVO login(UserVO vo) throws Exception {
		return dao.selectUserByIdPw(vo);
	}
	
	
	public void userJoin(UserVO vo) throws Exception {
		dao.createUser(vo);		
	}



	public UserVO getUser(Long no) throws Exception {
		return dao.selectUser( no );
	}


	public boolean hasId(String id) throws Exception {
		return dao.selectUserInfoById(id) != null;
		
	}

	public void remove(String id) throws Exception {
		dao.delete(id);
		
	}

	public void modify(UserVO vo) throws Exception {
		dao.update(vo); //db 업데이트
		
		//session 업데이트		
	}

	public UserVO findId(UserVO vo) throws Exception {
		UserVO userVO = dao.findId(vo);
		return userVO;
	}

	public UserVO findPw(UserVO vo) throws Exception {
		UserVO userVO = dao.findPw(vo);
		return userVO;
	}
	
	//friend
	public boolean validatePw(UserVO vo) throws Exception{
	    return vo.getMem_passwd().equals(dao.selectPw(vo.getMem_snum()));
	}
	
	public UserVO getUserInfoById(String mem_id) throws Exception{
	    return dao.selectUserInfoById(mem_id);
	}
}
