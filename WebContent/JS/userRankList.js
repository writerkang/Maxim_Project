$(document).ready(function(){
	// 페이지가 로딩되면 포인트 랭킹을 보여줍니다.
	getList();
		
	// 포인트 랭킹을 보여주는 함수
	function getList(){
		var url = "userRankList.ajax";
		
		$.ajax({
			url :  url,
			type : "post",
			cache : false,
			success : function(data, status){
				if(status == "success") 
					parseJSON(data);
			}
		});
	}
	
	function parseJSON(jsonObj){
		var data = jsonObj.data;
		var i;
		var list = "";
		
		if(data != null){
			for (i = 0; i < 3; i++){
				if(data[i] != null){
					$(".ranker" + (i+1) + " .ranker-name").html(data[i].user_name);
					$(".ranker" + (i+1) + " .card-stats").html(data[i].user_point + " point");
				}
			}
			
			for (i = 0; i < data.length; i++){ 			
				list += "<tr>";
				list += "<td>" + data[i].user_rank + "</td>";
				list += "<td><a href='mypageView.uo?user_uid=" + data[i].user_uid + "'>" + data[i].user_name + "</a></td>";
				list += "<td>" + data[i].user_point + "</td>";
				list += "</tr>";
			} // end for
		}
		$(".userRank-list").html(list);
	}
	//------------------------------
});