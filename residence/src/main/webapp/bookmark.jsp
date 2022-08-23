<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>살기 좋은 동네 북마크</title>
    <style>
      .map_wrap,
      .map_wrap * {
        margin: 0;
        padding: 0;
        font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
        font-size: 12px;
      }
      .map_wrap a,
      .map_wrap a:hover,
      .map_wrap a:active {
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
        bottom: 0;
        width: 250px;
        margin: 10px 0 30px 10px;
        padding: 5px;
        overflow-y: auto;
        background: rgba(255, 255, 255, 0.7);
        z-index: 1;
        font-size: 12px;
        border-radius: 10px;
      }
      .bg_white {
        background: #fff;
      }
      #menu_wrap hr {
        display: block;
        height: 1px;
        border: 0;
        border-top: 2px solid #5f5f5f;
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
      #placesList .item h5,
      #placesList .item .info {
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }
      #placesList .item .info {
        padding: 10px 0 10px 55px;
      }
      #placesList .info .gray {
        color: #8a8a8a;
      }
      #placesList .info .jibun {
        padding-left: 26px;
        background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
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
        background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
          no-repeat;
      }
      #placesList .item .marker_1 {
        background-position: 0 -10px;
      }
      #placesList .item .marker_2 {
        background-position: 0 -56px;
      }
      #placesList .item .marker_3 {
        background-position: 0 -102px;
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
    </style>
  </head>
  <body>
    <div class="map_wrap">
      <div
        id="map"
        style="width: 100%; height: 100%; position: relative; overflow: hidden"
      ></div>

      <div id="menu_wrap" class="bg_white">
        <div class="option">
          <div>
            <form onsubmit="searchPlaces(); return false;">
              키워드 :
              <input type="text" value="이태원 맛집" id="keyword" size="15" />
              <button type="submit">검색하기</button>
            </form>
          </div>
        </div>
        <hr />
        <ul id="placesList"></ul>
        <div id="pagination"></div>
      </div>
    </div>

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=apikey here&libraries=services"
    ></script>
    <script>
      // 마커를 담을 배열입니다
      var markers = [];

      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };

      // 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

      var bounds = new kakao.maps.LatLngBounds();

      GetBookmark();

      function GetBookmark() {
        var xhr = new XMLHttpRequest();
        var req = "GetBookmark.jsp";
        xhr.open("get", req, true);
        // 콜백함수
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            if (xhr.status == 200) {
              var data = xhr.responseText;
              data = JSON.parse(data);
              console.log(data);
              console.log(data.userid);
              console.log(data.address);
              console.log(data.aname);
              marker = addMarker(data);
              addInfoWindows(data, marker);
            }
          }
        };
        xhr.send(null);
      }

      function addMarker(data) {
        // 마커 생성
        var placePosition = new kakao.maps.LatLng(data.coordY, data.coordX);
        var marker = new kakao.maps.Marker({
          position: placePosition, // 마커의 위치
        });
        markers.push(marker);
        // 마커 이미지 설정
        var imageSrc =
            "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
          imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
          imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin: new kakao.maps.Point(
              0,
              (markers.length - 1) * 46 + 10
            ), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
          },
          markerImage = new kakao.maps.MarkerImage(
            imageSrc,
            imageSize,
            imgOptions
          );
        marker.setImage(markerImage);
        // 마커를 맵에 표시
        marker.setMap(map);
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        map.setBounds(bounds);

        return marker;
      }

      function addInfoWindows(data, marker) {
        var listEl = document.getElementById("placesList"),
          menuEl = document.getElementById("menu_wrap"),
          fragment = document.createDocumentFragment(),
          listStr = "";
        var itemEl = getListItem(markers.length - 1, data);

        (function (marker, title) {
          kakao.maps.event.addListener(marker, "mouseover", function () {
            displayInfowindow(marker, data);
          });

          kakao.maps.event.addListener(marker, "mouseout", function () {
            infowindow.close();
          });

          kakao.maps.event.addListener(marker, "click", function () {
            console.log("마커 클릭");
            displayDetailWindow(marker, title, data);
          });

          itemEl.onmouseover = function () {
            displayInfowindow(marker, data);
          };

          itemEl.onmouseout = function () {
            infowindow.close();
          };

          itemEl.onclick = function () {
            console.log("목록 클릭");
            displayDetailWindow(marker, title, address);
          };
        })(marker, data.aname);
        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        fragment.appendChild(itemEl);
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
      }

      //검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, data) {
        console.log(data);
        var el = document.createElement("li"),
          itemStr =
            '<span class="markerbg marker_' +
            (index + 1) +
            '"></span>' +
            '<div class="info">' +
            "   <h5>" +
            data.aname +
            "</h5>";

        itemStr +=
          "    <span>" +
          data.address +
          "</span>" +
          '   <span class="jibun gray">' +
          data.address +
          "</span>";

        //itemStr += '  <span class="tel">' + address.phone  + '</span>' + '</div>';

        el.innerHTML = itemStr;
        el.className = "item";

        return el;
      }

      //검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      //인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, data) {
        var content = '<div style="padding:5px;z-index:1;">';
        if (address.road_address.building_name != "")
          content += address.road_address.building_name;
        else content += address.address_name;
        content += "</div>";

        infowindow.setContent(content);
        // 이미 디테일 윈도우가 떠있으면 인포윈도우를 띄우지 않는다.
        if (detailwindow.getVisible() && detailwindow.getContent() != null) {
          if (detailwindow.getContent().includes(address)) return;
        }
        infowindow.open(map, marker);
      }
    </script>
  </body>
</html>
