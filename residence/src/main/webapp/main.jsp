<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살기 좋은 동네 추천</title>
<style>
.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	text-align: center;
	background: #fff;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.customoverlay .ico_toolbar {
	font: 12px/1.5 'Malgun Gothic', '돋움', dotum, sans-serif;
	letter-spacing: -1px;
	text-align: center;
	font-weight: 500;
	color: #1f8cff;
	background:
		url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_tooltip_190531.png)
		no-repeat;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	width: 24px;
	height: 24px;
	display: inline-block;
	background-position: -76px -138px;
	vertical-align: top;
}

.customoverlay .fav {
	background: #fff;
}

#bookmark_page_button_wrap {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	width: 250px;
	margin: 50px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: #28a745;
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 98vh;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 500px;
	margin: 30px 30px 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
	border: 1px solid green;
}

//
top 부분 수정
.bg_white {
	background: #fff;
}

.bg_green {
	background: #28a745;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList {
	height: 90vh;
	overflow: hidden;
	overflow-y: scroll;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 15px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

.markeroverlay {
	position: absolute;
	z-index: 10;
	bottom: 48px;
	left: -75px;
}

.markeroverlay_wrap {
	display: table;
	table-layout: auto;
	height: 50px;
	width: 150px;
	border-radius: 23px;
	border: 1px solid green;
	background: #fff;
	padding: 5px;
}

.markeroverlay_icon {
	display: table-cell;
	vertical-align: middle;
}

.apt_icon {
	background-image: url(image/home.png);
	overflow: hidden;
	overflow-x: hidden;
	overflow-y: hidden;
	display: inline-block;
	width: 32px;
	height: 32px;
	font-size: 0;
	color: transparent;
	vertical-align: top;
}

.markeroverlay_text {
	display: table-cell;
	vertical-align: middle;
	white-space: nowrap;
	padding: 0 9px 0 5px;
	overflow: hidden;
}

.main_text {
	font-size: 13px;
	letter-spacing: -.4px;
	font-weight: 600;
}

.sub_text {
	white-space: normal;
	max-width: 150px;
	overflow: hidden;
	height: 12px;
	font-size: 10px;
	color: #666;
	line-height: 12px;
	letter-spacing: -.27px;
}

.fav_button {
	margin: 2px;
	border: 1px;
}

.info_window {
	
}

.subwayLine
{
	padding-left: 18px;
	background: url(image/metro.jpg)
				no-repeat;
	background-size: 16px 16px;
}

.kaptdWtimebus
{
	padding-left: 18px;
	background: url(image/clock.png)
				no-repeat;
	background-size: 16px 16px;
}

.kaptdWtimesub
{
	padding-left: 18px;
	background: url(image/clock.png)
				no-repeat;
	background-size: 16px 16px;
}
.subwayStation
{
	padding-left: 18px;
	background: url(image/metro.jpg)
				no-repeat;
	background-size: 16px 16px;
}

.School
{
	padding-left: 18px;
	background: url(image/school.jpg)
				no-repeat;
	background-size: 16px 16px;
}
.welfareFacility
{
	padding-left: 18px;
	background: url(image/welfare.jpg)
				no-repeat;
	background-size: 16px 16px;

}

.convenientFacility
{
	padding-left: 18px;
	background: url(image/.png)
				no-repeat;
	background-size: 16px 16px;
}

.educationFacility
{
	padding-left: 18px;
	background: url(image/home.png)
				no-repeat;
	background-size: 16px 16px;
}

.office
{
	padding-left: 18px;
	background: url(image/office.jpg)
				no-repeat;
	background-size: 16px 16px;
}

.hospital
{
	padding-left: 18px;
	background: url(image/hospital.jpg)
				no-repeat;
	background-size: 16px 16px;
}

.park
{
	padding-left: 18px;
	background: url(image/park.jpg)
				no-repeat;
	background-size: 16px 16px;
}

.shoppingMall
{
	padding-left: 18px;
	background: url(image/shoppingMall.jpg)
				no-repeat;
	background-size: 16px 16px;
}
.etc
{
	padding-left: 18px;
	background: url(image/etc.jpg)
				no-repeat;
	background-size: 16px 16px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="RunPython(); return false;">
						<%
						String in_search_value = request.getParameter("search_value");
						%>
						키워드 : <input type="text" value="<%=in_search_value%>" id="keyword"
							size="15">
						<button type="submit">검색하기</button>
					</form>
					<span>
						<input type="button" onclick="ShowBookmarks();" value="북마크">
					</span>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=***REMOVED***&libraries=services"></script>
	<script>
// 현재 상태
// 0: 검색
// 1: 북마크
var currentState = 0;
// 마커를 담을 배열입니다
var markers = [];
var infoWindows = [];
var places = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다.
var map = new kakao.maps.Map(mapContainer, mapOption);	
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 디테일 창을 닫습니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {   
	markerOverlay.setVisible(false);
});

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infoWindow = new kakao.maps.InfoWindow({zIndex:1});
var markerOverlay = new kakao.maps.CustomOverlay({
    map: map,
    clickable: true,
    yAnchor: 0
});

var bounds = new kakao.maps.LatLngBounds(); 

var RunPython = function(keyword)
{
	keyword = document.getElementById('keyword').value;
	// 테스트 데이터
	var testJSON = '[{"bjdCode":4812725028,"kaptCode":"A63085232","kaptName":"마산삼계2","kaptAddr":"경상남도 창원마산회원구 내서읍 삼계리 39 마산삼계2","doroJuso":"경상남도 창원시 마산회원구 삼계2길 24","welfareFacility":"관리사무소, 노인정, 어린이놀이터, 자전거보관소","kaptdWtimebus":"5~10분이내","subwayLine":"2호선","subwayStation":"신정네거리역","kaptdWtimesub":null,"convenientFacility":"병원(청아병원) 대형상가(롯데마트) 공원(내서근린공원)","educationFacility":"초등학교(광려초등학교) 중학교(삼계중학교) 고등학교(내서여고)","lng":128.5032221,"lat":35.2290864},{"bjdCode":2647010200,"kaptCode":"A61108001","kaptName":"연산센트럴파크","kaptAddr":"부산광역시 연제구 연산동 958-6 연산센트럴파크","doroJuso":"부산광역시 연제구 고분로98번길 16","welfareFacility":"관리사무소, 노인정, 어린이놀이터, 자전거보관소","kaptdWtimebus":"10~15분이내","subwayLine":"1호선, 3호선","subwayStation":null,"kaptdWtimesub":"10~15분이내","convenientFacility":"관공서(부산소방본부/동래소방서) 병원(류마다병원) 대형상가(홈플러스) 공원(연산동 체육공원) 기타(연동시장)","educationFacility":"초등학교(연천초등학교,연일초등학교) 중학교(연산여자중학교) 고등학교(부산외국어고등학교) 대학교(부산경상대학)","lng":129.0935916,"lat":35.1843158},{"bjdCode":3120010600,"kaptCode":"A68380902","kaptName":"이화제일그린파크","kaptAddr":"울산광역시 북구 중산동 1166-18 이화제일그린파크","doroJuso":"울산광역시 북구 이화5길 63","welfareFacility":"관리사무소, 노인정, 어린이놀이터, 자전거보관소","kaptdWtimebus":"5분이내","subwayLine":null,"subwayStation":null,"kaptdWtimesub":null,"convenientFacility":null,"educationFacility":"초등학교(메아리농아학교) 중학교(이화중)","lng":129.338601,"lat":35.6657945}]';
	testJSON = JSON.parse(testJSON);

	console.log('검색, 키워드:');
	console.log(keyword);
	currentState = 0;
	// 마커 초기화
	RemoveMarker();
	// 목록 초기화
	RemoveList();
	
	for(var i=0; i<testJSON.length; i++)
	{
		places.push(testJSON[i]);
		AddMarker(testJSON[i], i);
		AddDetail(testJSON[i], i);
	}
}

function ShowBookmarks()
{
	console.log('북마크 보여주기');
	currentState = 1;
	// 마커 초기화
	RemoveMarker();
	// 목록 초기화
	RemoveList();
	// 오버레이 및 인포윈도우 닫기
	markerOverlay.setVisible(false);
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "GetBookmark.jsp");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	// 콜백함수
	xhr.onreadystatechange = function() 
	{
		if(xhr.readyState == XMLHttpRequest.DONE)
		{
			if(xhr.status == 200)
			{
				var data = xhr.responseText;
				result = JSON.parse(data);
				for(var i=0; i<result.length; i++)
				{
					places.push(result[i]);
					AddMarker(result[i], i);
					AddDetail(result[i], i);
				}
			}
		}
	}
	xhr.send(null);
}

function AddMarker(place, index)
{
	// 마커 생성
	var placePosition = new kakao.maps.LatLng(place.lat, place.lng);
    var marker = new kakao.maps.Marker({
        position: placePosition, // 마커의 위치
    });
    markers.push(marker);
    /*
    // 마커 이미지 설정
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, index*46+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
    marker.setImage(markerImage);
    */
    
    // 마커를 맵에 표시
    marker.setMap(map);
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(placePosition);
    
    map.setBounds(bounds);
    
    return marker;
}

function AddDetail(place, index)
{
	var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    listStr = '';
    var itemEl = GetListItem(place, index);
    var marker = markers[index];
    
    (function(place, marker, index) {
        kakao.maps.event.addListener(marker, 'mouseover', function() {
        	DisplayInfoWindow(place, marker);
        });

        kakao.maps.event.addListener(marker, 'mouseout', function() {
        	infoWindow.close();
        });

        kakao.maps.event.addListener(marker, 'click', function() {
        	console.log('마커 클릭');
        	DisplayMarkerOverlay(place, marker, index);
        	infoWindow.close();
			//displayDetailWindow(marker, title, address);
        });
        
        itemEl.onmouseover =  function () {
        	DisplayInfoWindow(place, marker);
        };

        itemEl.onmouseout =  function () {
        	infoWindow.close();
        };
        
        itemEl.onclick = function() {
        	console.log('목록 클릭');
        	DisplayMarkerOverlay(place, marker, index);
        	infoWindow.close();
        	//displayDetailWindow(marker, title, address);
        };
    })(place, marker, index);
    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    fragment.appendChild(itemEl);
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
}

//검색결과 항목을 Element로 반환하는 함수입니다
function GetListItem(place, index) 
{
	console.log(place);
	var el = document.createElement('li'),
	itemStr = '<div class="info">' +
	            '   <h2 style="font-size:1.5em">' + place.kaptName + '</h2>';
	 
	 
	// 학교
	var edu = new Map();
	var str = place.educationFacility;
	while(str != null && str.indexOf('(') != -1)
	{
		var start = str.indexOf('(');
		var end = str.indexOf(')');
		var name = str.substr(0, start);
		var found = str.substr(start+1, end-start-1);
		str = str.substr(end+2, str.length);
		edu.set(name, found);
	}
	
	// 편의시설 
	var convenient = new Map();
	var str = place.convenientFacility;
	while(str != null && str.indexOf('(') != -1)
	{
		var start = str.indexOf('(');
		var end = str.indexOf(')');
		var name = str.substr(0, start);
		var found = str.substr(start+1, end-start-1);
		str = str.substr(end+2, str.length);
		convenient.set(name, found);
	}

	// 복지시설 
	// 복지시설은 형식이 다름. 이 코드 삭제해도됨
	/*
	console.log('복지시설');
	var welfare  = new Map();
	var str = place.welfareFacility;
	while(str != null && str.indexOf('(') != -1)
	{
		var start = str.indexOf('(');
		var end = str.indexOf(')');
		var name = str.substr(0, start);
		var found = str.substr(start+1, end-start-1);
		str = str.substr(end+2, str.length);
		welfare[name] = found;
		console.log(name + ', ' + welfare[name]);
	}
	*/
	
	
	
	if(place.subwayLine != null)
		itemStr += '  <span class="subwayLine">' + place.subwayLine + '</span>';
	if(place.subwayStation != null)
		itemStr += '  <span class="subwayStation">' + place.subwayStation  + '</span>';
  	itemStr += '  <span class="kaptdWtimesub">' + place.kaptdWtimebus  + '</span>';
  	itemStr += '  <span class="welfareFacility">' + place.welfareFacility  + '</span>';
  	//itemStr += '  <span class="convenientFacility">' + place.convenientFacility  + '</span>';
  	
  	if(convenient.has('병원'))
  		itemStr += '  <span class="hospital">' + convenient.get('병원') + '</span>';
	if(convenient.has('공원'))
 		itemStr += '  <span class="park">' + convenient.get('공원') + '</span>';
	if(convenient.has('대형상가'))
  		itemStr += '  <span class="shoppingMall">' + convenient.get('대형상가') + '</span>';
	if(convenient.has('관공서'))
  		itemStr += '  <span class="office">' + convenient.get('관공서') + '</span>';
	if(convenient.has('기타'))
  		itemStr += '  <span class="etc">' + convenient.get('기타') + '</span>';
 		
 	  		
 	if(edu.has('초등학교'))
  		itemStr += '  <span class="elementry School">' + edu.get('초등학교') + '</span>';
	if(edu.has('중학교'))
		itemStr += '  <span class="middle School">' + edu.get('중학교') + '</span>';
	if(edu.has('고등학교'))
		itemStr += '  <span class="high School">' + edu.get('고등학교') + '</span>';
	if(edu.has('대학교'))
		itemStr += '  <span class="university School">' + edu.get('대학교') + '</span>';
	itemStr += '    <span>' + place.doroJuso + '</span>' +
    '   <span class="jibun gray">' +  place.kaptAddr + '</span>';
	             
	itemStr += '</div>';           
	
	el.innerHTML = itemStr;
	el.className = 'item';
	
	return el;
}


// InfoWindow: 마커 또는 목록을 마우스 오버했을때 나오는 작은 창
// InfoWindow를 지도 상에 표시한다.
function DisplayInfoWindow(place, marker) {
	var content = '<div style="display:block; text-align: center; font-weight: bold; padding:5px; z-index:1;">';
	content += place.kaptName;
	content += '</div>';

	infoWindow.setContent(content);
	
	// 이미 오버레이가 떠있으면 인포윈도우를 띄우지 않는다.
	if(markerOverlay.getVisible() && markerOverlay.getContent() != null)
	{
		if(markerOverlay.getContent().includes(place.kaptName))
			return;
	}
	infoWindow.open(map, marker);
}

// MarkerOverlay: 마커를 클릭했을 때 나오는 오버레이
// 오버레이를 지도 상에 표시한다.
function DisplayMarkerOverlay(place, marker, index)
{
	var placePosition = new kakao.maps.LatLng(place.lat, place.lng);
    var content = '<div class="markeroverlay">' + 
						'<div class="markeroverlay_wrap">' +
							'<div class="markeroverlay_icon">' +
								'<span class="apt_icon"></span>' +
							'</div>' +
							'<div class="markeroverlay_text">' +
								'<strong class="main_text">' +
									place.kaptName + 
								'</strong>' +
								//'<div class="sub_text">' +
								//	place.doroJuso + 
								//'</div>' +
								'<br>';

	// 학교
	var edu = new Map();
	var str = place.educationFacility;
	while(str != null && str.indexOf('(') != -1)
	{
		var start = str.indexOf('(');
		var end = str.indexOf(')');
		var name = str.substr(0, start);
		var found = str.substr(start+1, end-start-1);
		str = str.substr(end+2, str.length);
		edu.set(name, found);
	}
	
	// 편의시설 
	var convenient = new Map();
	var str = place.convenientFacility;
	while(str != null && str.indexOf('(') != -1)
	{
		var start = str.indexOf('(');
		var end = str.indexOf(')');
		var name = str.substr(0, start);
		var found = str.substr(start+1, end-start-1);
		str = str.substr(end+2, str.length);
		convenient.set(name, found);
	}
	console.log(edu);
	console.log(convenient);
	
	if(place.subwayLine != null)
		content += '  <span class="subwayLine"></span>';
  	content += '  <span class="welfareFacility"></span>';
  	
  	if(convenient.has('병원'))
  		content += '  <span class="hospital"></span>';
	if(convenient.has('공원'))
 		content += '  <span class="park"></span>';
	if(convenient.has('대형상가'))
		content += '  <span class="shoppingMall"></span>';
	if(convenient.has('관공서'))
		content += '  <span class="office"></span>';
 		
	if(edu.size > 0)
		content += '<span class="School" style="padding-right:2px"></span>';
	content += '<br>';
	content += '<input class="fav_button" type="button" value="북마크" onclick="OnClickBookmark('+index+')">' +
	'</div>' +
	'</div>' +
 	'</div>';
 				  
	markerOverlay.setContent(content);
	markerOverlay.setPosition(placePosition);
	markerOverlay.setVisible(true);
	markerOverlay.setMap(map);

	// 해당 장소가 북마크되어있으면 버튼의 글을 "북마크 제거"로 바꿈
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "CheckBookmark.jsp");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	// 콜백함수
	xhr.onreadystatechange = function() 
	{
		if(xhr.readyState == XMLHttpRequest.DONE)
		{
			if(xhr.status == 200)
			{
				var data = xhr.responseText;
				data = data.trim();
				if(data == 'true')
				{
					console.log('이미 북마크가 되어있음, 버튼을 "북마크 제거"로 변경');
					document.getElementsByClassName('fav_button')[0].value = '북마크 제거';
				}
				else if(data =='false')
				{
					console.log('북마크가 되어있지 않음, 버튼을 "북마크 추가"로 변경');
					document.getElementsByClassName('fav_button')[0].value = '북마크 추가';
				}
			}
		}
	}
	xhr.send(JSON.stringify(place));
}

// 북마크가 이미 되어있는지 확인하고
// 북마크가 되어있으면 북마크 취소(제거)
// 북마크가 안되어있으면 북마크 추가
function OnClickBookmark(index) {
	var place = places[index];
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "CheckBookmark.jsp");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	// 콜백함수
	xhr.onreadystatechange = function()
	{ 
		if(xhr.readyState == XMLHttpRequest.DONE)
		{
			if(xhr.status == 200)
			{
				// 요청완료
				var data = xhr.responseText;
				data = data.trim();

				// 북마크가 되어있으면 북마크제거
				if(data=='true')
				{
					console.log('북마크 제거');
					RemoveBookmark(index);
					document.getElementsByClassName('fav_button')[0].value = '북마크 추가';
				}
				// 북마크가 안되어있으면 북마크추가
				else if(data=='false')
				{
					console.log('북마크 추가');
					AddBookmark(index);
					document.getElementsByClassName('fav_button')[0].value = '북마크 제거';
				}
			}
			
		}
	}
	xhr.send(JSON.stringify(place));
}

// 북마크한다. (데이터베이스에 추가한다.)
function AddBookmark(index) {
	var place = places[index];
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "AddBookmark.jsp");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	// 콜백함수
	xhr.onreadystatechange = function()
	{
		if(xhr.readyState == XMLHttpRequest.DONE)
		{
			if(xhr.status == 200)
			{
				//
				console.log('북마크 추가 완료');
			}
		}
	}
	xhr.send(JSON.stringify(place));
}

// 북마크를 제거한다. (데이터베이스에서 제거)
function RemoveBookmark(index)
{
	var place = places[index];
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "RemoveBookmark.jsp");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	// 콜백함수
	xhr.onreadystatechange = function()
	{ 
		if(xhr.readyState == 4)
		{
			if(xhr.status == 200)
			{
				console.log('북마크 제거 완료');
				
				if(currentState == 1)
				{
					// 북마크 다시 보여주기
					ShowBookmarks();
				}
				
			}
		}
	}
	xhr.send(JSON.stringify(place));
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function RemoveMarker() 
{
	for(var i = 0; i<markers.length; i++) 
	{
	    markers[i].setMap(null);
	}   
	markers = [];
}

//검색결과 목록의 자식 Element를 제거하는 함수입니다
function RemoveList() 
{   
	var el = document.getElementById('placesList');
	while (el.hasChildNodes()) 
	{
	    el.removeChild (el.lastChild);
	}
}

/*
var RunPython = function(keyword)
{
	// keyword는 행정구역(ex: 개신동)
	// keyword로 파이썬 파일 실행
	
	// 반환받은 주소배열
	var places = [
		"서울 송파구 송파대로 30길 39", 
		"서울 송파구 올림픽로 240",
		"서울 동작구 양녕로30길 19-4",
		"서울 마포구 성미산로19길 11",
		"서울 용산구 이태원로20가길 7-2",
		"서울 용산구 이태원동 2-5",
		"서울 용산구 이태원로27가길 26",
		"서울 용산구 회나무로 49",
		"서울 용산구 이태원로26길 16-8",
		"서울 용산구 이태원로 189",
		"서울 용산구 이태원로 187",
		"서울 용산구 이태원로14길 21",
		"서울 용산구 이태원로20가길 7-5",
		"서울 용산구 보광로 117",
		"서울 용산구 이태원로 192",
		"서울 용산구 이태원로 164-1",
		"서울 용산구 녹사평대로40길 46",
		"서울 용산구 이태원로 192",
		"서울 용산구 소월로38가길 5",
	];
	
	removeMarker();
	// 지도에 마커를 찍으려면 좌표 데이터가 필요.
	// 우리는 주소 데이터만 있었으므로
	// 주소 배열을 좌표 배열로 변환
	// 
	var geocoder = new kakao.maps.services.Geocoder(); // 카카오 api 좌표 변환 객체
	for(var i=0; i<places.length; i++)
	{
		// 주소를 좌표로 변환(작업이 완료되면 addressSearchCompleted 실행됨)
		geocoder.addressSearch(places[i], addressSearchCompleted);
	}
}

function addressSearchCompleted(result, status)
{
	if(status == kakao.maps.services.Status.OK)
	{
		// 주소를 좌표로 변환 성공
		// 결과값 좌표로 마커 생성
		var marker = addMarker(result[0]);
		// 
		addInfoWindows(result[0], marker);
	}
}

function addMarker(address)
{
	// 마커 생성
	var placePosition = new kakao.maps.LatLng(address.y, address.x);
    var marker = new kakao.maps.Marker({
        position: placePosition, // 마커의 위치
    });
    markers.push(marker);
    // 마커 이미지 설정
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, (markers.length-1)*46+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
    marker.setImage(markerImage);
    // 마커를 맵에 표시
    marker.setMap(map);
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(placePosition);
    
    map.setBounds(bounds);
    
    return marker;
}

function addInfoWindows(address, marker)
{
	var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    listStr = '';
    var itemEl = getListItem(markers.length-1, address);
    
    (function(marker, title) {
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            displayInfowindow(marker, address);
        });

        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });

        kakao.maps.event.addListener(marker, 'click', function() {
        	console.log('마커 클릭');
			displayDetailWindow(marker, title, address);
        });
        
        itemEl.onmouseover =  function () {
            displayInfowindow(marker, address);
        };

        itemEl.onmouseout =  function () {
            infowindow.close();
        };
        
        itemEl.onclick = function() {
        	console.log('목록 클릭');
        	displayDetailWindow(marker, title, address);
        };
    })(marker, address.road_address.building_name);
    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    fragment.appendChild(itemEl);
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, address) {
	var el = document.createElement('li'),
	itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	            '<div class="info">' +
	            '   <h5>' + address.road_address.building_name + '</h5>';
	
	itemStr += '    <span>' + address.address_name + '</span>' +
	                '   <span class="jibun gray">' +  address.address.address_name  + '</span>';
	             
	itemStr += '  <span class="tel">' + address.phone  + '</span>' +
	            '</div>';           
	
	el.innerHTML = itemStr;
	el.className = 'item';
	
	return el;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for ( var i = 0; i < markers.length; i++ ) {
	    markers[i].setMap(null);
	}   
	markers = [];
}

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, address) {
 	var content = '<div style="padding:5px;z-index:1;">';
 	if(address.road_address.building_name != "")
 		content += address.road_address.building_name;
 	else
 		content += address.address_name;
 	content += '</div>';

 	infowindow.setContent(content);
 	// 이미 디테일 윈도우가 떠있으면 인포윈도우를 띄우지 않는다.
	if(detailwindow.getVisible() && detailwindow.getContent() != null)
	{
		//console.log(detailwindow.getContent());
		//console.log(address);
		if(detailwindow.getContent().includes(address.address_name))
			return;
	}
 	infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
 while (el.hasChildNodes()) {
     el.removeChild (el.lastChild);
 }
}

function displayDetailWindow(marker, title, address) {
	console.log(title);
	console.log(address);
	var content = 
		'<form action="AddBookmark.jsp" id="bookmark" method="get">' +
		'<div class="customoverlay">' +
    '    <span class="title">'+ 
  	'	 <input type="hidden" id="bookmarkAddress" name="address" value="'+address.address_name+'">';
  	if(address.road_address.building_name == "")
  		content +='	 <input type="hidden" id="bookmarkTitle" name="title" value="'+address.address_name+'">' + address.address_name;
  	else
  		content +='	 <input type="hidden" id="bookmarkTitle" name="title" value='+title+'>'+ title;
    content +='	 <input type="hidden" id="bookmarkCoordX" name="coordX" value='+address.x+'>'+
    '	 <input type="hidden" id="bookmarkCoordY" name="coordY" value='+address.y+'>'+
    '	 </input>' +
    '	 <span class="fav"><span class="ico_toolbar" onclick="onClickBookmark()">즐겨찾기</span></span>' +
    '    </span>' +
    '	 </div>' +
    '</form>';
	detailwindow.setContent(content);
	var latlng = new kakao.maps.LatLng(address.y, address.x);
	detailwindow.setPosition(latlng);
	detailwindow.setVisible(true);
	// detailwindow.open(map, marker);
	
	// 북마크가 이미 되어있는지 확인 (버튼 색깔 교체)
	var address = document.getElementById('bookmarkAddress').value;
	var title = document.getElementById('bookmarkTitle').value;
	var xhr = new XMLHttpRequest();
	var req = "CheckBookmark.jsp?address="+address+"&title="+title;
	xhr.open("get", req, true)
	// 콜백함수
	xhr.onreadystatechange = function()
	{ 
		if(xhr.readyState == 4)
		{
			if(xhr.status == 200)
			{
				var data = xhr.responseText;
				data = data.trim();
				if(data=='true')
				{
					// 이미 북마크되어있을 경우
					// 북마크 버튼 파란색으로.	
					document.getElementsByClassName('ico_toolbar')[0].style.backgroundPosition ="-76px -162px"
				}
				else if(data=='false')
				{
					// 북마크안되어있을 경우
					// 북마크 버튼 흰색으로.
					document.getElementsByClassName('ico_toolbar')[0].style.backgroundPosition ="-76px -138px"
				}
				
				
			}
		}
	}
	xhr.send(null);
	
	infowindow.close();
}

function onClickBookmark() {
	// 북마크가 이미 되어있는지 확인
	// 북마크가 되어있으면 북마크 취소
	// 북마크가 안되어있으면 북마크
	
	// 북마크가 이미 되어있는지 확인
	var address = document.getElementById('bookmarkAddress').value;
	var title = document.getElementById('bookmarkTitle').value;
	var xhr = new XMLHttpRequest();
	var req = "CheckBookmark.jsp?address="+address+"&title="+title;
	xhr.open("get", req, true)
	// 콜백함수
	xhr.onreadystatechange = function()
	{ 
		if(xhr.readyState == XMLHttpRequest.DONE)
		{
			if(xhr.status == 200)
			{
				// 요청완료
				var data = xhr.responseText;
				data = data.trim();
				console.log(data);

				// 북마크가 되어있으면 북마크 취소
				if(data=='true')
				{
					console.log('북마크 제거');
					removeBookmark();
					document.getElementsByClassName('ico_toolbar')[0].style.backgroundPosition ="-76px -138px"	
				}
				// 북마크가 안되어있으면 북마크
				else if(data=='false')
				{
					console.log('북마크 추가');
					addBookmark();
					document.getElementsByClassName('ico_toolbar')[0].style.backgroundPosition ="-76px -162px"
				}
			}
			
		}
	}
	xhr.send(null);
}


function addBookmark() {
	// 북마크한다. (데이터베이스에 추가한다.)
	var address = document.getElementById('bookmarkAddress').value;
	var title = document.getElementById('bookmarkTitle').value;
	var coordX = document.getElementById('bookmarkCoordX').value;
	var coordY = document.getElementById('bookmarkCoordY').value;
	
	var xhr = new XMLHttpRequest();
	var req = "AddBookmark.jsp?"
			+ "address="+ address
			+"&title=" + title
			+"&coordX=" + coordX
			+"&coordY=" + coordY;
	xhr.open("get", req, true);
	console.log(req);
	// 콜백함수
	xhr.onreadystatechange = function()
	{ 
		if(xhr.readyState == 4)
		{
			if(xhr.status == 200)
			{
				
			}
		}
	}
	xhr.send(null);
}

function removeBookmark()
{
	// 북마크를 제거한다. (데이터베이스에서 제거)
	var address = document.getElementById('bookmarkAddress').value;
	var title = document.getElementById('bookmarkTitle').value;
	
	var xhr = new XMLHttpRequest();
	var req = "RemoveBookmark.jsp?address="+address+"&title="+title;
	xhr.open("get", req, true);
	console.log(req);
	// 콜백함수
	xhr.onreadystatechange = function()
	{ 
		if(xhr.readyState == 4)
		{
			if(xhr.status == 200)
			{
				
			}
		}
	}
	xhr.send(null);
}
*/
</script>
	<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	if (session == null || !request.isRequestedSessionIdValid()) {
		System.out.println("세션이 무효화 상태입니다.");
	%>
	<script>
    	alert('먼저 로그인해주세요!');
		window.location.href = '/lastgr/start.jsp';
    </script>
	<%
	} else {
	String uid = (String) session.getAttribute("G_uid");
	if (uid == null) {
		System.out.println("세션이 무효화 상태입니다.");
	%>
	<script>
	    	alert('먼저 로그인해주세요!');
			window.location.href = '/lastgr/start.jsp';
	    </script>
	<%
	} else {
	%>
	<script>
			RunPython('<%=in_search_value%>');
	</script>
	<%
	}
	}
	%>
</body>
</html>