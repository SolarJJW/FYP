package service;

import dao.Essaydao;
import entity.Essaylist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EssaylistService {
    
    @Autowired
    Essaydao dao;

    public void create(Essaylist dc){
        dao.create(dc);
    }

    public List<Essaylist> read(){
        return dao.read();
    }

    public Essaylist read(String name){
        return dao.read(name);
    }



    public void delete(String name){
        dao.delete(name);
    }
}
