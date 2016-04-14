package com.injung.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.vo.FriendVO;


@Repository
public class FriendDAO{
    private static String namespace="friend";

    @Inject
    private SqlSession session;
    

    public void insertFriend(FriendVO fv) throws Exception {
       session.insert(namespace+".insertFriend", fv);  
    }
    
    
    public void deleteFriend(FriendVO fv) throws Exception {
       session.delete(namespace+".deleteFriend", fv);      
    }


    public List<FriendVO> selectFriendList(long memNo) throws Exception {
       return session.selectList(namespace+".selectFriendList", memNo);
    }
    
    public FriendVO selectFriend(FriendVO fv) throws Exception {
        return session.selectOne(namespace+".selectFriend", fv);      
     }
    
}