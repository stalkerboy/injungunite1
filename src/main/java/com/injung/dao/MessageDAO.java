package com.injung.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.vo.Criteria;
import com.injung.vo.MessageVO;

@Repository
public class MessageDAO {

    @Inject
    private SqlSession session;
    
    private static String namespace = "message"; 
    
    public MessageVO createMessage(MessageVO vo) throws Exception {
        return session.selectOne(namespace +".createMessage", vo);
    }

    public List<MessageVO> notReadReceiveList(MessageVO vo) {
        return session.selectList(namespace + ".notReadReceiveList", vo);
    }
    
    public List<MessageVO> ReceiveList(Criteria cri)throws Exception {
        return session.selectList(namespace+".ReceiveList", cri);
    }
    
    public long ReceivecountPaging(Criteria cri)throws Exception{
        return session.selectOne(namespace+".ReceivecountPaging", cri);
    }
    
    public MessageVO selectMessage(long not_snum) throws Exception{
        return session.selectOne(namespace+".selectMessage", not_snum);
    }
}
