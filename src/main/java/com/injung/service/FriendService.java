package com.injung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.dao.FriendDAO;
import com.injung.dao.UserDAO;
import com.injung.vo.FriendVO;

@Service
public class FriendService {

    @Inject
    private FriendDAO fdao;
    @Inject
    private UserDAO udao;
    
    public List<FriendVO> getFriendList(long memNo) throws Exception {
        return fdao.selectFriendList(memNo);
    }

    public String friendAdd(FriendVO fv) throws Exception {
        if(fv.getFri_mem_snum() == fv.getFri_snum()) {
            return "me";
        }
        else if ( fdao.selectFriend(fv) != null ){
            return "old_fri"; 
        }
        else if(udao.selectUser(fv.getFri_mem_snum()) == null){
            return "no_id";
        }
        else{ 
            fdao.insertFriend(fv);
            return "new_fri";
        }
    }
    
    public void deleteFriend(FriendVO fv) throws Exception {
       fdao.deleteFriend(fv);      
    }

    public FriendVO followingCount(String mem_id)throws Exception{
        return fdao.followingCount(mem_id);
    }
    public FriendVO followerCount(String mem_id)throws Exception{
        return fdao.followerCount(mem_id);
    }
    
    
}
