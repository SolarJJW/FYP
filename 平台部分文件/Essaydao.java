package dao;

import entity.Essaylist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class Essaydao {
    
    @Autowired 
    private MongoTemplate mongo;
    
    //CRUD加入
    public void create(Essaylist dc) {
        mongo.save(dc);
    }
    
    public void delete(String id) {
        Query qu = new Query(Criteria.where("id").is(id));
        mongo.remove(qu,Essaylist.class);

    }

//    public void update(Essaylist dc) {
//        Query qu = new Query(Criteria.where("id").is(dc.getId()));
//        Update up = new Update().set("name", dc.getName()).set("address", dc.getAddress()).set("qq", dc.getQq());
//
//        mongo.updateFirst(qu, up, Essaylist.class);
//
//    }

    public Essaylist read(String name) {
        Query qu = new Query(Criteria.where("name").is(name));
        return mongo.findOne(qu,Essaylist.class);
    }

    public List<Essaylist> read(){
        Query qu = new Query();
        return mongo.find(qu,Essaylist.class);
    }
}
