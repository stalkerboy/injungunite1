package com.injung.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.vo.MongoVO;
import com.injung.dao.MongoDAO;

@Service
public class MongoService {
	
	@Inject
	private MongoDAO dao;
	
	public void insertMongoVO(MongoVO mv){       
        dao.insertMongoVO(mv);
    }

    public String getImgJson(Long boa_snum) {
        return dao.findImgJsonBySnum(boa_snum);
    }   
    
}
