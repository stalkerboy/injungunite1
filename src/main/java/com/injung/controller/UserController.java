package com.injung.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.injung.annotation.Auth;
import com.injung.annotation.AuthUser;
import com.injung.service.FriendService;
import com.injung.service.UserService;
import com.injung.util.UploadFileUtils;
import com.injung.vo.CategoryVO;
import com.injung.vo.FriendVO;
import com.injung.vo.UserVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@Inject
    private FriendService fservice;
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO vo ,HttpSession session) throws Exception {
	    String path = session.getServletContext().getRealPath("/")+"resources/img/profile";
	    String fileName = ".png";
	    
	    byte[] data = Base64.decodeBase64(vo.getMem_profile());
	    String newFileName =  UploadFileUtils.uploadProfileFile(path, fileName, data);
	    
	    vo.setMem_profile(newFileName);	    
	    vo.getMem_birth();
	    
	    SimpleDateFormat olddateformat = new SimpleDateFormat("mm/dd/yyyy");
	    SimpleDateFormat newdateformat = new SimpleDateFormat("yyyy/mm/dd");
	    
	    Date oldformatDate = olddateformat.parse(vo.getMem_birth());
	    vo.setMem_birth(newdateformat.format(oldformatDate));
		service.userJoin(vo);
		return "redirect:/";
	}
	
	
	@Auth
	@RequestMapping(value="/main")
	public String writeform(@AuthUser UserVO uv, Model model) {
//		model.addAttribute("categoryList", service.getCategoryListById(uv.getMem_id()));
//		return "user/usermain";
		return "user/usermain";
	}
	
	@Auth
    @RequestMapping(value="/modifyform", method = RequestMethod.POST)
    public void modifyform() throws Exception {
	    System.out.println("modifyform come");
    }
	
	
	@Auth
	@ResponseBody
	@RequestMapping(value="/checkPwForModify", method=RequestMethod.POST)
	public  Map<String, Object> checkPwForModify(@AuthUser UserVO authVo, UserVO vo) throws Exception{
	    vo.setMem_snum(authVo.getMem_snum());
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("data", service.validatePw(vo));
	    return map;
	}
	
	
	@Auth
    @RequestMapping(value="/friendsearch", method = RequestMethod.GET)
    public void friendsearch() throws Exception {
    }
	
	@Auth
	@RequestMapping("/hasid")
    @ResponseBody
    public Map<String, Object> checkid(@RequestParam("id") String id) throws Exception{
        Map<String, Object>map = new HashMap<String, Object>();
        map.put("result", "success");
        map.put("data", service.hasId(id));
        return map;
    }

	@Auth
	@RequestMapping(value="/friendlist", method = RequestMethod.GET)
	public void friendlist(@AuthUser UserVO authVo, Model model) throws Exception {
	    
	    model.addAttribute("friendlist", fservice.getFriendList(authVo.getMem_snum()));
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value="/frienddel", method = RequestMethod.POST)
    public Map<String, Object>  deletefriend(@AuthUser UserVO authVo,FriendVO fv) throws Exception {
        fservice.deleteFriend(fv);
	    Map<String, Object>map = new HashMap<String, Object>();
	    map.put("data", fservice.getFriendList(authVo.getMem_snum()));
	    return map;
    }
	
	@Auth
    @ResponseBody
    @RequestMapping(value="/friendadd", method = RequestMethod.POST)
    public Map<String, Object>  friendadd(@AuthUser UserVO authVo, FriendVO fv) throws Exception {       
	    Map<String, Object>map = new HashMap<String, Object>();
	    fv.setMem_snum(authVo.getMem_snum());
        map.put("type", fservice.friendAdd(fv));
        map.put("data", fservice.getFriendList(authVo.getMem_snum()));
       
       return map;
    }
	
}
