package mks.util;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	String hp_code = "";

	
	
	
	//요청 객체는 사용자가 요청했을 때  요청을 받아주는 서블릿에서 
	//주소번지를 받아와야 한다.
	//그래야 그 사람에 대한 요청 정보를 확인할 수 있는 것이다.
	//이 말을 이해하고 설명할 수 있는지 확인해 볼것.
	HttpServletRequest req = null;
	//첨부 파일 처리에 필요한 변수 선언
	MultipartRequest multi = null;
	String realFolder = "";
	//첨부파일의 한글처리
	String encType = "utf-8";
	//첨부파일의 크기
	int maxSize = 50*1024*1024;//5MB
	
	public HashMapBinder() {}
	
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
		realFolder = "C:\\Users\\kosmo_02\\git\\mks_project\\WebContent\\pds";
		HttpSession sess = req.getSession();
		hp_code = (String)sess.getAttribute("hp_code");
		

	
	}
	public void multiBind(Map<String,Object> pMap) {
		logger.info("multiBind 호출 성공");
		pMap.clear();
		pMap.put("hp_code", hp_code);
		
		logger.info("pMap=>"+pMap);
		try {
			logger.info(" before multi : "+multi);
				multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
				logger.info("multi : "+multi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Enumeration<String> en = multi.getParameterNames();
		//자료구조안에 데이터가 있나요?
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			pMap.put(key, multi.getParameter(key));
			logger.info("ket=>map=>"+pMap);
			logger.info("ket=>value=>"+pMap.get(key));
		}
		//첨부파일에 대한 정보를 받아오는 코드 추가하기
		Enumeration<String> files = multi.getFileNames();
		File file = null;
		
		  //if(pMap.get("board_file")==null) { pMap.put("board_file", ""); } 
		  if(files!=null) {
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				logger.info("fname:"+fname);
				String filename = multi.getFilesystemName(fname);
				pMap.put("board_file", filename);
				logger.info("filename=>"+filename);
				if(filename !=null && filename.length()>1) {
					file = new File(realFolder+"\\"+filename);
				}
				logger.info("file:"+file);
			}///////////////end of while
		}//////////////////end of if

		
		//위에서 파일객체가 만들어 졌으니까 파일 크기를 계산가능
		double size = 0;
		if(file !=null) {
			size = file.length();//단위가 바이트 단위 
			size = size/(1024.0);
			pMap.put("bs_size", size);
		}
	}
	public void binder(Map<String,Object> pMap) {
		//기존에 들어 있던 값이 있다면 모두 비운다.
		pMap.clear();
		pMap.put("hp_code", hp_code);

		Enumeration<String> en = req.getParameterNames();
		//enumeration에 값이 들어있는지 체크해 줌.
		HangulConversion hc = new HangulConversion();
		while(en.hasMoreElements()) {
			String key = en.nextElement();//name, address, pet
			if(req.getParameter(key).equals("")) {
				pMap.put(key,null);
			}else {
				pMap.put(key,req.getParameter(key));
				logger.info("hashMapBinder  :  "+req.getParameter(key));
			}
		}
	}
}






