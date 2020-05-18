package entity;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "LiteratureInfor")
public class EssayInfor {
    private String title;
    private String author;
    private String Abstract;
    private String keywords;
    private String essayp;
    private String date;
    private String juan;
    private String qi;
    private String DOI;
    private String link;
    private String materialMethod;
    private String mlMethod;
    private String startPage;
    private String endPage;

    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAbstract() {
        return Abstract;
    }

    public void setAbstract(String anAbstract) {
        Abstract = anAbstract;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getEssayp() {
        return essayp;
    }

    public void setEssayp(String essayp) {
        this.essayp = essayp;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getJuan() {
        return juan;
    }

    public void setJuan(String juan) {
        this.juan = juan;
    }

    public String getQi() {
        return qi;
    }

    public void setQi(String qi) {
        this.qi = qi;
    }

    public String getDOI() {
        return DOI;
    }

    public void setDOI(String DOI) {
        this.DOI = DOI;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getMaterialMethod() {
        return materialMethod;
    }

    public void setMaterialMethod(String materialMethod) {
        this.materialMethod = materialMethod;
    }

    public String getMlMethod() {
        return mlMethod;
    }

    public void setMlMethod(String mlMethod) {
        this.mlMethod = mlMethod;
    }

    public String getStartPage() {
        return startPage;
    }

    public void setStartPage(String startPage) {
        this.startPage = startPage;
    }

    public String getEndPage() {
        return endPage;
    }

    public void setEndPage(String endPage) {
        this.endPage = endPage;
    }
}
