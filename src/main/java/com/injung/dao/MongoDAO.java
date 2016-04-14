package com.injung.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
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
}
