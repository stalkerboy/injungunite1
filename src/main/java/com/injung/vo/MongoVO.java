package com.injung.vo;

import com.mongodb.DBObject;

public class MongoVO {
	private long board_snum;   
    private DBObject  imgJson;
    
    
	public long getBoard_snum() {
		return board_snum;
	}
	public void setBoard_snum(long board_snum) {
		this.board_snum = board_snum;
	}
	public DBObject  getImgJson() {
		return imgJson;
	}
	public void setImgJson(DBObject imgJson) {
		this.imgJson = imgJson;
	}    
}
