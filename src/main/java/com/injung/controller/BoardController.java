package com.injung.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.injung.annotation.Auth;
import com.injung.annotation.AuthUser;
import com.injung.service.BoardService;
import com.injung.service.FriendService;
import com.injung.service.MongoService;
import com.injung.service.UserService;
import com.injung.util.UploadFileUtils;
import com.injung.vo.BoardCommentVO;
import com.injung.vo.BoardVO;
import com.injung.vo.CategoryVO;
import com.injung.vo.MongoVO;
import com.injung.vo.UserVO;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

@Controller
@RequestMapping(value="/board")
public class BoardController {

    
    @Inject
    private BoardService bservice;
    
    @Inject
    private MongoService mservice;
    
    @Inject
    private UserService uservice;
    
    @Inject
    private FriendService fservice;
    
    @Auth
    @RequestMapping(value="/boardlist", method=RequestMethod.GET)
    public void boardlist(@RequestParam("user") String mem_id, Model model) throws Exception{
        
        UserVO uv = uservice.getUserInfoById(mem_id);
        model.addAttribute("userInfo", uv);     
        
        List<BoardVO> boardList = bservice.getBoardListbyUserId(mem_id);
        model.addAttribute("boardList", boardList);        
        
        List<CategoryVO>listco = bservice.getCategoryListByUserId(mem_id);
        model.addAttribute("categoryList",listco);    
        
        model.addAttribute("boardCount", bservice.getBoardCount(mem_id));
        
        model.addAttribute("followingCount", fservice.followingCount(mem_id));
        
        model.addAttribute("followerCount", fservice.followerCount(mem_id));
    }
    

    @Auth
    @RequestMapping(value="/getBoardByCategory", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getBoardByCategory(@RequestParam("user") String mem_id, @RequestParam("category") String category, Model model) throws Exception {
       BoardVO vo = new BoardVO();
       vo.setCategory(category);
       vo.setMem_id(mem_id);
       List<BoardVO> lv =null;
       if (category.equals("All")){
           lv = bservice.getBoardListbyUserId(mem_id);
       }
       else{
           lv = bservice.getBoardListbyCategoryUserId(vo) ;
       }
       
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("data", lv);

       return map;
    }
    
    @Auth
    @RequestMapping(value="/getCategoryList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCategoryList(Model model) throws Exception {
       List<CategoryVO> lv = bservice.getCategoryList() ;
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("data", lv);
       return map;
    }
    
    
    @Auth
    @RequestMapping(value="/write")
    public String write(@AuthUser UserVO uv, BoardVO bv, HttpSession session) throws Exception{
        System.out.println(bv);
        
        String fileName = ".png";
        
        byte[] data = Base64.decodeBase64(bv.getBoa_imgpng());
        
        String path =  session.getServletContext().getRealPath("/") + "resources/img/boardimg/";
        String newFileName = UploadFileUtils.uploadFile(path, fileName, data);
        
        bv.setBoa_imgpng(newFileName);

        bv.setMem_snum(uv.getMem_snum());
        
        bservice.writeBoard(bv);
            
        MongoVO mv = new MongoVO();
        mv.setBoard_snum(bv.getBoa_snum());
        mv.setImgJson((DBObject) JSON.parse(bv.getBoa_imgjson()));
        
        mservice.insertMongoVO(mv);
        
        return "redirect:/user/main";
    }
    
    @Auth
    @ResponseBody
    @RequestMapping(value="/view", method=RequestMethod.GET)
    public Map<String, Object> view(@AuthUser UserVO authuser, @RequestParam("bno") Long boa_snum) throws Exception{
        bservice.increaseBoardHitCnt(boa_snum);
        bservice.createQueryBoardList(authuser.getMem_snum(), boa_snum);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardVO", bservice.getBoard(boa_snum));
        map.put("boardCommentList", bservice.getBoardCommentList(boa_snum));
        map.put("hasMyInjung", bservice.hasMyInjung(authuser.getMem_snum(), boa_snum));
        return map;
    }
    
    @Auth
    @ResponseBody
    @RequestMapping(value="/writecomment", method = RequestMethod.POST)
    public Map<String, Object> writecomment(@AuthUser UserVO authuser, BoardCommentVO cv) throws Exception {
        cv.setMem_snum(authuser.getMem_snum());
        bservice.createComment(cv);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", bservice.getBoardCommentList(cv.getBoa_snum()));

        return map;
    }
    
    @Auth
    @RequestMapping(value="/viewtest", method=RequestMethod.GET)
    public void viewtest(@RequestParam("bno") Long boa_snum, @AuthUser UserVO authuser, Model model) throws Exception{
        model.addAttribute("boardVO", bservice.getBoard(boa_snum));
        model.addAttribute("boardCommentList", bservice.getBoardCommentList(boa_snum));
        model.addAttribute("hasMyInjung", bservice.hasMyInjung(authuser.getMem_snum(), boa_snum));
    }
    

    @Auth
    @ResponseBody
    @RequestMapping(value="/injungAdd", method = RequestMethod.POST)
    public Map<String, Object> injungAdd(@AuthUser UserVO authuser, BoardVO bv) throws Exception {
        bv.setMem_snum(authuser.getMem_snum());
        bservice.injungAdd(bv);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", bservice.getCountInjung(bv.getBoa_snum()));

        return map;
    }
    @Auth
    @ResponseBody
    @RequestMapping(value="/injungCancel", method = RequestMethod.POST)
    public Map<String, Object> injungCancel(@AuthUser UserVO authuser, BoardVO bv) throws Exception {
        bv.setMem_snum(authuser.getMem_snum());
        bservice.injungCancel(bv);        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", bservice.getCountInjung(bv.getBoa_snum()));

        return map;
    }
    

    @Auth
    @RequestMapping(value="/injungboardlist", method = RequestMethod.GET)
    public void injungboardlist(@AuthUser UserVO authUser, Model model) throws Exception {
        model.addAttribute("injungboardlist", bservice.getInjungBoardList(authUser.getMem_snum()));
        
    }
    
    @Auth
    @RequestMapping(value="/search", method = RequestMethod.POST)
    public void searchBoard(@RequestParam("search") String keyword, Model model) {
        List<BoardVO> searchboardlist = bservice.searchboard(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("searchBoardlist", searchboardlist);
    }
    
}
