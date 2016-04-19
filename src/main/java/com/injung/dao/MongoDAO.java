package com.injung.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.injung.vo.MongoVO;

@Repository
public class MongoDAO {
	@Autowired
	private MongoTemplate mongoTemplate;
	 
    public void setMongoTemplate(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    public void insertMongoVO(MongoVO mv){        
        mongoTemplate.insert(mv, "snsimg");                
    }

    public String findImgJsonBySnum(Long boa_snum) {
        String strQuery = "{board_snum:" +String.valueOf(boa_snum)+ "}";
        
        BasicQuery b = new BasicQuery(strQuery);        
        MongoVO m = mongoTemplate.findOne(b, MongoVO.class);
        return m.getImgJsonStr();
    }

    public void updateMongoVO(MongoVO mv) {
        
        Query query = new Query(new Criteria("board_snum").is(mv.getBoard_snum()));
        System.out.println(mv.getImgJson());
        System.out.println(mv.getImgJsonStr());
        Update update = new Update();
        update.set("imgJson", mv.getImgJson());
        update.set("imgJsonStr", mv.getImgJsonStr());
 
        mongoTemplate.updateFirst(query, update, "snsimg");
        
    }
}
