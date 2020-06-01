package spring.util;

public class Paging {
	
	private int nowPage,//현재페이지번호
				totalCount,//총게시물수
				blockList,//페이지당 보여질 게시물수
				blockPage,//한 블럭당 페이지수
				totalPage,//전체 페이지수
				startPage,//시작 페이지 번호
				endPage,//끝 페이지 번호
				begin,
				end;
	
	private boolean isPrePage;//이전 기능 가능여부
	private boolean isNextPage;//다음 기능 가능여부
	
	private StringBuffer sb;//표현할 HTML코드 저장

	//검색에 필요한것들
	private String noticeWriter;//작성자
	private String noticeTitle;//제목
	private String writeDateStart;
	private String writeDateEnd;
	
	public Paging(int nowPage, int totalCount, int blockList, int blockPage, 
			String noticeWriter, String noticeTitle, String writeDateStart, String writeDateEnd) {
		super();
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.blockList = blockList;//10
		this.blockPage = blockPage;//10
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.writeDateStart = writeDateStart;
		this.writeDateEnd = writeDateEnd;
		
		
		//이전기능,다음기능 초기화
		isPrePage = false;
		isNextPage = false;
		
		//전체 페이지수
		totalPage = (int) Math.ceil((double)totalCount/blockList);// 12/10 -> 1.2 -> 2
		
		if(nowPage > totalPage) {
			nowPage = totalPage;
		}
		
		//현재블럭의 시작번호,마지막번호 계산 1~10, 11~20 ...
		startPage = (int)((nowPage-1)/blockPage) * blockPage+1;
		endPage = startPage + blockPage-1;
		
		//마지막 페이지값이 전체페이지값 보다 크지않게 한다.
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		//표현할 시작게시물의 행번호, 마지막게시물의 행번호 구한다.
		begin = (nowPage - 1) * blockList+1;
		end = begin + blockList-1;
		
		//이전기능이 가능한지 알아보자.
		if(startPage > 1) {//blockPage가 10라할때 startPage는 1 아니면 11 아니면 21이렇게 간다..
			isPrePage = true;
		}
		
		//다음기능이 가능한지 알아보자.
		if(endPage < totalPage) {//totalPage값이 더크다는것은 페이징이 11되었을때부터 이다.
			isNextPage = true;
		}
		
		
		//paging html
		sb = new StringBuffer("<div class='paging_wrap'>");
		
		//이전기능
		if(isPrePage) {//활성
			sb.append("<a href='notice_regist.gvy?cPage=");
			sb.append(nowPage - blockPage);
			sb.append("' class='direction prev'><span>이전</span></a>");
		}else {//비활성
			sb.append("<a href='#' class='direction prev disabled'><span>이전</span></a>");
			
		}
		
		//페이지 번호 출력하는 반복문
		for(int i = startPage;i <= endPage;i++) {
			
			//i의값이 현재 페이지의 값과 같으면
			//현재페이지인것
			if(i == nowPage) {
				sb.append("<strong>");
				sb.append(i);
				sb.append("</strong>");
			}else {
				sb.append("<a href='notice_regist.gvy?cPage=");
				sb.append(i);//파라미터값
				if(noticeWriter != null && noticeWriter.trim().length() > 0) {
					sb.append("&noticeWriter=");
					sb.append(noticeWriter);//검색어-작성자
				}
				if(noticeTitle != null && noticeTitle.trim().length() > 0) {
					sb.append("&noticeTitle=");
					sb.append(noticeTitle);//검색어-작성자
				}
				if(writeDateStart != null && !writeDateStart.isEmpty()) {
					sb.append("&writeDateStart=");
					sb.append(writeDateStart);//시작날짜
				}
				if(writeDateEnd != null && !writeDateEnd.isEmpty()) {
					sb.append("&writeDateEnd=");
					sb.append(writeDateEnd);//마지막날짜
				}
				sb.append("'>");
				sb.append(i);//화면에 출력되는 페이지번호
				sb.append("</a>");
			}
		}
		
		//다음기능
		if(isNextPage) {//활성
			sb.append("<a href='notice_regist.gvy?cPage=");
			sb.append(nowPage + blockPage);
			sb.append("' class='direction next'><span>다음</span></a>");
		}else {//비활성
			sb.append("<a href='#' class='direction next disabled'><span>다음</span></a>");
		}
		
		sb.append("</div>");
		
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getBlockList() {
		return blockList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public void setBlockList(int blockList) {
		this.blockList = blockList;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrePage() {
		return isPrePage;
	}

	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}

	public boolean isNextPage() {
		return isNextPage;
	}

	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getWriteDateStart() {
		return writeDateStart;
	}

	public void setWriteDateStart(String writeDateStart) {
		this.writeDateStart = writeDateStart;
	}

	public String getWriteDateEnd() {
		return writeDateEnd;
	}

	public void setWriteDateEnd(String writeDateEnd) {
		this.writeDateEnd = writeDateEnd;
	}

}
