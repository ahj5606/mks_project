package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Logic.crm_BoardLogic;
import client.pojo.crm_ModelAndView;



public class crm_BoardController implements crm_Controller{
	
	Logger logger = Logger.getLogger(crm_BoardController.class);
	
	crm_BoardLogic crm_bLogic = new crm_BoardLogic();
	String requestName= null;
	
	public crm_BoardController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("boardList".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			List<Map<String, Object>> boardList = null;
			String num_str = req.getParameter("num");
			String b_title = req.getParameter("b_title");
			String b_writer = req.getParameter("b_writer");
			String hp_name = req.getParameter("hp_name");
			String eva_code = req.getParameter("eva_code");
			String b_order = req.getParameter("b_order");
			pMap.put("eva_title", b_title);
			pMap.put("mks_id", b_writer);
			pMap.put("hp_name", hp_name);
			pMap.put("eva_code", eva_code);
			pMap.put("b_order", b_order);
			int first = 0;
			int end = 0;
			if(num_str!=null) {
				int num = Integer.parseInt(num_str);
				int recodeNum = 5;
				if(num!=0){//페이지네이션 적용
					first = (num-1)*recodeNum+1;
					end = num*recodeNum;
					pMap.put("fnum", first);
					pMap.put("enum", end);
					logger.info("fnum: "+first+", enum: "+end);
					boardList = crm_bLogic.boardList(pMap);
					mav.addObject("bList", boardList);
				}else {// num==0 사이즈를 저장!!
					logger.info("num==0");
					boardList = crm_bLogic.boardList(pMap);
					mav.addObject("bList_size", boardList.size());
				}
			}
			logger.info("boardList 사이즈: "+boardList.size());
			mav.IsForward(true);
			mav.setViewName("/board/jsonBoardList");
		}
		else if("boardResList".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			List<Map<String, Object>> boardResList = null;
			String mks_id = req.getParameter("mks_id");
			pMap.put("mks_id", mks_id);
			logger.info("mks_id: "+mks_id);
			boardResList = crm_bLogic.boardResList(pMap);
			mav.addObject("brList", boardResList);
			logger.info("boardResList 사이즈: "+boardResList.size());
			mav.IsForward(true);
			mav.setViewName("/board/jsonBoardResList");
		} 
		else if("boardReplyList".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			List<Map<String, Object>> boardReplyList = null;
			String eva_code = req.getParameter("eva_code");
			pMap.put("eva_code", eva_code);
			boardReplyList = crm_bLogic.boardReplyList(pMap);
			mav.addObject("bReplyList", boardReplyList);
			logger.info("bReplyList 사이즈: "+boardReplyList.size());
			mav.IsForward(true);
			mav.setViewName("/board/jsonBoardReplyList");
			
		} else if("boardIns".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String eva_content = req.getParameter("eva_content");
			String mks_id = req.getParameter("mks_id");
			String eva_title = req.getParameter("eva_title");
			String eva_date = req.getParameter("eva_date");
			String sch_code = req.getParameter("sch_code");
			String eva_code = req.getParameter("eva_code");
			String group_no = req.getParameter("group_no");
			pMap.put("eva_content", eva_content);
			pMap.put("mks_id", mks_id);
			pMap.put("eva_title", eva_title);
			pMap.put("eva_date", eva_date);
			pMap.put("sch_code", sch_code);
			pMap.put("eva_code", eva_code);
			pMap.put("group_no", group_no);
			logger.info("eva_content: "+eva_content);
			logger.info("mks_id: "+mks_id);
			logger.info("eva_title: "+eva_title);
			logger.info("eva_date: "+eva_date);
			logger.info("sch_code: "+sch_code);
			logger.info("eva_code: "+eva_code);
			logger.info("group_no: "+group_no);
			if(group_no==null) {//새글이닷!
				logger.info("새글!!");
				pMap.put("pos",1);
			}else {//댓글이닷!
				logger.info("댓글!!");
				pMap.put("pos",2);
			}
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_bLogic.boardIns(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/board/jsonBoardResult");
			mav.IsForward(true);
		} 
		else if("boardUpd".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String eva_code = req.getParameter("eva_code");
			String eva_content = req.getParameter("eva_content");
			String eva_title = req.getParameter("eva_title");
			pMap.put("eva_code", eva_code);
			pMap.put("eva_content", eva_content);
			pMap.put("eva_title", eva_title);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_bLogic.boardUpd(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/board/jsonBoardResult");
			mav.IsForward(true);
		} 
		else if("boardHit".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String eva_code = req.getParameter("eva_code");
			pMap.put("eva_code", eva_code);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_bLogic.boardHit(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/board/jsonBoardResult");
			mav.IsForward(true);
		}
		else if("boardDel".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String mks_id = req.getParameter("mks_id");
			String mks_pw = req.getParameter("mks_pw");
			String eva_code = req.getParameter("eva_code");
			pMap.put("mks_id", mks_id);
			pMap.put("mks_pw", mks_pw);
			pMap.put("eva_code", eva_code);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_bLogic.boardDel(pMap);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/board/boardList");
			mav.IsForward(true);
		}
		return mav;
	}
}

