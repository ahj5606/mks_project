package mks.util;

public class PageBarManager {
   //전체레코드 갯수
   private int totalRecord;
   //페이지당 레코드 수
   private int numPerPage;
   //블럭당 디폴트 페이지 수 - 여기서는 일단 2개로 정함.
   private int pagePerBlock=5;
   //총페이지 수
   private int totalPage;
   //총블럭 수
   private int totalBlock;
   //현재 내가 바라보는 페이지 수
   private int nowPage;
   //현재 내가 바라보는 블럭 수
   private int nowBlock;
   //적용할 페이지 이름
   private String pagePath;
   private String pagination;
   public PageBarManager(int numPerPage, int totalRecord, int nowPage, String pagePath) {
      this.numPerPage = numPerPage;
      this.totalRecord = totalRecord;
      this.nowPage = nowPage;
      this.pagePath = pagePath;
      
      this.totalPage = 
            (int)Math.ceil((double)this.totalRecord/this.numPerPage);//페이지 올림
      this.totalBlock= 
            (int)Math.ceil((double)this.totalPage/this.pagePerBlock);
      //현재 내가바라보는 페이지 : (int)((double)4-1/2)
      this.nowBlock = (int)((double)this.nowPage/this.pagePerBlock);
   }
   //setter메소드 선언
   public void setPageBar() {
      StringBuilder pageLink = new StringBuilder();
      pageLink.append("<div class='text-center'>");
      //전체 레코드 수가 0보다 클때 처리하기			내 페이지에는 링크를 걸지 않는다.
      if(totalRecord>0) {	
         //nowBlock이 0보다 클때 처리
         //이전 페이지로 이동 해야 하므로 페이지 번호에 a태그를 붙여야 하고
         //pagePath뒤에 이동할 페이지 번호를 붙여서 호출 해야함.
         if(nowBlock > 0 ) {                                    //(1-1)*2+(2-1)=1
            pageLink.append("<a href='"+pagePath+"&nowPage="+((nowBlock-1)*pagePerBlock+(pagePerBlock-1))+"'>");
            pageLink.append("<button  type='button' class='page-number btn btn-outline-primary'><<</button>");
            pageLink.append("</a>&nbsp;&nbsp;");
         }
         for(int i=0;i<pagePerBlock;i++) {
            //현재 내가 보고 있는 페이지 블록 일때와
            if(nowBlock*pagePerBlock+i==nowPage) {
               pageLink.append("<button  type='button' class='page-number btn btn-outline-primary active'>"+(nowBlock*pagePerBlock+i+1)+"</button>");
            }
            //그렇지 않을 때를 나누어 처리해야 함.
            else {
            	String href = pagePath+"&nowPage="+((nowBlock*pagePerBlock)+i);
            	pageLink.append("<a href='"+pagePath+"&nowPage="+((nowBlock*pagePerBlock)+i)+"'><button  type='button' class='page-number btn btn-outline-success'>"+((nowBlock*pagePerBlock)+i+1)+"</button></a>");
               
            }
            //모든 경우에 pagePerBlock만큼 반복되지 않으므로 break처리해야 함.
            //주의할 것.
            if((nowBlock*pagePerBlock)+i+1==totalPage) break;
         }
         //현재 블록에서 다음 블록이 존재할 경우 이미지 추가하고 페이지 이동할 수 있도록
         //a태그 활용하여 링크 처리하기
         if(totalBlock > nowBlock+1) {
            pageLink.append("&nbsp;&nbsp;<a href='"+pagePath+"&nowPage="+((nowBlock+1)*pagePerBlock)+"'>");
            pageLink.append("<button  type='button' class='page-number btn btn-outline-primary'>>></button>");
            pageLink.append("</a>");   
         }
      }
      pageLink.append("</div>");
      pagination = pageLink.toString();
   }
   //getter메소드 선언
   public String getPageBar() {
      this.setPageBar();
      return pagination;
   }
}
