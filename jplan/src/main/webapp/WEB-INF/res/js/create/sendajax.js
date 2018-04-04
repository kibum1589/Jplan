$(document).ready(function(){
	
	// 검색 버튼
	$("#google-search-button").click(function(){
		$("#sortable2 *").remove()
		initMap($("#google-search").val())
	})
	
	
	// day 추가버튼
	var dayCount = 1;
	$("#day-add-btn").click(function () {
		dayCount++;
		$("#sortable1").append(
			'<a href="#" class="list-group-item active day-list">' +	
			'<h4 class="list-group-item-heading">'+
				    'Day 0'+dayCount+
				'</h4></a>'		
		)
	})
	
	// 일정등록 버튼
	$('#my-plan-btn').click(function () {
		var planData={
					title: $("#title-input").val(),
					dur: dayCount,
					sday : $("#sday-input").val()
		}
		
		
		// 플랜 만들기 함수
		var planCreate =
			$.ajax({
	        url: "createPlan",
	        type:'GET',
	        data: planData,
	        dataType:"text",
	        
	    	});
		
		
		
		var planDetailArr=new Array();
		// 상세일정 데이터 만들기 함수
		var detailArrCreate = function (pno) {
			
			// 상세일정 관련 데이터
			
			var planDetailObj=new Object();
			var dayNum = 0;
			var detailTurn = 0;
			
			$("#sortable1 > a").each(function(){
				if(!$(this).hasClass("day-list")){
					
					planDetailObj=new Object();
					planDetailObj.pno=pno;
					planDetailObj.id=$(this).data("place");
					planDetailObj.turn=detailTurn;
					planDetailObj.day=dayNum;
					
					planDetailArr.push(planDetailObj);
					
					detailTurn++;
				}
				else {
					dayNum++;
				}
			})
			console.log(planDetailArr);
			return planDetailArr
		}
		
		// 상세일정 등록 메소드
		var planDetailCreate = function(arr){
				$.ajax({
			        url: "createDetail",
			        type:'POST',
			        data: JSON.stringify(arr),
			        dataType:"json",
			        contentType: "application/json", 
			        success:function(data){
			        	console.log("완료")
			        }
			   	});
				
		}
		
		
// 	진행
		planCreate
		.done(function(pno){
			detailArrCreate(pno);
			planDetailCreate(planDetailArr);
			alert("일정 저장완료");
			location.replace('myplan');
		})
		
	})
	

// 좋아요 장소 클릭시
$('#love-place').click(function(){
	$("#sortable2 *").remove()
	
	 $.ajax({
	        url: "create/lovePlace",
	        type:'GET',
	        dataType:"json",
	   	})
	   	.then( function(data) {
	   		
	   		var lovePlaceList = new Array();
	   		
	   		service = new google.maps.places.PlacesService(map);
   			
	   		// 가져온 장소_id 로 반복문
	   		for(var i = 0; i < data.lovePlaces.length; i++) {
	   			
	   			// 파라미터 생성
	   			var request = {
	   					placeId: data.lovePlaces[i]
	        	};
	   			
	   			var count = 0;
	   			
	   			// 구글에 장소 세부정보 요청
	        	service.getDetails(request, function(place, status){
	        		
	        		
	        		if (status == google.maps.places.PlacesServiceStatus.OK) {
	        			lovePlaceList.push( place );
	        			count++;
	        		 }
	        		
	        		if(count==data.lovePlaces.length){
	        			createMarkers(lovePlaceList);
	        		}
	        		
	        		
	        	});

	   		}
	   		
	   	})
	
})
	
	
})