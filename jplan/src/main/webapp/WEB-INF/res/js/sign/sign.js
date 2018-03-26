/*    //회원가입 div 보이고 끄기 
    function sign_div_open(){
    	 document.getElementById('sign_div').style.display = "inline";
    };*/
    
    //스페이스 방지 
	function space_x() {
		document.querySelector(".row");
		if(event.keyCode == 32){
            
            //preventDefault(); 쓰면 이벤트 를 막겠다 라는 것이다. 
            event.preventDefault();
        }
	}
	
	
    var nck; // 이름 확인 변수
    var pwk; // 비밀번호 확인 변수
    var ek;	// 이메일 확인 변수
   
        
    //이메일 중복확인 ajax
    	var emailcheck;
	$(document).ready(function(){
		$("#check").on("keyup", function(){
			var email = $("#check").val();
			console.log(email);
			$.ajax({
				url:"signcheck",
				type:"post",
				//ajax 요청을 보내면서 데이터를 첨부
				data:{
					email:email
				},
				dataType:"text",
				success:function(result){
					console.log(result);
					if(result>0){
						$("#email_check").text("이미 사용중인 이메일 입니다.");
						console.log('중복');
						emailcheck=1;
					}
					else{
						$("#email_check").text("사용 가능한 이메일 입니다.");
						console.log('가능');
						emailcheck=0;
					}
				}
			});
			
		});
		
		$('.form-btn').on('click',function(){
			event.preventDefault();
			if(emailcheck==0 && nck==0 && pwk==0 && ek==0) $('#sign-form').submit();			
		});
		
	       //이메일 입력창에 이벤트 설정
        document.querySelector("input[name=email]").addEventListener("input", function(){
       	 //이메일 확인 콘솔
       	 var email = $(".email_reg").val();
			console.log(email);
			 //이메일 체크 정규식
		    var email_regex = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}/i;
           if(!this.value || !email_regex.test(email)){
           	console.log('이메일조건불일치');
           	ek = 1;
           }
           else{
           	console.log('이메일조건일치');
				ek = 0;
           }

       }); 
	       
	});
	

//이름 길이확인
    window.onload = function(){
        //이름 입력창에 이벤트 설정
         document.querySelector("input[name=name]").addEventListener("input", function(){
        	 //이름 확인 콘솔
        	 var name = $("#name").val();
 			console.log(name);
            var regex = /[가-힣a-zA-Z]{2,8}/;
            if(!this.value || !regex.test(name)){
            	console.log('불가능');
            	nck = 1;
            }
            else{
            	console.log('가능');
				nck = 0;
            }

        }); 
        
        //비밀번호 입력창에 이벤트 설정
        document.querySelector("input[name=pw]").addEventListener("input", function(){
            var pw_regex = /^\w{6,15}$/;
          //비밀번호확인 콘솔
            var pw = $("#pw").val();
			console.log(pw);
	/*		
		//비밀번호 암호화	
			$(document).ready(function(){
					$("form").on("submit", function(){
					var pw_secret = $("input[name=pw]");
					pw_secret.val(SHA256(pw_secret.val()));
					
							});
			     		});*/
			
			if(!this.value || !pw_regex.test(pw)){
            	console.log('불가능');
            	nck = 1;
            }
            else{
            	console.log('가능');
				nck = 0;
            }
        });

        //비밀번호 확인 입력창에 이벤트 설정
        document.querySelector("input[name=pw_check]").addEventListener("input", function(){
            var pw = document.querySelector("input[name=pw]").value;
			//비밀번호확인 콘솔
            var pw_check = $("#pw_check").val();
			console.log(pw_check);
            //비밀번호 입력창 값을 불러와서 서로 비교
            if(!this.value || pw!=this.value){
            	pwk = 1;
            	$("#pwc").text("비밀번호가 다릅니다.");
				console.log('불일치');
            }
            else if(pw == this.value){
            	pwk = 0;
            	$("#pwc").text("비밀번호가 일치합니다.");
				console.log('일치');
            }
   
        });
        
     
	};
