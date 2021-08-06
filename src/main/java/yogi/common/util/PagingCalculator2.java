package yogi.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PagingCalculator2 {
	private int blockCount; // 한페이지에 보여줄 총 리스트 수
	private int blockPage; // 한화면에 보여줄 페이지 수
	private int currentPageNo; // 현재 페이지
	private int totalCount; // 전체게시물수
	private int totalPage; // 전체페이지수
	private int startCount; // 한페이지에 보여줄 게시글 시작번호
	private int endCount; // 한페이지에 보여줄 게시글 끝 번호
	private int startPage; // 시작페이징수
	private int endPage; // 끝페이징수
	
	private String action;
	private StringBuffer pagingHtml;
	private List<?> list;

	/**
	 * @param action : url 액션
	 * @param currentPageNo : 현재 페이지
	 * @param list : db에서 가져온 리스트 목록
	 * @param blockCount : 한페이지에 보여줄 리스트 수
	 * @param blockPage : 한페이지에 보여줄 페이지 수
	 */
	public PagingCalculator2(String action, int currentPageNo, List<?> list, int blockCount, int blockPage) {
		this.action = "/yogi/"+action;
		this.currentPageNo = currentPageNo;
		this.list = list;
		this.totalCount = list.size();
		this.blockCount = blockCount;
		this.blockPage = blockPage;
	}
	
	public Map<String, Object> getPagingList(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage <= 0) {
			totalPage = 1;
		}

		if (currentPageNo > totalPage) {
			currentPageNo = totalPage;
		}

		startCount = (currentPageNo - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		startPage = (int) ((currentPageNo - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		pagingHtml = new StringBuffer();
		if (currentPageNo > blockPage) {
			pagingHtml.append("<li class='paginate_button previous disabled'><a href=" + action + "?currentPageNo=" + (startPage - 1) + ">이전</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPageNo) {
				pagingHtml.append("<li class='paginate_button active'><a href='#'>" + i + "</a></li>");
			} else {
				pagingHtml.append("<li class='paginate_button'><a href=" + action + "?currentPageNo=" + i + ">" + i + "</a></li>");
			}
		}

		// 다음 블럭 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<li class='paginate_button next'><a href=" + action + "?currentPageNo=" + (endPage + 1) + ">다음</a></li>");
		}
		
		int lastCount = totalCount;
		
		if(endCount < totalCount){
			lastCount = endCount+1;
		}
		
		list = list.subList(startCount, lastCount);
		
		resultMap.put("pagingHtml", pagingHtml);
		resultMap.put("list", list);
		
		return resultMap;
	}
}
