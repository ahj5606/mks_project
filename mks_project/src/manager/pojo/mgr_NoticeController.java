package manager.pojo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mgr_NoticeController implements mgr_Controller {
	String requestName= null;
	public mgr_NoticeController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("noticeSEL".equals(requestName)) {
			//조회 처음 시작할때 보여줄 전체조회 / 드롭다운 값 &검색창값 if문으로

			
			
			
			
		}else if("noticeINS".equals(requestName)) {
			//공지사항을 입력할 때
			
			
			
			
		}else if("noticeDetail".equals(requestName)) {
			//글 row를 클릭하여 상세보기 페이지로 넘어갈 때 req.getParameter 글번호
			
			
			
			
			
		}else if("noticeUPD".equals(requestName)) {
			//수정확인을 눌럿을 때
			
			
			
			
			
		}
		return mav;
	}

}
