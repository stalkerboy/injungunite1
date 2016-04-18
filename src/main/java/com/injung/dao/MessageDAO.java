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

    public int NotReadMessageCount(String auth_id) throws Exception {
        return session.selectOne(namespace +".NotReadMessageCount", auth_id);
    }

    public List<MessageVO> SentList(Criteria cri)throws Exception {
        return session.selectList(namespace+".SentList", cri);
    } 
    
    public long SentcountPaging(Criteria cri)throws Exception{
        return session.selectOne(namespace+".SentcountPaging", cri);
    }

    public MessageVO deletesentmessage(long not_snum) throws Exception{
        return session.selectOne(namespace+".deletesentmessage", not_snum);
    }
    
    public MessageVO deletereceivemessage(long not_snum) throws Exception{
        return session.selectOne(namespace+".deletereceivemessage", not_snum);
    }

    public void updateReceiveMessage(long not_snum) {
        session.update(namespace+".updateReceiveMessage", not_snum);
    }
}
