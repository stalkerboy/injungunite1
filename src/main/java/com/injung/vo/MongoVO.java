package com.injung.vo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.mongodb.DBObject;

@Document(collection = "snsimg")
public class MongoVO {
	private long board_snum;   
    private DBObject  imgJson;
    private String imgJsonStr;
    
	public long getBoard_snum() {
		return board_snum;
	}
	public void setBoard_snum(long board_snum) {
		this.board_snum = board_snum;
	}
	public DBObject getImgJson() {
		return imgJson;
	}
	public void setImgJson(DBObject imgJson) {
		this.imgJson = imgJson;
	}
    public String getImgJsonStr() {
        return imgJsonStr;
    }
    public void setImgJsonStr(String imgJsonStr) {
        this.imgJsonStr = imgJsonStr;
    }    
}
