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

    public int NotReadMessageCount(String vo) throws Exception {
        return dao.NotReadMessageCount(vo);
    }

    public List<MessageVO> SentList(Criteria cri) throws Exception {
        List<MessageVO> list = new ArrayList<MessageVO>();
        list = (List<MessageVO>) dao.SentList(cri);
        return list;
    } //보낸편지함 지은 추가부분 끝.
    
    //보낸편지함 페이징처리 지은 추가 부분
    public long SentcountPaging(Criteria cri) throws Exception{
        return dao.SentcountPaging(cri); //Receive로 다시 구현하기.
    } //보낸편지함 페이징처리 지은 추가부분 끝.
    
}
