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
import manager.notice.HashMapBinder;
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
		List<Map<String, Object>> nList = null;
		Map<String, Object> nMap = null;
		int result = 0;
		
		String no 		= req.getParameter("no");
		String title 	= req.getParameter("title");
		String content 	= req.getParameter("content");
		String writer 	= req.getParameter("writer");
		String board_file	= req.getParameter("board_file");
		String id		= req.getParameter("id");
		String hp_code 	= req.getParameter("hp_code");
		String search 	= req.getParameter("search");
		String mks_id	= "test";
		hp_code = "276HP";

		
		if("noticeSEL".equals(requestName)) {
			//조회 처음 시작할때 보여줄 전체조회 / 드롭다운 값 &검색창값 if문으로
			nMap = new HashMap<String, Object>();
			nMap.put("mks_id", id);
			nMap.put("hp_code", hp_code);
			logger.info("mgr_NoticController=>noticeSEL=>nMap=>"+nMap);
			nList = mnl.noticeSEL(nMap);
			logger.info("mgr_NoticController=>noticeSEL=>nList=>"+nList);
			mav.setViewName("/notice/s_table");
			logger.info("mgr_NoticController=>mav.getViewName=>"+mav.getViewName());
			mav.addObject("nList", nList);
			mav.IsForward(true);
			
		}else if("noticeSEARCH".equals(requestName)) {
				//조회 처음 시작할때 보여줄 전체조회 / 드롭다운 값 &검색창값 if문으로
				nMap = new HashMap<String, Object>();
				nMap.put("mks_id", id);
				nMap.put("hp_code", hp_code);
				nMap.put("board_title", search);
				nMap.put("dept_name", search);
				logger.info("mgr_NoticController=>noticeSEARCH=>nMap=>"+nMap);
				nList = mnl.noticeSEARCH(nMap);
				logger.info("mgr_NoticController=>noticeSEARCH=>nList=>"+nList);
				mav.setViewName("/notice/s_table");
				logger.info("mgr_NoticController=>mav.getViewName=>"+mav.getViewName());
				mav.addObject("nList", nList);
				mav.IsForward(true);
				
				
		}else if("noticeDetail".equals(requestName)) {
			//글 row를 클릭하여 상세보기 페이지로 넘어갈 때 req.getParameter 글번호
			logger.info("controller=>detail");
			nMap = new HashMap<String, Object>();
			nMap.put("hp_code", hp_code);
			nMap.put("board_no", no);
	
			logger.info("controller=>board_no=>"+nMap.get("board_no"));
			nList = mnl.noticeSEL(nMap);
			logger.info("mgr_NoticController=>noticeDetail=>nList=>"+nList);
			mav.setViewName("/notice/s_detailform");
			mav.addObject("nList", nList);
			mav.IsForward(true);
			
			
		}else if("noticeINS".equals(requestName)) {
			//공지사항을 입력할 때 
			logger.info("controller=>ins호출 성공");
			
			
			nMap = new HashMap<String, Object>();
			nMap.put("mks_id", mks_id);
			nMap.put("hp_code", hp_code);
			nMap.put("board_content", content);
			nMap.put("board_title", title);
			nMap.put("board_file", board_file);

			/*
			 * HashMapBinder hmb = new HashMapBinder(req); hmb.multiBind(nMap);
			 */
			result = mnl.noticeINS(nMap);
			
			if(result==1) {
				hp_code = "276HP";
				 mav.IsForward(false); 
				 //mav.addObject("nMap", nMap);
				 mav.setViewName("/notice/noticeSEL.mgr?hp_code="+hp_code+"&");
				 
				//res.sendRedirect("/manager/notice/noticeSEL.mgr?hp_code="+hp_code);
			}
			else {
				logger.info("INS실패");
			}
			
			
			
		}else if("noticeUPD".equals(requestName)) {
			//수정확인을 눌럿을 때
			logger.info("controller=>upd호출 성공");

			nMap = new HashMap<String, Object>();
			nMap.put("hp_code", hp_code);
			nMap.put("board_file", board_file);
			nMap.put("board_content", content);
			nMap.put("board_title", title);
			nMap.put("board_no", no);

			result = mnl.noticeUPD(nMap);
			
			mav.cudResult(result);
			
		}else if("noticeDEL".equals(requestName)) {
			//삭제확인을 눌럿을 때
			logger.info("controller=>del호출 성공");
			
			nMap = new HashMap<String, Object>();
			nMap.put("hp_code", hp_code);

			nMap.put("board_no", no);
			
			result = mnl.noticeDEL(nMap);
			
			mav.cudResult(result);
			
		}
		return mav;
	}

}