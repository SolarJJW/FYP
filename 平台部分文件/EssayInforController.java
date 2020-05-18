package controller;

import entity.EssayInfor;
import org.neo4j.driver.v1.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import service.EssayInforService;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;

@RestController
public class EssayInforController {

    @Autowired
    EssayInforService service;

    @RequestMapping("/upload")
    public String upload(@RequestBody EssayInfor infor){
        service.create(infor);
        return "success";
    }
    
    @RequestMapping("/fileupload")
    public  String fileupload(@RequestBody MultipartFile literfile) {
        String filename = literfile.getOriginalFilename();
        System.out.println(filename);
        if (literfile.isEmpty()) {
            return "false";
        }
        String fileName = literfile.getOriginalFilename();
//        File dest = new File(new File().getAbsolutePath()+ "/" + fileName);
        File dest = new File("C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\PDFs" + "/" + fileName);

        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            literfile.transferTo(dest); // 保存临时文件
            File oldpaths = new File("C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\PDFs" + "/" + filename);
            File newpaths = new File("C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\用户上传文献库" + "/" + filename);
            if (!newpaths.exists()) {
                Files.copy(oldpaths.toPath(), newpaths.toPath());
            } 
            else {
                newpaths.delete();
                Files.copy(oldpaths.toPath(), newpaths.toPath());
            }
            System.out.println("success");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }
    
    @RequestMapping("/analyze")
    public  String fileanalyze() throws IOException, InterruptedException {
        String filename = "";
        try{
            Process proc;
            BufferedReader in;
            String line;
            proc = Runtime.getRuntime().exec("C:\\ProgramData\\Anaconda3\\python.exe C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\dataclean\\1-pdf转txt.py");
            in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
            in.close();
            proc.waitFor();


            proc = Runtime.getRuntime().exec("cmd.exe /c cd C:\\\\Users\\\\jjwjj\\\\Desktop\\\\毕业论文\\\\Superalloy\\\\superalloy_project\\\\2-TXT转UDF-8 && for /r C:\\\\Users\\\\jjwjj\\\\Desktop\\\\毕业论文\\\\Superalloy\\\\superalloy_project\\\\1-PDF转TXT %i in (*.txt) do iconv.exe -f GBK -t UTF-8 %i > %~ni.txt");
            in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
            in.close();
            proc.waitFor();

            System.out.println("词云图片");
            proc = Runtime.getRuntime().exec("C:\\ProgramData\\Anaconda3\\python.exe C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\dataclean\\wordcloudprocess.py");
            in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            line = null;
            line = in.readLine();
            System.out.println(line);
            filename = line;
            in.close();
            proc.waitFor();

            System.out.println("存Neo4J");
            proc = Runtime.getRuntime().exec("C:\\ProgramData\\Anaconda3\\python.exe C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\dataclean\\Neo4J.py");
            in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
            in.close();
            proc.waitFor();

            System.out.println("保存Mongodb");
            proc = Runtime.getRuntime().exec("C:\\ProgramData\\Anaconda3\\python.exe C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\dataclean\\3-提取并删除基本信息和参考文献.py");
            in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
            in.close();
            proc.waitFor();

            Driver driver = GraphDatabase.driver( "bolt://localhost:7687", AuthTokens.basic( "neo4j", "" ) );
            Session session = driver.session();
            System.out.println("消除neo4j中的重复元素");
            StatementResult result = session.run("MATCH (n:关键词)\n" +
                    "WITH n.keywords AS keyword, COLLECT(n) AS nodelist, COUNT(*) AS count\n" +
                    "WHERE count > 1\n" +
                    "CALL apoc.refactor.mergeNodes(nodelist) YIELD node\n" +
                    "RETURN node" );
            while ( result.hasNext() )
            {
                Record record = result.next();
                System.out.println( record );
            }
            result = session.run("MATCH (n:作者)\n" +
                    "WITH n.author AS keyword, COLLECT(n) AS nodelist, COUNT(*) AS count\n" +
                    "WHERE count > 1\n" +
                    "CALL apoc.refactor.mergeNodes(nodelist) YIELD node\n" +
                    "RETURN node" );
            while ( result.hasNext() )
            {
                Record record = result.next();
                System.out.println( record );
            }
            result = session.run("MATCH (n:文献名)\n" +
                    "WITH n.title AS keyword, COLLECT(n) AS nodelist, COUNT(*) AS count\n" +
                    "WHERE count > 1\n" +
                    "CALL apoc.refactor.mergeNodes(nodelist) YIELD node\n" +
                    "RETURN node" );
            while ( result.hasNext() )
            {
                Record record = result.next();
                System.out.println( record );
            }
            session.close();
            driver.close();

        } catch (InterruptedException | IOException e) {
            e.printStackTrace();
        }

        return filename;
    }   
}
