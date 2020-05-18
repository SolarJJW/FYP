package service;


import dao.EssayInforDao;
import entity.EssayInfor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EssayInforService {
    
    @Autowired
    EssayInforDao dao;
    
    public void create(EssayInfor dc){
        dao.create(dc);
    }
}
