package jp.bean;

import javax.servlet.http.HttpServletRequest;

public class PageCalculator {
		
//		@Autowired
//		private PlanDao planDao;
	
		//검색어 관련 변수
		private String sort, keyword;
		private boolean searchMode;
		private void setSearchMode() {
			searchMode = !sort.equals("") && !keyword.equals("");
		}
		public boolean isSearchMode() {
			return searchMode;
		}
		
		//페이징 관련 변수
		private int pgno, count, sno, eno, psize = 10;
		public void setPsize(int psize) {
			this.psize = psize;
		}
		
		//네비게이션 관련 변수
		private int sb, eb, bcount, bsize = 5;
		private boolean prev, next;
		public void setBsize(int bsize) {
			this.bsize = bsize;
		}
		
		//[생성자1] request를 받아서 바로 추출할 수 있는 생성자
		public PageCalculator(HttpServletRequest request) {
			this(request.getParameter("sort"), request.getParameter("keyword"), request.getParameter("page"));
		}
		
		//[생성자2] pgno를 받아서 계산하는 생성자 
		public PageCalculator(String sort, String keyword, String pageStr) {
			this.setPgno(pageStr);
			this.setSort(sort);
			this.setKeyword(keyword);
			this.setSearchMode();
		}
		
		public void setSort(String sort) {
			if(sort == null) sort = "";
			this.sort = sort;
		}
		
		public void setKeyword(String keyword) {
			if(keyword == null) keyword = "";
			this.keyword = keyword;
		}
		
		public void setPgno(String pageStr) {
			try {
				pgno = Integer.parseInt(pageStr);
				if(pgno <= 0) throw new NumberFormatException();
			}catch(NumberFormatException e) {
				pgno = 1;
			}
		}
		
		//모든 항목을 계산하는 메소드
		public void calculate() {
			//상단 페이징 값 계산
			eno = pgno * psize;
			sno = eno - (psize - 1);
			if(eno > count) eno = count;
			
			//하단 네비게이션 값 계산
			sb = (pgno - 1) / bsize * bsize + 1;
			eb = sb + (bsize - 1);
			bcount = (count - 1) / bsize + 1;
			if(eb > bcount) eb = bcount;
			
			prev = sb > 1;
			next = eb < bcount;
		}
		
		public String getSort() {
			return sort;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setCount(int count) {
			if(count < 0) return;
			this.count = count;
		}

		//getter 메소드
		public int getPgno() {
			return pgno;
		}

		public int getCount() {
			return count;
		}

		public int getSno() {
			return sno;
		}

		public int getEno() {
			return eno;
		}

		public int getPsize() {
			return psize;
		}

		public int getSb() {
			return sb;
		}

		public int getEb() {
			return eb;
		}

		public int getBcount() {
			return bcount;
		}

		public int getBsize() {
			return bsize;
		}

		public boolean isPrev() {
			return prev;
		}

		public boolean isNext() {
			return next;
		}
		
		public int getPrevNumber() {
			return sb-1;
		}
		
		public int getNextNumber() {
			return eb+1;
		}
		
		//확인 및 전송 등에 필요한 문자열 반환 메소드
		public static final int PREV = -1;
		public static final int NEXT = -2;

		public String getQueryString(int n) {
			StringBuffer buffer = new StringBuffer();
			buffer.append("page=");
			switch(n) {
			case PREV:		
				buffer.append(sb-1); break;
			case NEXT:		
				buffer.append(eb+1); break;
			default:
				buffer.append(n); break;
			}
			buffer.append("&sort="+sort+"&keyword="+keyword);
			return buffer.toString();
		}
		
		//학습을 위한 확인용 메소드(없어도 됨)
		public String getSearchString() {
			return "[sort="+sort+", keyword="+keyword+"]";
		}
		
		public String getPagingString() {
			return "[pgno="+pgno+", sno="+sno+", eno="+eno+", count="+count+"]";
		}
		
		public String getNavigationString() {
			return "[bcount="+bcount+", sb="+sb+", eb="+eb+", prev="+prev+", next="+next+"]";
		}
		
	}

