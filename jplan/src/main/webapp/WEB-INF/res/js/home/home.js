
$(document).ready(function(){
        
        //class="swiper-container"에 swiper 적용
        //var slider = new Swiper("선택자", {옵션});
        var slider = new Swiper(".swiper-container",{
            //적용시킬 옵션들
            
            nextButton:".swiper-button-next",//다음버튼
            prevButton:".swiper-button-prev",//이전버튼
            
            loop:true,//시작지점과 끝지점을 이어지도록 처리
            
            grabCursor:true,//손가락 모양의 커서로 변경
            
            pagination:".swiper-pagination",//페이지 위치 표시
            paginationClickable:true,//위치를 클릭으로 이동할 수 있도록 설정
            
            autoplay:2000,//자동재생(밀리초) 설정
            
        });
        
    });
