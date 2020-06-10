<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한페이징에 표시될 페이지수 --> writePages
	// 총 페이지수 --> totalPage
	// 현재 페이지 --> curPage
	int writePages = Integer.parseInt(request.getParameter("writePages"));
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
	int curPage = Integer.parseInt(request.getParameter("curPage"));
	// ※ 사실 위 단계에서도 파라미터 검증 필요하다
	
	// 위 url에 추가로 붙어야 할 것들.  (옵션)
	String add = request.getParameter("add"); 
	if(add == null){ add = ""; }
	
	// 페이징 버튼 링크 url 주소에 넣을 문자열 준비
	String url = request.getRequestURL().toString().replace("jsp","po") + "?page=";
	
	String str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성

	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
    int start_page = ( ( (int)( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    int end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
	
	//■ << 표시 여부
	if(curPage > 1){
		str += "<li class='page-item'><a href='" + url + "1" +  add + "' class='page-link' title='처음'><i class='fa fa-angle-double-left'></i></a></li>\n";
	}
	
  	//■  < 표시 여부
    if (start_page > 1) 
    	str += "<li class='page-item'><a href='" + url + (start_page - 1) + add + "' class='page-link' title='이전'><i class='fa fa-angle-left'></i></a></li>\n";
    
    //■  페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
	    for (int k = start_page; k <= end_page; k++) {
	        if (curPage != k)
	            str += "<li class='page-item'><a class='page-link' href='" + url + k + add + "'>" + k + "</a></li>\n";
	        else
	            str += "<li class='page-item active'><a href='#' class='page-link' title='현재페이지'>" + k + "</a></li>\n";
	    }
	}
	
	//■ > 표시
    if (totalPage > end_page){
    	str += "<li class='page-item'><a href='" + url + (end_page + 1) + add + "' class='page-link' title='다음'><i class='fa fa-angle-right'></i></a></li>\n";
    }

	//■ >> 표시
    if (curPage < totalPage) {
        str += "<li class='page-item'><a href='" + url + totalPage + add + "' class='page-link' title='마지막'><i class='fa fa-angle-double-right'></i></a></li>\n";
    }

%>
<!-- top nav -->
	<ul class="pagination justify-content-center">
	<%= str %>
	</ul>

    

