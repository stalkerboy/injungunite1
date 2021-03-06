package com.injung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.injung.annotation.Auth;
import com.injung.annotation.AuthUser;
import com.injung.service.MessageService;
import com.injung.vo.Criteria;
import com.injung.vo.MessageVO;
import com.injung.vo.PageMaker;
import com.injung.vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/message")
public class MessageController {
    
    private static final Logger Logger = LoggerFactory.getLogger(MessageController.class);
    
    @Inject
    private MessageService service;
    
    
    @RequestMapping(value="/messagewrite", method=RequestMethod.POST)
    public String write(MessageVO vo, @AuthUser UserVO auth) throws Exception{
        vo.setNot_postMem_snum(auth.getMem_snum());
        service.writeMessage(vo);
        return "redirect:/user/main";
    }
    
 
    @Auth
    @RequestMapping(value="/NotReadReceiveList", method=RequestMethod.POST)
    @ResponseBody
    public Object NotReadReceiveList(@AuthUser UserVO auth) throws Exception{
        MessageVO messagesVo = new MessageVO();        
        messagesVo.setNot_getMem_snum(auth.getMem_snum());
        
        List<MessageVO> list = service.notReadReceiveList(messagesVo);
        for(MessageVO aa: list)
            System.out.println(aa);
        
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data",list);
        return map;
    }
    
    @Auth
    @RequestMapping(value="/recivemessageform", method=RequestMethod.GET)
    public void recivemessageform(Criteria cri, Model model, @AuthUser UserVO auth) throws Exception{
        cri.setSnum(auth.getMem_snum());
        cri.setId(auth.getMem_id());
        model.addAttribute("list", service.ReceiveList(cri));
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.ReceivecountPaging(cri));
        model.addAttribute("pageMaker",pageMaker);
    }
    
    @Auth
    @RequestMapping(value="/readmessageform", method=RequestMethod.GET)
    public String readmessageform(@AuthUser UserVO auth, @RequestParam("snum") long not_snum, Model model) throws Exception{
        MessageVO mv = new MessageVO();
        mv.setNot_snum(not_snum);
        MessageVO readMessage = service.readMessage(not_snum);
        if(readMessage.getNot_getMem_snum() == auth.getMem_snum()) {
            model.addAttribute("messageVO", readMessage);
            return "/message/readmessageform";
        }
        else{
            return "/message/recivemessageform";
        }
    }
    
    @Auth
    @RequestMapping(value="/sendmessageform", method=RequestMethod.GET)
    public void sendmessageform(Criteria cri, Model model, @AuthUser UserVO auth) throws Exception{
        cri.setSnum(auth.getMem_snum());
        cri.setId(auth.getMem_id());
        model.addAttribute("list",service.SentList(cri));
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.SentcountPaging(cri));
        model.addAttribute("pageMaker",pageMaker);
    }
    
    @Auth
    @RequestMapping(value="/writemessageform", method=RequestMethod.GET)
    public void writemessageform(@AuthUser UserVO auth, UserVO targetUser, Model model) throws Exception{        
        model.addAttribute("targetUser", targetUser);
    }
    
    @Auth
    @RequestMapping(value="/NotReadMessageCount", method=RequestMethod.GET)
    @ResponseBody
    public Map<String, Object>  NotReadMessageCount(@AuthUser UserVO auth) throws Exception{
        MessageVO vo = new MessageVO();
        int messagecount;
        vo.setNot_getmem_id(auth.getMem_id());
        Map<String, Object> map = new HashMap<String, Object>();
        messagecount = service.NotReadMessageCount(auth.getMem_id());
        map.put("data", messagecount);
        return map;
    }
    
    
}
