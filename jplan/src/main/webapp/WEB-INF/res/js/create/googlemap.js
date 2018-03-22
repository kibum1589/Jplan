
//맵 변수 선언
var map;
var service;
// 맵에 표시하기위한 param 으로 쓰일 함수
function initMap(inputText) {
  var korea = {lat:35.907757, lng:127.76692200000002};

  map = new google.maps.Map(document.getElementById('map'), {
    center: korea,
    zoom: 7
  });
    
  if(inputText){
  	 var queryText = inputText
       // 장소 검색 서비스 선언
       service = new google.maps.places.PlacesService(map);
       service.textSearch({
         
         location: korea,
         radius: 50000,
           
         // 타입을 뭐로해야하지..
//         type: ['store'],
   
         // 검색어 전달
         query: queryText
       }, processResults);
  }
 
}

// 장소 검색 서비스에 쓰일 콜백 함수 선언
function processResults(results, status) {
  if (status !== google.maps.places.PlacesServiceStatus.OK) {
    return;
  } else {
  	
    // 마커 표시(넘어오는 results 그대로 넘겨주면 다수의 마커 생성)
  	createMarkers(results);
   	
  }
}

  
  // 마커 표시 함수 선언
function createMarkers(places) {
  var bounds = new google.maps.LatLngBounds();
  // place 목록 붙여줄 공간 할당
  var placesList = document.getElementById('sortable2');

    // place 목록 붙이기
  for (var i = 0, place; place = places[i]; i++) {
      
      
    // 마커의 종합적인 설정
    var photos = place.photos;
    var marker = new google.maps.Marker({
        // 표시할 맵
      map: map,
        // 표시할 마커 아이콘 설정
      icon: photos[0].getUrl({'maxWidth': 35, 'maxHeight': 35}),
        // 마커에 마우스 올려놓으면 나오는 글자 설정
      title: place.name,
        // 마커의 위치 설정
      position: place.geometry.location,
        // 애니메이션
      animation: google.maps.Animation.DROP
    });
    console.log(place.formatted_address)
      // place 목록에 html형식으로 장소이름 찍어주기
    placesList.innerHTML += 
  	  
  	  '<a class="list-group-item" data-place='+place.place_id+'>'+
  	  '<h4 class="list-group-item-heading">'+place.name+'</h4>'+
  	  '<p class="list-group-item-text">'+place.formatted_address+'</p></a>';
        
      
      // 지도 표시 범위
    bounds.extend(place.geometry.location);
    
  }
    // 정한 범위를 지도 범위에 전달
  map.panToBounds(bounds);
}