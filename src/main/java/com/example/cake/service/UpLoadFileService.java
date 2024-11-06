package com.example.cake.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UpLoadFileService {
    private final ServletContext servletContext;

    public UpLoadFileService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handlSaveUploadFile(MultipartFile file, String targetFolder) {
        String a = this.servletContext.getRealPath("");
        String finalName = "";
        String rootPath = this.servletContext.getRealPath("/resources/images");
        try {
            byte[] bytes;
            bytes = file.getBytes();

            // a sẽ lấy tới chính thư mục webapp trong máy tính

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            System.out.println(finalName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return finalName;
    }
}
