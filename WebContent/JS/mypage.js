$.ajax({

    url: "mypageView.uo", // request 할 url
    type: "post", 	// request 방식
    cache: false,		
    dataType: "json",	
//    data: {user_uid : },			// request 에 전송할 data 
    success: function(data){ // 요청 성공했을 때의 콜백 함수 
    	viewList(data);
    },
    error: function (request, status, error){        

    }
  });

function viewList(jsonObj){
	
	result = "";  
	
	if(jsonObj.status == "OK"){
		
//		var count = jsonObj.count;
		
		var i;
		var items = jsonObj.data; // 배열
		for(i = 0; i < items.length; i++){
			// result 문자열 조립할 거고, 포문 다끝나면 
			result += "<tr>\n";
			result += "<td>" + items[i].mypage_subject + "</td>\n";
			result += "<td>" + items[i].mypage_content + "</td>\n";
			result += "</tr>\n";
		} // end for
		$("#frmView tbody").html(result); // 테이블 업데이트 ! 
		
	
		return true;
	} else{
		alert(jsonObj.message);
		return false;
	}
	return false;
} // end updateList