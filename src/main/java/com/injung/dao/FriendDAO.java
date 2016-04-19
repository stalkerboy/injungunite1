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
public class FriendDAO{
    private static String namespace="friend";

    @Inject
    private SqlSession session;
    

    public List<FriendVO> userfind(String mem_id, long userNo) throws Exception {
        Map<String, Object> numMap = new HashMap<String, Object>();
        numMap.put("userNo", userNo);
        numMap.put("mem_id",mem_id);
        
        return session.selectList(namespace+".userfind", numMap );
    }
    
    public void deletefriend(long fri_snum) throws Exception {
        session.delete(namespace+".deletefriend", fri_snum);      
     }
    
    public void addfriend(long memNo, long mem_snum) throws Exception {
        Map<String, Long> numMap = new HashMap<String, Long>();
        numMap.put("memNo", memNo);
        numMap.put("friendNo", mem_snum);
        session.insert(namespace+".addfriend", numMap);
        
     }
    
    public List<FriendVO> friendlist(long memNo) throws Exception {
        return session.selectList(namespace+".friendlist", memNo);
    }
    

    public List<FriendVO> selectFriendList(long memNo) throws Exception {
       return session.selectList(namespace+".selectFriendList", memNo);
    }
    
    public FriendVO selectFriend(FriendVO fv) throws Exception {
        return session.selectOne(namespace+".selectFriend", fv);      
     }


    public FriendVO followingCount(String mem_id) throws Exception{
        return session.selectOne(namespace+".followingCount", mem_id);
    }
    public FriendVO followerCount(String mem_id) throws Exception{
        return session.selectOne(namespace+".followerCount", mem_id);
    }

    public List<FriendVO> followerList(long memNo) throws Exception {
        return session.selectList(namespace+".followerList", memNo);
    }
    
}