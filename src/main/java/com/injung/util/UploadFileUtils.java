package com.injung.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString()+"_"+originalName;
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedPath + "/" + savedName;
		
//		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
//		String uploadedFileName = null;
//		
//		if(MediaUtils.getMediaTpye(formatName) != null) {
//		    System.out.println("uploadpath : " + uploadPath);
//		    System.out.println("savedPath : " + savedPath);
//		    System.out.println("savedName : " + savedName);
//			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
//		}		
//		
//		return uploadedFileName;
	}
	public static String uploadProfileFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
	    UUID uid = UUID.randomUUID();
	    String savedName = uid.toString()+"_"+originalName;
        String savedPath = calcPath(uploadPath);
        File target = new File(uploadPath+savedPath, savedName);
        FileCopyUtils.copy(fileData, target);       
        
	    return savedPath + "/" + savedName;
	}
	
	
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath +
				File.separator +
				new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath +
				File.separator +
				new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
	    BufferedImage sourceImg = new BufferedImage(240, 240, BufferedImage.TYPE_INT_ARGB);
//		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.BALANCED, Scalr.Mode.AUTOMATIC, 200);
		
		String thumbnailName = uploadPath+path+File.separator+"s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
