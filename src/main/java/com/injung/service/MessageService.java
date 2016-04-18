package com.injung.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.dao.MessageDAO;
import com.injung.vo.Criteria;
import com.injung.vo.MessageVO;

@Service
public class MessageService {

    @Inject 
    MessageDAO dao;
    
    public MessageVO writeMessage(MessageVO vo) throws Exception {
        return dao.createMessage(vo);
    }

    public List<MessageVO> notReadReceiveList(MessageVO messagesVo)throws Exception{
        return dao.notReadReceiveList(messagesVo);
    }
    
    public List<MessageVO> ReceiveList(Criteria cri) throws Exception {
        List<MessageVO> list = new ArrayList<MessageVO>();
        list = (List<MessageVO>) dao.ReceiveList(cri);
        return list;
    }
    
    public long ReceivecountPaging(Criteria cri) throws Exception{
        return dao.ReceivecountPaging(cri); //Receive로 다시 구현하기.
    }
    
    public MessageVO readMessage(long not_snum) throws Exception {
        return dao.selectMessage(not_snum);
    }

    public int NotReadMessageCount(String auth_id) throws Exception {
        return dao.NotReadMessageCount(auth_id);
    }

    public List<MessageVO> SentList(Criteria cri) throws Exception {
        List<MessageVO> list = new ArrayList<MessageVO>();
        list = (List<MessageVO>) dao.SentList(cri);
        return list;
    }
    
    public long SentcountPaging(Criteria cri) throws Exception{
        return dao.SentcountPaging(cri); //Receive로 다시 구현하기.
    }
    
    public MessageVO deletesentmessage(long not_snum) throws Exception{
        return dao.deletesentmessage(not_snum);
    }
    
    public MessageVO deletereceivemessage(long not_snum) throws Exception{
        return dao.deletereceivemessage(not_snum);
    }

    public void receiveMessageRead(long not_snum) {
        dao.updateReceiveMessage(not_snum);
    }
    
}
