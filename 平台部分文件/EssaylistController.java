package controller;

import service.EssaylistService;
import entity.Essaylist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("liter")
public class EssaylistController {
    
    @Autowired
    EssaylistService service1;
    
    @RequestMapping("/essl")
    public List<Essaylist> essay(){
        System.out.println("mongodb读数据成功");
        return  service1.read();
    }
    

    
    
}
