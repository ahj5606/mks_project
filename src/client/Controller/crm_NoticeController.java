package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Logic.crm_NoticeLogic;
import client.pojo.crm_ModelAndView;

public class crm_NoticeController implements crm_Controller {
	
	Logger logger = Logger.getLogger(crm_NoticeController.class);
	String requestName= null;
	crm_NoticeLogic crm_noLogic = new crm_NoticeLogic();
	
	public crm_NoticeController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("noticeList".equals(requestName)) {
			List<Map<String, Object>> noticeList = null;
			Map<String, Object> pMap = new HashMap<String, Object>();
			String mode = req.getParameter("mode");
			String imsi = req.getParameter("num");
			String title = req.getParameter("title");
			pMap.put("board_title", title);
			pMap.put("mode", mode);
			logger.info("mode: " + mode);
			int first = 0;
			int end = 0;
			if(imsi != null) {
				logger.info("imsi 이 null이 아닐때....");
				int num = Integer.parseInt(imsi);
				int recodeNum = 5;
				if(num != 0) { //페이지네이션 적용
					first = (num-1)*recodeNum+1;
					end = num*recodeNum;
					pMap.put("fnum", first);
					pMap.put("enum", end);
					logger.info("fnum: " + first + ", enum: " + end);
					noticeList = crm_noLogic.noticeList(pMap);
					mav.addObject("noticeList", noticeList);
				} else { // num == 0 사이즈를 저장.
					logger.info("num == 0");
					noticeList = crm_noLogic.noticeList(pMap);
					mav.addObject("size", noticeList.size());
				}
			}else {
				noticeList = crm_noLogic.noticeList(pMap);
				mav.addObject("noticeList", noticeList);
			}
			logger.info("noticeList 사이즈: " + noticeList.size());
			mav.IsForward(true);
			mav.setViewName("/notice/jsonNoticeList");
			
		}
		else if("noticeDetail".equals(requestName)) {
			List<Map<String, Object>> noticeDetail = null;
			Map<String, Object> pMap = new HashMap<>();
			int board_no = Integer.parseInt(req.getParameter("board_no"));
			pMap.put("board_no", board_no);
			logger.info("board_no: " + board_no);
			noticeDetail = crm_noLogic.noticeDetail(pMap);
			mav.addObject("noticeDetail", noticeDetail);
			logger.info("noticeDetail 사이즈: " + noticeDetail.size());
			mav.IsForward(true);
			mav.setViewName("/notice/jsonNoticeDetail");
		}
		return mav;
	}

}
