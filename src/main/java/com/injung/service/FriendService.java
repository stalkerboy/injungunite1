package com.injung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.dao.FriendDAO;
import com.injung.dao.UserDAO;
import com.injung.vo.FriendVO;
import com.injung.vo.UserVO;

@Service
public class FriendService {

    @Inject
    private FriendDAO fdao;
    
    public List<FriendVO> getFriendList(long memNo) throws Exception {
        return fdao.selectFriendList(memNo);
    }

    public List<FriendVO> friendlist(long memNo) throws Exception {
        return fdao.friendlist(memNo); 
    }
    
    public void addfriend(long memNo, long mem_snum) throws Exception {
        fdao.addfriend(memNo, mem_snum);
        
    }
    
    public void deletefriend(long fri_snum) throws Exception {
       fdao.deletefriend(fri_snum);      
    }   
    
    public List<UserVO> userfind(String mem_id, long userNo) throws Exception {
        List<UserVO> users = fdao.userfind(mem_id, userNo);
        return users;
    }  
    public FriendVO followingCount(String mem_id)throws Exception{
        return fdao.followingCount(mem_id);
    }
    public FriendVO followerCount(String mem_id)throws Exception{
        return fdao.followerCount(mem_id);
    }
    
    
}
