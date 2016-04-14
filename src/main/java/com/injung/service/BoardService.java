package com.injung.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.vo.BoardVO;
import com.injung.vo.CategoryVO;
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
	
	
	
	public List<CategoryVO> getCategoryListByUserId(String memid) throws Exception {
		return dao.selectCategoryListById(memid);
	}
	
	public List<CategoryVO> getCategoryList() throws Exception {
        return dao.selectCategoryList();
    }
    
	
	
	public void writeBoard(BoardVO bv) throws Exception {
		
		dao.insertBoard(bv);
		for(String tag: bv.getTags().split(",")){
			bv.setTag(tag);
			dao.insertTag(bv);
		}
		dao.insertCategory(bv);
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
}
