package com.injung.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.vo.BoardVO;
import com.injung.vo.NoticeVO;
import com.injung.vo.BoardCommentVO;
import com.injung.vo.UserVO;
import com.injung.dao.BoardDAO;
@Service
public class BoardService  {

	@Inject
	private BoardDAO dao;
	
	
	public List<BoardVO> getBoardListbyUserId(String mem_id) {
        return dao.selectBoardListByUserId(mem_id);
    }
	
	
	
	public List<BoardVO> getCategoryListByUserId(String memid) throws Exception {
		return dao.selectCategoryListById(memid);
	}
	
	public List<BoardVO> getCategoryList() throws Exception {
        return dao.selectCategoryList();
    }
    
	
	public void writeBoard(BoardVO bv) throws Exception {
        
        dao.insertBoard(bv);
        
        if(bv.getTag()==null){
            return;
        }else{
        for(String tag: bv.getTags().split(",")){
            bv.setTag(tag);
            dao.insertTag(bv);
            }
        }
    }
	
	public List<BoardVO> getBoardListbyCategoryUserId(BoardVO vo) {
        return dao.selectBoardListByCategoryUserId(vo);
    }
	
	public BoardVO getBoard(Long bno) throws Exception {
        return dao.selectBoard(bno);
    }

    public List<BoardCommentVO> getBoardCommentList(Long boa_snum) {
        return dao.selectBoardCommentList(boa_snum);
    }



    public void createComment(BoardCommentVO cv) {
        dao.insertComment(cv);
        
    }


    public Boolean hasMyInjung(long mem_snum, long boa_snum) {
        Map<String, Long> map = new HashMap<String, Long>();
        map.put("mem_snum", mem_snum);
        map.put("boa_snum", boa_snum);
        return dao.selectBoardMyInjung(map) != null;
    }



    public void injungAdd(BoardVO bv) {
        dao.insertInjung(bv);
    }


    public BoardVO getCountInjung(long boa_snum) {
        return dao.selectCountInjung(boa_snum);
    }



    public void injungCancel(BoardVO bv) {
        dao.deleteInjung(bv);
    }



    public void createQueryBoardList(long mem_snum, Long boa_snum) {
        Map<String, Long> map = new HashMap<String, Long>();
        map.put("mem_snum", mem_snum);
        map.put("boa_snum", boa_snum);
        dao.insertQueryBoardList(map);
    }



    public void increaseBoardHitCnt(Long boa_snum) {
        dao.updateBoardHitCnt(boa_snum);
        
    }



    public List<BoardVO> getInjungBoardList(String mem_id) {
        return dao.selectInjungBoardList(mem_id);
    }



    public BoardVO getBoardCount(String mem_id){
        return dao.getBoardCount(mem_id);
    }

    public List<BoardVO> getBoardListbyFriend(long mem_snum) {
        return dao.selectBoardListbyFriend(mem_snum);
    }

    public List<BoardVO> getInjunCategoryList(String mem_id) throws Exception {
        return dao.selectInjungCategoryListById(mem_id);
    }
    
    public List<BoardVO> getInjungBoardListbyCategoryUserId(BoardVO vo) {
        return dao.selectInjungBoardListByCategoryUserId(vo);
    }

    public List<BoardVO> searchboard(String keyword) {        
        return dao.selectSearchBoard(keyword);
    }


    public void modifyBoard(BoardVO bv) {
        dao.updateBoard(bv);
        dao.deleteTag(bv);
        for(String tag: bv.getTags().split(",")){
            bv.setTag(tag);
            dao.insertTag(bv);
        }   
    }
    
    public List<BoardVO> getTagList(long boa_snum) {
        return dao.selectTagList(boa_snum);
    }



    public List<NoticeVO> selectNotice() {
        
        return dao.selectNotice();
    }



    public void deleteBoard(BoardVO board) {
        dao.deleteBoard(board);
    }
}
