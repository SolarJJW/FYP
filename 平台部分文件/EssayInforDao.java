package dao;

import entity.EssayInfor;
import entity.Essaylist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EssayInforDao {
    
    @Autowired
    private MongoTemplate mongo;

    public void create(EssayInfor dc) {
        mongo.save(dc);
    }
    
}
