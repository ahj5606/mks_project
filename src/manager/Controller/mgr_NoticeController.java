package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import manager.Logic.mgr_NoticeLogic;
import manager.pojo.mgr_ModelAndView;

public class mgr_NoticeController implements mgr_Controller {
	String requestName= null;
	Logger logger = Logger.getLogger(mgr_NoticeController.class);
	public mgr_NoticeController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		
		mgr_ModelAndView mav = new mgr_ModelAndView(req,res);
		mgr_NoticeLogic mnl = new mgr_NoticeLogic();
		Map<String, Object> nMap = new HashMap<String, Object>(); 
		
		if("noticeSEL".equals(requestName)) {
			//조회 처음 시작할때 보여줄 전체조회 / 드롭다운 값 &검색창값 if문으로
			List<Map<String, Object>> nList = mnl.noticeSEL(nMap);
			logger.info("mgr_NoticController=>noticeSEL=>nList=>"+nList);
			mav.setViewName("/notice/s_table");
			logger.info("mgr_NoticController=>mav.getViewName=>"+mav.getViewName());
			mav.addObject("nList", nList);
			mav.IsForward(true);
			
		}else if("noticeINS".equals(requestName)) {
			//공지사항을 입력할 때
			
			
			
			
		}else if("noticeDetail".equals(requestName)) {
			//글 row를 클릭하여 상세보기 페이지로 넘어갈 때 req.getParameter 글번호
			
			
			
			
			
		}else if("noticeUPD".equals(requestName)) {
			//수정확인을 눌럿을 때
			
			
			
			
			
		}else if("noticeDEL".equals(requestName)) {
			//삭제확인을 눌럿을 때
			
			
			
			
			
		}
		return mav;
	}

}
