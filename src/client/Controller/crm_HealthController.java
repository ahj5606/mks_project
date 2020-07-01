package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Logic.crm_HealthInfoLogic;
import client.pojo.crm_ModelAndView;


public class crm_HealthController implements crm_Controller{
	Logger logger = Logger.getLogger(crm_HealthController.class);

	String requestName= null;
	crm_HealthInfoLogic crm_hiLogic = new crm_HealthInfoLogic();
	
	public crm_HealthController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("healthList".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			List<Map<String, Object>> healthList = null;
			String i_title = req.getParameter("i_title");
			String h_order = req.getParameter("h_order");
			String num_str = req.getParameter("num");
			String board_no = req.getParameter("board_no");
			pMap.put("h_order", h_order);
			pMap.put("i_title", i_title);
			pMap.put("board_no", board_no);
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
					healthList = crm_hiLogic.healthList(pMap);
					mav.addObject("hList", healthList);
				}else {// num==0 사이즈를 저장!!
					logger.info("num==0");
					healthList = crm_hiLogic.healthList(pMap);
					mav.addObject("hList_size", healthList.size());
				}
			}
			logger.info("boardList 사이즈: "+healthList.size());
			mav.IsForward(true);
			mav.setViewName("/healthInfo/jsonHealthInfoList");
		} else if("healthIns".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String board_content = req.getParameter("board_content");
			String board_title = req.getParameter("board_title");
			String board_date = req.getParameter("board_date");
			pMap.put("board_content", board_content);
			pMap.put("board_title", board_title);
			pMap.put("board_date", board_date);
			logger.info("board_content: "+board_content);
			logger.info("board_title: "+board_title);
			logger.info("board_date: "+board_date);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_hiLogic.healthIns(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/healthInfo/jsonHealthInfoResult");
			mav.IsForward(true);	
		} else if("healthUpd".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String board_content = req.getParameter("board_content");
			String board_title = req.getParameter("board_title");
			String board_no = req.getParameter("board_no");
			pMap.put("board_content", board_content);
			pMap.put("board_title", board_title);
			pMap.put("board_no", board_no);
			logger.info("board_content: "+board_content);
			logger.info("board_title: "+board_title);
			logger.info("board_no: "+board_no);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_hiLogic.healthUpd(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/healthInfo/jsonHealthInfoResult");
			mav.IsForward(true);			
		} else if("healthHit".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String board_no = req.getParameter("board_no");
			pMap.put("board_no", board_no);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_hiLogic.healthHit(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/healthInfo/jsonHealthInfoResult");
			mav.IsForward(true);
		} else if("healthLike".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String good = req.getParameter("good");
			String bad = req.getParameter("bad");
			String board_no = req.getParameter("board_no");
			pMap.put("good", good);
			pMap.put("bad", bad);
			pMap.put("board_no", board_no);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_hiLogic.healthLike(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/healthInfo/jsonHealthInfoResult");
			mav.IsForward(true);
		} else if("healthDel".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String board_no = req.getParameter("board_no");
			pMap.put("board_no", board_no);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_hiLogic.healthDel(pMap);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/healthInfo/jsonHealthInfoResult");
			mav.IsForward(true);
		} 
		return mav;
	}
}
