package com.injung.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.vo.BoardVO;
import com.injung.vo.CategoryVO;
import com.injung.vo.BoardCommentVO;


@Repository
public class BoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="board";
	
	public void insertBoard(BoardVO bv) {
		session.insert(namespace+".insertBoard", bv);
		
	}
	public void insertTag(BoardVO bv) {
		session.insert(namespace+".insertTag", bv);
		
	}
	public void insertCategory(BoardVO bv) {
		session.insert(namespace+".insertCategory", bv);		
	}
	
	public List<BoardVO> selectBoardListByUserId(String mem_id) {
        return session.selectList(namespace+".selectBoardListByUserId", mem_id);        
    }
	
	public List<CategoryVO> selectCategoryListById(String mem_id) {        
        return session.selectList(namespace+".selectCategoryListById", mem_id);
    }
	
	public List<BoardVO> selectBoardListByCategoryUserId(BoardVO vo) {
        return session.selectList(namespace+".selectBoardListByCategoryUserId", vo);        
    }
	
	public List<CategoryVO> selectCategoryList() {        
        return session.selectList(namespace+".selectCategoryList");
    }
	
    public BoardVO selectBoard(Long boa_snum) {
        return session.selectOne(namespace+".selectBoard", boa_snum);
    }
        
    public List<BoardCommentVO> selectBoardCommentList(Long boa_snum) {
        return session.selectList(namespace+".selectBoardCommentList", boa_snum);
    }
    public void insertComment(BoardCommentVO cv) {
        session.insert(namespace+".insertComment", cv);     
        
    }
    public BoardVO selectBoardMyInjung(Map<String, Long> map) {
        return session.selectOne(namespace+".selectBoardMyInjung", map);
    }
    public void insertInjung(BoardVO bv) {
        session.insert(namespace+".insertInjung", bv);
        
    }
    public BoardVO selectCountInjung(long boa_snum) {
        return session.selectOne(namespace+".selectCountInjung", boa_snum);
    }
    public void deleteInjung(BoardVO bv) {
        session.delete(namespace+".deleteInjung", bv);
        
    }
	
}
