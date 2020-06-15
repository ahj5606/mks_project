package client.pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class crm_ModelAndView {
	HttpServletRequest req = null;
	HttpServletResponse res = null;
	private String viewName = null;//이동할 페이지 이름을 정의
	private boolean isForward = false;
	private int result =-1;
	public crm_ModelAndView() {
		
	}
	public crm_ModelAndView(HttpServletRequest req , HttpServletResponse res) {
		this.req=req;
		this.res=res;
	}
	public void setViewName(String viewName) { 
		this.viewName =viewName;
	}
	public String getViewName() {
		return viewName;
	}
	public void addObject(String name,Object obj) {	//forward할 데이터를 저장함. 
		req.setAttribute(name, obj);
	}
	public void cudResult(int result) {	//UPDATE / INSERT / DELETE 한후 return 받은 result값을 넣어주세요. 
										//CUD 일때는 이거만 실행하면 됩니다.
		this.result=result;
		System.out.println(result);
		isForward = false;
		if(result==1) {
			viewName="/success";	    //성공 이라는 텍스트만 들어있는 페이지 
		}else if(result==0) { 
			viewName="/fail";		//실패 이라는 텍스트만 들어있는 페이지
		}
	}
	public void IsForward(boolean isForward) { // forward면 true redirect면 false
		this.isForward=isForward;
	}
	public boolean getIsForward() { // forward인지 가져옴
		return isForward;
	}
}
