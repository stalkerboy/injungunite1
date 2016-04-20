package com.injung.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.vo.FriendVO;
import com.injung.vo.UserVO;


@Repository
public class UserDAO{
	private static String namespace="user";

	@Inject
	private SqlSession session;
	
	public UserVO selectUserByIdPw(UserVO vo)throws Exception{
		return session.selectOne(namespace+".selectUserByIdPw",vo);
	}
	
	public void createUser(UserVO vo)throws Exception{
	    System.out.println(vo);
		session.insert(namespace+".createUser", vo);
	}

	public UserVO selectUser(Long no)throws Exception{
		return session.selectOne(namespace+".selectUser", no);
	}

	public UserVO selectUserInfoById(String mem_id)throws Exception{
		return session.selectOne(namespace+".selectUserInfoById",mem_id);
	}	

	
	public void delete(String id)throws Exception{
		session.delete(namespace+".delete",id);
		
	}

	public void update(UserVO vo)throws Exception{
		session.update(namespace+".update",vo);
		
	}

	public UserVO findId(UserVO vo) throws Exception {
		return session.selectOne(namespace+".findId",vo);
	}

	public UserVO findPw(UserVO vo) throws Exception {
		return session.selectOne(namespace+".findPw",vo);
	}

	

    public String selectPw(long mem_snum) {
        return  session.selectOne(namespace+".selectPw", mem_snum);        
    }

    public void userdelete(UserVO vo) {
        session.delete(namespace+".userdelete", vo);
    }

}
