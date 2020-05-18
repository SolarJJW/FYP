package entity;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "essay_pattern")
public class Essaylist {
    private String essayp;
    
    public String getEssayp() {
        return essayp;
    }

    public void setEssayp(String essayp) {
        this.essayp = essayp;
    }

    public Essaylist(String essayp) {
        this.essayp = essayp;
    }
}
