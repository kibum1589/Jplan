//스페이스 방지 
function space_x() {
	document.querySelector(".row");
	if(event.keyCode == 32){
        
        //preventDefault(); 쓰면 이벤트 를 막겠다 라는 것이다. 
        event.preventDefault();
    }
}
	var nck; // 이름 확인 변수
	//이름 길이확인
 window.onload = function(){
	//$(document).ready(function(){
        //이름 입력창에 이벤트 설정
         document.querySelector("input[name=name]").addEventListener("input", function(){
        	 //이름 확인 콘솔
        	 var name = $(".name_edit").val();
 			console.log(name);
 			var regex = /[가-힣a-zA-Z]{2,8}$/;
            if(!this.value || !regex.test(name)){
            	console.log('불가능');
            	nck = 1;
            }
            else{
            	console.log('가능');
				nck = 0;
            }
         });
	  //}); 
        
         //비밀번호 입력창에 이벤트 설정
         document.querySelector("input[name=pw]").addEventListener("input", function(){
             var pw_regex = /^\w{6,15}$/;
           //비밀번호확인 콘솔
             var pw = $(".pw_edit").val();
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
         
         
	       $('.edit').on('click',function(){
			event.preventDefault();
			if(nck==0) $('.contact-form').submit();			
		});
};

/* 스타일을 위한 js */
$(document).ready(function(){

	//material contact form
	$('.contact-form').find('.form-control').each(function() {
	  var targetItem = $(this).parent();
	  if ($(this).val()) {
		$(targetItem).find('label').css({
		  'top': '10px',
		  'fontSize': '14px'
		});
	  }
	})
	$('.contact-form').find('.form-control').focus(function() {
	  $(this).parent('.input-block').addClass('focus');
	  $(this).parent().find('label').animate({
		'top': '10px',
		'fontSize': '14px'
	  }, 300);
	})
	$('.contact-form').find('.form-control').blur(function() {
	  if ($(this).val().length == 0) {
		$(this).parent('.input-block').removeClass('focus');
		$(this).parent().find('label').animate({
		  'top': '25px',
		  'fontSize': '18px'
		}, 300);
	  }
	})
});
	