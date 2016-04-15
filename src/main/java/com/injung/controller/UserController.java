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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.injung.annotation.Auth;
import com.injung.annotation.AuthUser;
import com.injung.service.BoardService;
import com.injung.service.FriendService;
import com.injung.service.UserService;
import com.injung.util.UploadFileUtils;
import com.injung.vo.BoardVO;
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
    private BoardService bservice;
	
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
	    model.addAttribute("followingCount", fservice.followingCount(authVo.getMem_id()));
        
        model.addAttribute("followerCount", fservice.followerCount(authVo.getMem_id()));
	}
	
	
	@Auth
    @RequestMapping(value = "/userfind", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> userfind(@RequestBody String mem_id, @AuthUser UserVO authUser) throws Exception {
        
        long userNo = authUser.getMem_snum();
     
        List<UserVO> users = fservice.userfind(mem_id, userNo);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userfind", users);
        return map;
    }
	
		
	@Auth
    @RequestMapping(value="/deletefriend",  method = RequestMethod.POST)
    @ResponseBody
    public  Map<String, Object> deletefriend(@RequestBody long fri_snum, @AuthUser UserVO authUser, Model model) throws Exception {
       
       fservice.deletefriend(fri_snum);
       
       long memNo = authUser.getMem_snum();

       List<FriendVO> friendvo = fservice.friendlist(memNo);
       

       Map<String, Object> map = new HashMap<String, Object>();
       map.put("friendlist", friendvo);
       return map;

  
   }
    
    @Auth
    @RequestMapping(value="/addfriend", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addfriend(@RequestBody long mem_snum, @AuthUser UserVO authUser, Model model) throws Exception {
        
       long memNo = authUser.getMem_snum();
       fservice.addfriend(memNo ,mem_snum);                            
       
       List<FriendVO> friendvo = fservice.friendlist(memNo);
       

       Map<String, Object> map = new HashMap<String, Object>();
       map.put("friendlist", friendvo);
       return map; 
    }

	@Auth
    @ResponseBody
    @RequestMapping(value="/userModify", method = RequestMethod.POST)
    public Map<String, Object>  userModify(@AuthUser UserVO authUser, UserVO userInfo, HttpSession session) throws Exception {       
	    userInfo.setMem_snum(authUser.getMem_snum());
	    if(userInfo.getMem_profile() == "") {
	        userInfo.setMem_profile(authUser.getMem_profile()); 
	    }
	    else{
	        String path = session.getServletContext().getRealPath("/")+"resources/img/profile";
	        String fileName = ".png";
	        byte[] data = Base64.decodeBase64(userInfo.getMem_profile());
	        String newFileName =  UploadFileUtils.uploadProfileFile(path, fileName, data);
	        
	        userInfo.setMem_profile(newFileName);
	    }        
        SimpleDateFormat olddateformat = new SimpleDateFormat("mm/dd/yyyy");
        SimpleDateFormat newdateformat = new SimpleDateFormat("yyyy/mm/dd");
        Date oldformatDate = olddateformat.parse(userInfo.getMem_birth());
        userInfo.setMem_birth(newdateformat.format(oldformatDate));
        service.modify(userInfo);
	    Map<String, Object>map = new HashMap<String, Object>();
	    return map;
    }
	
}
