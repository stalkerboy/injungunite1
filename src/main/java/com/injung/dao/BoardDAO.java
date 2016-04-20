package com.injung.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.vo.BoardVO;
import com.injung.vo.NoticeVO;
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
	
	public List<BoardVO> selectBoardListByUserId(String mem_id) {
        return session.selectList(namespace+".selectBoardListByUserId", mem_id);        
    }
	
	public List<BoardVO> selectCategoryListById(String mem_id) {        
        return session.selectList(namespace+".selectCategoryListById", mem_id);
    }
	
	public List<BoardVO> selectBoardListByCategoryUserId(BoardVO vo) {
        return session.selectList(namespace+".selectBoardListByCategoryUserId", vo);        
    }
	
	public List<BoardVO> selectCategoryList() {        
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
    public void insertQueryBoardList(Map<String, Long> map) {
        session.insert(namespace+".insertQueryBoardList", map);
    }
    public void updateBoardHitCnt(Long boa_snum) {
        session.update(namespace+".updateBoardHitCnt", boa_snum);
        
    }
    public List<BoardVO> selectInjungBoardList(String mem_id){
        return session.selectList(namespace+".selectInjungBoardList", mem_id);
    }
    public BoardVO getBoardCount(String mem_id){
        return session.selectOne(namespace+".getBoardCount", mem_id);
    }
    public List<BoardVO> selectBoardListbyFriend(long mem_snum) {
        return session.selectList(namespace+".selectBoardListbyFriend", mem_snum);
    }
    
    public List<BoardVO> selectInjungCategoryListById (String mem_id) {
        return session.selectList(namespace+".selectInjungCategoryListById", mem_id);
    }
    
    public List<BoardVO> selectInjungBoardListByCategoryUserId(BoardVO vo) {
        return session.selectList(namespace+".selectInjungBoardListByCategoryUserId", vo);        
    }
    
    public List<BoardVO> selectSearchBoard(String keyword) {
        return session.selectList(namespace+".selectSearchBoard", keyword);
    }
    public void updateBoard(BoardVO bv) {
        session.update(namespace+".updateBoard", bv);
       
   }
   public void deleteTag(BoardVO bv) {
        session.update(namespace+".deleteTag", bv);
       
   }
   public List<BoardVO> selectTagList(long boa_snum) {
       return session.selectList(namespace+".selectTagList", boa_snum);
   }
public List<NoticeVO> selectNotice() {
    
    return session.selectList(namespace+".selectNotice");
}
}
