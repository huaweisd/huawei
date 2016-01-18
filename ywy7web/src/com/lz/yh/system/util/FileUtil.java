package com.lz.yh.system.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Scanner;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	public static String WEB_IMG_PATH = "html/fileimg/";
	
	public static String getCurrentTime(){
    	Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
    	
    	int year = c.get(Calendar.YEAR);
	    int month = c.get(Calendar.MONTH) + 1;
	    
    	return year+(String.valueOf((month<10?("0"+month):month)));
    }
	
	public static String getCurrentDateTime(){
    	return String.valueOf(System.currentTimeMillis());   
    }
	
	public static String getWebPath() {
        String classPath = "";
        try {
            classPath = URLDecoder.decode(FileUtil.class.getResource("").toString(), "utf-8");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        classPath = classPath.replace("/", File.separator).replace("\\", File.separator);
        classPath = classPath.substring(classPath.indexOf(File.separator) + 1);
        classPath = classPath.substring(0, classPath.length() - 1);
        String className = FileUtil.class.toString();

        while (className.indexOf(".") != -1) {
            classPath = classPath.substring(0, classPath.lastIndexOf(File.separator));
            className = className.substring(className.indexOf(".") + 1);
        }

        classPath = classPath.substring(0, classPath.lastIndexOf(File.separator));
        String path = classPath.substring(0, classPath.indexOf("WEB-INF"));
        if (isWindowsOS()) {//win
            return path;
        } else {

            return "/" + path;
        }
    }

    public static String getSystemPath() {
        String str = (getWebPath() + "html/fileimg/" + getCurrentTime() + "/")
                .replace("/", File.separator).replace("\\", File.separator);
        return isWindowsOS() == true ? str : ("/" + str);
    }

    /**
     * 扫描文件
     *
     * @param file
     * @return
     */
    public static List<String> getPageCode(File file) {
        List<String> list = new ArrayList<String>();
        Scanner in = null;
        try {
            in = new Scanner(file);
            while (in.hasNextLine()) {
                String str = in.nextLine();

                if (null != str && !str.isEmpty()) {
                    str.trim();
                    list.add(str.split("[\\p{Space}]+")[0]);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            in.close();
        }
        return list;
    }

    public static boolean isWindowsOS() {
        boolean isWindwos = false;
        String osName = System.getProperty("os.name");
        if (osName.toLowerCase().indexOf("windows") > -1) {
            isWindwos = true;
        }
        return isWindwos;
    }

    public static String upload(MultipartFile imgFile) {
        String filePath = "";
        String fileName = getCurrentDateTime();
        File file = null;

        try {
            file = new File(FileUtil.getSystemPath());
            if (!file.exists() && !file.isDirectory())
            {
                file.mkdir();
            }

            String fileType = imgFile.getOriginalFilename();
            fileType = fileType.substring(fileType.lastIndexOf("."), fileType.length());

            InputStream stream = imgFile.getInputStream();
            OutputStream bos = new FileOutputStream(FileUtil.getSystemPath()
                    + fileName + fileType);
            filePath = WEB_IMG_PATH + getCurrentTime()
                    + "/" + fileName + fileType;

            int bytesRead = 0;
            byte[] buffer = new byte[81920];
            while ((bytesRead = stream.read(buffer, 0, 8192)) != -1)
            {
                bos.write(buffer, 0, bytesRead);
            }

            bos.close();
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return filePath;
    }
}
