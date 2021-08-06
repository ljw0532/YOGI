package yogi.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.common.common.YogiConstants;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\java\\git\\YOGI\\YOGI\\src\\main\\webapp\\resources\\upload\\";
	
	public Map<String, Object> parseInsertFileInfo(HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		/*List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();*/
		Map<String, Object> fileMap	= null; //listMap->fileMap
		
		/*String boardIdx = (String)map.get("IDX");*/
		
		File file = new File(filePath);
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = YogiUtils.getRandomString() + originalFileExtension;
				
				file = new File(filePath+storedFileName);
				multipartFile.transferTo(file);
				
				fileMap = new HashMap<String, Object>();
				/*listMap.put("BOARD_IDX", boardIdx);*/
				fileMap.put("ORIGINAL_FILE_NAME", originalFileName);
				fileMap.put("STORED_FILE_NAME", storedFileName);
				/*listMap.put("FILE_SIZE", multipartFile.getSize());*/
				/*list.add(listMap);*/
				
			}
		}
		return fileMap;
	}
	

}
