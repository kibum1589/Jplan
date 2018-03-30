var nck;//확인 변수
var pwk; // 비밀번호 확인 변수
window.onload = function(){
//비밀번호 입력창에 이벤트 설정
document.querySelector("input[name=pw]").addEventListener("input", function(){
    var pw_regex = /^\w{6,15}$/;
  //비밀번호확인 콘솔
    var pw = $(".pw_delete").val();
	console.log(pw);
/*		
//비밀번호 암호화	
	$(document).ready(function(){
			$("form").on("submit", function(){
			var pw_secret = $("input[name=pw]");
			pw_secret.val(SHA256(pw_secret.val()));
			
					});
	     		});*/
/* 	 $.ajax({
		url:"signcheck",
		type:"post",
		//ajax 요청을 보내면서 데이터를 첨부
		data:{
		pw:pw
		},
		dataType:"text",
		success:function(result){ */
	if(!this.value || !pw_regex.test(pw)){
		$("#pw_check").text("비밀번호가 틀렸습니다.");
    	console.log('불가능');
    	nck = 1;
    }
    else{
    	$("#pw_check").text("비밀번호 가 맞습니다.");
    	console.log('가능');
		nck = 0;
    	}
//	}
});


  $('.delete').on('click',function(){
	//event.preventDefault();
	if(nck==0) $('.member_delete').submit();			
		});
//	});
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