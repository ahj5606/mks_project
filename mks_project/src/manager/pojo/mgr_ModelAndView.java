package manager.pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mgr_ModelAndView {
	HttpServletRequest req = null;
	HttpServletResponse res = null;
	private String viewName = null;//이동할 페이지 이름을 정의
	private boolean isForward = false;
	private int result =-1;
	public mgr_ModelAndView() {
		
	}
	public mgr_ModelAndView(HttpServletRequest req , HttpServletResponse res) {
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
	public void cudResult(int reuslt) {	//UPDATE / INSERT / DELETE 한후 return 받은 result값을 넣어주세요.
		this.result=result;
		isForward = false;
		if(result==1) {
			viewName="success";
		}else if(result==0) {
			viewName="fail";
		}
	}
	public void IsForward(boolean isForward) {
		this.isForward=isForward;
	}
	public boolean getIsForward() {
		return isForward;
	}
}
