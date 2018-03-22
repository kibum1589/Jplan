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
			
			// 나만보기 버튼
			$('#my-plan-btn').click(function () {
				var planData={
							title: $("#title-input").val(),
							dur: $("#dur-input").val(),
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
					for(var i = 0 ; i< arr.length ; i++){
						$.ajax({
					        url: "createDetail",
					        type:'GET',
					        data: arr[i],
					        dataType:"text",
					        success:function(){
					        	$(location).attr('href',"/myplan");
					        }
					   	});
					}
						
				}
				
				
// 				진행
				planCreate
				.done(function(pno){
					detailArrCreate(pno);
					planDetailCreate(planDetailArr);
				})
				
			})
			
			
			// 테스트용 (데이터 가져오기 확인)
			$(document).on("click",".list-group-item",function(){
				console.log("장소 id: "+$(this).data("place") + " 인덱스: "+$(this).index())
			})
			
    	})