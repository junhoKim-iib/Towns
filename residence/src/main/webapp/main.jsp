<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="application/javascript" src="js/bjd.js"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta
      name="author"
      content="Mark Otto, Jacob Thornton, and Bootstrap contributors"
    />
    <meta name="generator" content="Hugo 0.104.2" />
    <link
      rel="canonical"
      href="https://getbootstrap.com/docs/5.2/examples/sidebars/"
    />

    <title>살기 좋은 동네 추천</title>
    <style>
      @font-face {
        font-family: "Cafe24Ssurround";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
      body {
        font-family: "Cafe24Ssurround";
      }
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, 0.1);
        border: solid rgba(0, 0, 0, 0.15);
        border-width: 1px 0;
        box-shadow: inset 0 0.5em 1.5em rgba(0, 0, 0, 0.1),
          inset 0 0.125em 0.5em rgba(0, 0, 0, 0.15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -0.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
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
        content: "";
        position: absolute;
        margin-left: -12px;
        left: 50%;
        bottom: -12px;
        width: 22px;
        height: 12px;
        background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
      }

      .customoverlay .ico_toolbar {
        font: 12px/1.5 "Malgun Gothic", "돋움", dotum, sans-serif;
        letter-spacing: -1px;
        text-align: center;
        font-weight: 500;
        color: #1f8cff;
        background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_tooltip_190531.png)
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
        top: 0;
        left: 0;
        width: 500px;
        padding: 5px;
        overflow-y: auto;
        background: rgba(255, 255, 255);
        z-index: 1;
        font-size: 12px;
      }

      //
      top 부분 수정 .bg_white {
        background: #fff;
      }

      .bg_green {
        background: #28a745;
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

      #placesList .item h5,
      #placesList .item .info {
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
        letter-spacing: -0.4px;
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
        letter-spacing: -0.27px;
      }

      .fav_button {
        margin: 2px;
        border: 1px;
      }

      .info_window {
      }

      .subwayLine {
        padding-left: 18px;
        background: url(image/metro.jpg) no-repeat;
        background-size: 16px 16px;
      }

      .kaptdWtimebus {
        padding-left: 18px;
        background: url(image/clock.png) no-repeat;
        background-size: 16px 16px;
      }

      .kaptdWtimesub {
        padding-left: 18px;
        background: url(image/clock.png) no-repeat;
        background-size: 16px 16px;
      }
      .subwayStation {
        padding-left: 18px;
        background: url(image/metro.jpg) no-repeat;
        background-size: 16px 16px;
      }

      .School {
        padding-left: 18px;
        background: url(image/school.jpg) no-repeat;
        background-size: 16px 16px;
      }
      .welfareFacility {
        padding-left: 18px;
        background: url(image/welfare.jpg) no-repeat;
        background-size: 16px 16px;
      }

      .convenientFacility {
        padding-left: 18px;
        background: url(image/.png) no-repeat;
        background-size: 16px 16px;
      }

      .educationFacility {
        padding-left: 18px;
        background: url(image/home.png) no-repeat;
        background-size: 16px 16px;
      }

      .office {
        padding-left: 18px;
        background: url(image/office.jpg) no-repeat;
        background-size: 16px 16px;
      }

      .hospital {
        padding-left: 18px;
        background: url(image/hospital.jpg) no-repeat;
        background-size: 16px 16px;
      }

      .park {
        padding-left: 18px;
        background: url(image/park.jpg) no-repeat;
        background-size: 16px 16px;
      }

      .shoppingMall {
        padding-left: 18px;
        background: url(image/shoppingMall.jpg) no-repeat;
        background-size: 16px 16px;
      }
      .etc {
        padding-left: 18px;
        background: url(image/etc.jpg) no-repeat;
        background-size: 16px 16px;
      }

      *.hidden {
        display: none !important;
      }

      div.loading {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(16, 16, 16, 0.5);
      }

      @-webkit-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @-webkit-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @-moz-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @-ms-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @-moz-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @-webkit-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @-o-keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @keyframes uil-ring-anim {
        0% {
          -ms-transform: rotate(0deg);
          -moz-transform: rotate(0deg);
          -webkit-transform: rotate(0deg);
          -o-transform: rotate(0deg);
          transform: rotate(0deg);
        }
        100% {
          -ms-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -webkit-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      .uil-ring-css {
        margin: auto;
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        width: 200px;
        height: 200px;
      }
      .uil-ring-css > div {
        position: absolute;
        display: block;
        width: 160px;
        height: 160px;
        top: 20px;
        left: 20px;
        border-radius: 80px;
        box-shadow: 0 6px 0 0 #ffffff;
        -ms-animation: uil-ring-anim 1s linear infinite;
        -moz-animation: uil-ring-anim 1s linear infinite;
        -webkit-animation: uil-ring-anim 1s linear infinite;
        -o-animation: uil-ring-anim 1s linear infinite;
        animation: uil-ring-anim 1s linear infinite;
      }
    </style>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <!-- Custom styles for this template -->
    <link href="css/sidebars.css" rel="stylesheet" />
    <script type="application/javascript" src="js/hangjungdong.js"></script>
    <script
      src="https://code.jquery.com/jquery-latest.min.js"
      type="application/javascript"
    ></script>
  </head>
  <body>
    <div class="loading" style="z-index: 3">
      <div class="uil-ring-css" style="transform: scale(0.79)">
        <div></div>
      </div>
    </div>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none">
      <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path
          fill-rule="evenodd"
          clip-rule="evenodd"
          d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"
        ></path>
      </symbol>
      <symbol id="home" viewBox="0 0 16 16">
        <path
          d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"
        />
      </symbol>
      <symbol id="speedometer2" viewBox="0 0 16 16">
        <path
          d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"
        />
        <path
          fill-rule="evenodd"
          d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"
        />
      </symbol>
      <symbol id="table" viewBox="0 0 16 16">
        <path
          d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"
        />
      </symbol>
      <symbol id="people-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
        <path
          fill-rule="evenodd"
          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"
        />
      </symbol>
      <symbol id="grid" viewBox="0 0 16 16">
        <path
          d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"
        />
      </symbol>
      <symbol id="collection" viewBox="0 0 16 16">
        <path
          d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"
        />
      </symbol>
      <symbol id="calendar3" viewBox="0 0 16 16">
        <path
          d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"
        />
        <path
          d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"
        />
      </symbol>
      <symbol id="chat-quote-fill" viewBox="0 0 16 16">
        <path
          d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM7.194 6.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 6C4.776 6 4 6.746 4 7.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 9.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 6c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z"
        />
      </symbol>
      <symbol id="cpu-fill" viewBox="0 0 16 16">
        <path
          d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"
        />
        <path
          d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z"
        />
      </symbol>
      <symbol id="gear-fill" viewBox="0 0 16 16">
        <path
          d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"
        />
      </symbol>
      <symbol id="speedometer" viewBox="0 0 16 16">
        <path
          d="M8 2a.5.5 0 0 1 .5.5V4a.5.5 0 0 1-1 0V2.5A.5.5 0 0 1 8 2zM3.732 3.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 8a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 7.31A.91.91 0 1 0 8.85 8.569l3.434-4.297a.389.389 0 0 0-.029-.518z"
        />
        <path
          fill-rule="evenodd"
          d="M6.664 15.889A8 8 0 1 1 9.336.11a8 8 0 0 1-2.672 15.78zm-4.665-4.283A11.945 11.945 0 0 1 8 10c2.186 0 4.236.585 6.001 1.606a7 7 0 1 0-12.002 0z"
        />
      </symbol>
      <symbol id="toggles2" viewBox="0 0 16 16">
        <path
          d="M9.465 10H12a2 2 0 1 1 0 4H9.465c.34-.588.535-1.271.535-2 0-.729-.195-1.412-.535-2z"
        />
        <path
          d="M6 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm0 1a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm.535-10a3.975 3.975 0 0 1-.409-1H4a1 1 0 0 1 0-2h2.126c.091-.355.23-.69.41-1H4a2 2 0 1 0 0 4h2.535z"
        />
        <path d="M14 4a4 4 0 1 1-8 0 4 4 0 0 1 8 0z" />
      </symbol>
      <symbol id="tools" viewBox="0 0 16 16">
        <path
          d="M1 0L0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z"
        />
      </symbol>
      <symbol id="chevron-right" viewBox="0 0 16 16">
        <path
          fill-rule="evenodd"
          d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
        />
      </symbol>
      <symbol id="geo-fill" viewBox="0 0 16 16">
        <path
          fill-rule="evenodd"
          d="M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z"
        />
      </symbol>
    </svg>
    <div
      id="map"
      style="
        width: 100%;
        height: 100%;
        z-index: 1;
        position: absolute;
        overflow: hidden;
      "
    ></div>

    <main class="d-flex flex-nowrap">
      <h1 class="visually-hidden">Sidebars examples</h1>
      <!-- left bar -->
      <div
        class="d-flex flex-column flex-shrink-0 bg-light"
        style="position: relative; width: 4.5rem; z-index: 2"
      >
        <a
          href="start.jsp"
          class="d-block p-3 link-success text-decoration-none"
          data-bs-toggle="tooltip"
          data-bs-placement="right"
          aria-label="Home"
          data-bs-original-title="Home"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="40"
            height="32"
            fill="currentColor"
            class="bi bi-house-door-fill"
            viewBox="0 0 16 16"
          >
            <path
              d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"
            />
          </svg>
          <span class="visually-hidden">Icon-only</span>
        </a>
        <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
          <li>
            <a
              href="#"
              onclick="ShowPlaces();"
              class="nav-link active py-3 border-bottom rounded-0"
              data-bs-toggle="tooltip"
              data-bs-placement="right"
              aria-label="Map"
              data-bs-original-title="Map"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="currentColor"
                class="bi bi-map"
                viewBox="0 0 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"
                />
              </svg>
            </a>
          </li>
          <li>
            <a
              href="#"
              onclick="ShowBookmarks();"
              class="nav-link py-3 border-bottom rounded-0"
              data-bs-toggle="tooltip"
              data-bs-placement="right"
              aria-label="Favorite"
              data-bs-original-title="Favorite"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="currentColor"
                class="bi bi-star"
                viewBox="0 0 16 16"
              >
                <path
                  d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"
                />
              </svg>
            </a>
          </li>
          <li>
            <a
              href="mem_update.jsp"
              class="nav-link py-3 border-bottom rounded-0"
              data-bs-toggle="tooltip"
              data-bs-placement="right"
              aria-label="Profile"
              data-bs-original-title="Profile"
            >
              <svg
                class="bi pe-none"
                width="24"
                height="24"
                role="img"
                aria-label="Customers"
              >
                <use xlink:href="#people-circle"></use>
              </svg>
            </a>
          </li>
        </ul>
        <!--  
        <div class="dropdown border-top">
          <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="24" height="24" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small shadow">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div>
        -->
      </div>
      <div id="menu_wrap" class="bg_white">
        <form onsubmit="Search(); return false;">
          <div class="input-group mb-3">
            <div></div>
            <% //System.out.println(request.getParameter("search_value"));
            String in_search_value = request.getParameter("search_value"); %>
            <select name="sido" id="sido">
              <option value="">선택</option>
            </select>
            <select name="sigugun" id="sigugun">
              <option value="">선택</option>
            </select>
            <select name="dong" id="dong">
              <option value="">선택</option>
            </select>
            <input type="submit" class="btn btn-outline-success" value="검색" />
            <!-- 
                <input type="text" value="<%=in_search_value%>" id="keyword" name="locationName" class="form-control" placeholder="지역 검색" aria-label="Recipient's username" aria-describedby="button-addon2">

                <input type="submit" class="btn btn-outline-success" value="검색">
                 -->
            <!-- <button
                  class="btn btn-outline-secondary"
                  type="button"
                  id="button-addon2"
                >
                  검색
                </button> -->
          </div>
        </form>
        <hr />
        <ul style="padding-left: 0px" id="placesList"></ul>
        <div id="pagination"></div>
      </div>
    </main>

    <script type="application/javascript" src="js/hangjungdong.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/sidebars.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=api key here&libraries=services"
    ></script>

    <script>
      var sd = '<%=request.getParameter("sido")%>';
      var sgg = '<%=request.getParameter("sigugun")%>';
      var dg = '<%=request.getParameter("dong")%>';

      console.log(sd);
      console.log(sgg);
      console.log(dg);

      var age = '<%=(int)session.getAttribute("G_birth")%>';
      var wos = '<%=(int)session.getAttribute("G_wos")%>';
      var par = '<%=(int)session.getAttribute("G_par")%>';
      var ch = '<%=(int)session.getAttribute("G_ch")%>';

      var bjdMap = new Map();
      for (var i = 0; i < bjd.length; i++) {
        var sido = bjd[i].sido;
        var sigugun = bjd[i].sigugun;
        var dong1 = bjd[i].dong1;
        var dong2 = bjd[i].dong2;
        var dong3 = bjd[i].dong3;
        if (sido != "" && sigugun != "" && dong1 != "") {
          if (bjdMap.get(sido)) {
            if (bjdMap.get(sido).get(sigugun)) {
              if (
                bjdMap
                  .get(sido)
                  .get(sigugun)
                  .includes(dong1 + " " + dong2) == false
              )
                bjdMap
                  .get(sido)
                  .get(sigugun)
                  .push(dong1 + " " + dong2);
            } else {
              bjdMap.get(sido).set(sigugun, []);
            }
          } else {
            bjdMap.set(sido, new Map());
          }
        }
      }

      function sidoOptions(value, key, map) {
        jQuery("#sido").append(fn_option(0, key));
      }
      function sigugunOptions(value, key, map) {
        //console.log(jQuery('#sido > option:selected').val());
        var t = map.get(jQuery("#sido > option:selected").val());
        if (jQuery("#sido > option:selected").val() == key) {
          value.forEach((value, key, map) =>
            jQuery("#sigugun").append(fn_option(0, key))
          );
        }
      }
      function dongOptions(value, key, map) {
        var t = map
          .get(jQuery("#sido > option:selected").val())
          .get(jQuery("#sigugun > option:selected").val());
        for (var i = 0; i < t.length; i++) {
          jQuery("#dong").append(fn_option(0, t[i]));
        }
        if (jQuery("#sigugun > option:selected").val() == key) {
          value.forEach((value, key, map) =>
            jQuery("#dong").append(fn_option(0, value))
          );
        }
      }

      jQuery(document).ready(function () {
        bjdMap.forEach(sidoOptions);

        jQuery("#sido").change(function () {
          jQuery("#sigugun").show();
          jQuery("#sigugun").empty();
          jQuery("#sigugun").append(fn_option("", "선택")); //
          bjdMap.forEach(sigugunOptions);
        });

        jQuery("#sigugun").change(function () {
          jQuery("#dong").show();
          jQuery("#dong").empty();
          jQuery("#dong").append(fn_option("", "선택")); //

          var t = bjdMap
            .get(jQuery("#sido > option:selected").val())
            .get(jQuery("#sigugun > option:selected").val());
          for (var i = 0; i < t.length; i++) {
            jQuery("#dong").append(fn_option(0, t[i]));
          }
        });
      });

      function fn_option(code, name) {
        return '<option value="' + name + '">' + name + "</option>";
      }
    </script>
    <script>
      // 현재 상태
      // 0: 검색
      // 1: 북마크

      var currentState = 0;
      // 마커를 담을 배열입니다
      var markers = [];
      var infoWindows = [];
      var places = [];
      var placeMap = new Map();

      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
          level: 5, // 지도의 확대 레벨
        };

      // 지도를 생성합니다.
      var map = new kakao.maps.Map(mapContainer, mapOption);
      // 지도에 클릭 이벤트를 등록합니다
      // 지도를 클릭하면 디테일 창을 닫습니다
      kakao.maps.event.addListener(map, "click", function (mouseEvent) {
        markerOverlay.setVisible(false);
      });

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places();

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infoWindow = new kakao.maps.InfoWindow({ zIndex: 1 });
      var markerOverlay = new kakao.maps.CustomOverlay({
        map: map,
        clickable: true,
        yAnchor: 0,
      });

      var bounds = new kakao.maps.LatLngBounds();

      var menuIcons = document.getElementsByClassName("nav-link");
      for (var i = 0; i < menuIcons.length; i++) {
        menuIcons[i].addEventListener("click", function () {
          var current = document.getElementsByClassName("active");

          // If there's no active class
          if (current.length > 0) {
            current[0].className = current[0].className.replace(" active", "");
          }

          // Add the active class to the current/clicked button
          this.className += " active";
        });
      }

      var loadingOverlay = document.querySelector(".loading");
      function toggleLoading(event) {
        if (event.keyCode !== 13) return;

        document.activeElement.blur();

        if (loadingOverlay.classList.contains("hidden")) {
          loadingOverlay.classList.remove("hidden");
        } else {
          loadingOverlay.classList.add("hidden");
        }
      }
      var Search = function () {
        sd = $("#sido").val(); //시
        sgg = $("#sigugun").val(); //시군구
        dg = $("#dong").val(); //동

        RunPython();
      };
      var RunPython = function () {
        keyword = sd + " " + sgg + " " + dg;
        console.log("검색: " + keyword);
        // 테스트 데이터
        //var testJSON = '[{"bjdCode":4812725028,"kaptCode":"A63085232","kaptName":"마산삼계2","kaptAddr":"경상남도 창원마산회원구 내서읍 삼계리 39 마산삼계2","doroJuso":"경상남도 창원시 마산회원구 삼계2길 24","welfareFacility":"관리사무소, 노인정, 어린이놀이터, 자전거보관소","kaptdWtimebus":"5~10분이내","subwayLine":"2호선","subwayStation":"신정네거리역","kaptdWtimesub":null,"convenientFacility":"병원(청아병원) 대형상가(롯데마트) 공원(내서근린공원)","educationFacility":"초등학교(광려초등학교) 중학교(삼계중학교) 고등학교(내서여고)","lng":128.5032221,"lat":35.2290864},{"bjdCode":2647010200,"kaptCode":"A61108001","kaptName":"연산센트럴파크","kaptAddr":"부산광역시 연제구 연산동 958-6 연산센트럴파크","doroJuso":"부산광역시 연제구 고분로98번길 16","welfareFacility":"관리사무소, 노인정, 어린이놀이터, 자전거보관소","kaptdWtimebus":"10~15분이내","subwayLine":"1호선, 3호선","subwayStation":null,"kaptdWtimesub":"10~15분이내","convenientFacility":"관공서(부산소방본부/동래소방서) 병원(류마다병원) 대형상가(홈플러스) 공원(연산동 체육공원) 기타(연동시장)","educationFacility":"초등학교(연천초등학교,연일초등학교) 중학교(연산여자중학교) 고등학교(부산외국어고등학교) 대학교(부산경상대학)","lng":129.0935916,"lat":35.1843158},{"bjdCode":3120010600,"kaptCode":"A68380902","kaptName":"이화제일그린파크","kaptAddr":"울산광역시 북구 중산동 1166-18 이화제일그린파크","doroJuso":"울산광역시 북구 이화5길 63","welfareFacility":"관리사무소, 노인정, 어린이놀이터, 자전거보관소","kaptdWtimebus":"5분이내","subwayLine":null,"subwayStation":null,"kaptdWtimesub":null,"convenientFacility":null,"educationFacility":"초등학교(메아리농아학교) 중학교(이화중)","lng":129.338601,"lat":35.6657945}]';
        //testJSON = JSON.parse(testJSON);

        if (loadingOverlay.classList.contains("hidden")) {
          loadingOverlay.classList.remove("hidden");
        }
        // 파이썬 api 실행
        var xhr = new XMLHttpRequest();
        if (wos == 1) wos = "m";
        else wos = "f";
        xhr.open(
          "GET",
          "http://127.0.0.1:5000/recommend?searched=" +
            keyword +
            "&age=" +
            age +
            "&gender=" +
            wos +
            "&elderly=" +
            par +
            "&child=" +
            ch
        );
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.onreadystatechange = function () {
          if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
              currentState = 0;
              // 마커 초기화
              RemoveMarker();
              // 목록 초기화
              RemoveList();
              places = [];
              placeMap = new Map();

              var data = xhr.responseText;
              result = JSON.parse(data);

              for (var attr in result) {
                for (var idx in result[attr]) {
                  if (placeMap[idx] == undefined) placeMap[idx] = new Map();
                  placeMap[idx][attr] = result[attr][idx];
                }
              }
              loadingOverlay.classList.add("hidden");
              var i = 0;
              for (var idx in placeMap) {
                places.push(placeMap[idx]);
                AddMarker(placeMap[idx], i);
                AddDetail(placeMap[idx], i);
                i++;
              }
              /*
				for(var i=0; i<result.length; i++)
				{
					places.push(result[i]);
					AddMarker(result[i], i);
					AddDetail(result[i], i);
				}
				*/
            }
          }
        };
        xhr.send(null);

        /*
	for(var i=0; i<testJSON.length; i++)
	{
		places.push(testJSON[i]);
		AddMarker(testJSON[i], i);
		AddDetail(testJSON[i], i);
	}*/
      };
      function ShowPlaces() {
        currentState = 0;
        // 마커 초기화
        RemoveMarker();
        // 목록 초기화
        RemoveList();
        var i = 0;
        for (var idx in placeMap) {
          places.push(placeMap[idx]);
          AddMarker(placeMap[idx], i);
          AddDetail(placeMap[idx], i);
          i++;
        }
      }
      function ShowBookmarks() {
        console.log("북마크 보여주기");
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
        xhr.onreadystatechange = function () {
          if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
              var data = xhr.responseText;
              result = JSON.parse(data);

              for (var i = 0; i < result.length; i++) {
                places.push(result[i]);
                AddMarker(result[i], i);
                AddDetail(result[i], i);
              }
            }
          }
        };
        xhr.send(null);
      }

      function AddMarker(place, index) {
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

      function AddDetail(place, index) {
        var listEl = document.getElementById("placesList"),
          menuEl = document.getElementById("menu_wrap"),
          fragment = document.createDocumentFragment(),
          listStr = "";
        var itemEl = GetListItem(place, index);
        var marker = markers[index];

        (function (place, marker, index) {
          kakao.maps.event.addListener(marker, "mouseover", function () {
            DisplayInfoWindow(place, marker);
          });

          kakao.maps.event.addListener(marker, "mouseout", function () {
            infoWindow.close();
          });

          kakao.maps.event.addListener(marker, "click", function () {
            console.log("마커 클릭");
            DisplayMarkerOverlay(place, marker, index);
            infoWindow.close();
            //displayDetailWindow(marker, title, address);
          });

          itemEl.onmouseover = function () {
            DisplayInfoWindow(place, marker);
          };

          itemEl.onmouseout = function () {
            infoWindow.close();
          };

          itemEl.onclick = function () {
            console.log("목록 클릭");
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
      function GetListItem(place, index) {
        console.log(place);
        var el = document.createElement("li"),
          itemStr =
            '<div class="info">' +
            '   <h2 style="font-size:1.5em">' +
            place.kaptName +
            "</h2>";

        // 학교
        var edu = new Map();
        var str = place.educationFacility;
        while (str != null && str.indexOf("(") != -1) {
          var start = str.indexOf("(");
          var end = str.indexOf(")");
          var name = str.substr(0, start);
          var found = str.substr(start + 1, end - start - 1);
          str = str.substr(end + 2, str.length);
          edu.set(name, found);
        }

        // 편의시설
        var convenient = new Map();
        var str = place.convenientFacility;
        while (str != null && str.indexOf("(") != -1) {
          var start = str.indexOf("(");
          var end = str.indexOf(")");
          var name = str.substr(0, start);
          var found = str.substr(start + 1, end - start - 1);
          str = str.substr(end + 2, str.length);
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

        //
        // 호가, 실거래가
        //
        if (place.monthly_price != null)
          itemStr +=
            "<span><strong>월세호가:</strong> " +
            place.monthly_price +
            "</span>";
        else itemStr += "<span><strong>월세호가:</strong> -" + "</span>";

        if (place.selling_price != null)
          itemStr +=
            "<span><strong>매매호가:</strong> " +
            place.selling_price +
            "</span>";
        else itemStr += "<span><strong>매매호가:</strong> -" + "</span>";

        if (place.transaction_price != null)
          itemStr +=
            "<span><strong>실거래가:</strong> " +
            place.transaction_price +
            "</span>";
        else itemStr += "<span><strong>실거래가:</strong> -" + "</span>";

        if (place.chartered_price != null)
          itemStr +=
            "<span><strong>전세호가:</strong> " +
            place.chartered_price +
            "</span>";
        else itemStr += "<span><strong>전세호가:</strong> -" + "</span>";

        if (place.subwayLine != null)
          itemStr +=
            '  <span class="subwayLine">' + place.subwayLine + "</span>";
        if (place.subwayStation != null)
          itemStr +=
            '  <span class="subwayStation">' + place.subwayStation + "</span>";
        itemStr +=
          '  <span class="kaptdWtimesub">' + place.kaptdWtimebus + "</span>";
        itemStr +=
          '  <span class="welfareFacility">' +
          place.welfareFacility +
          "</span>";
        //itemStr += '  <span class="convenientFacility">' + place.convenientFacility  + '</span>';

        if (convenient.has("병원"))
          itemStr +=
            '  <span class="hospital">' + convenient.get("병원") + "</span>";
        if (convenient.has("공원"))
          itemStr +=
            '  <span class="park">' + convenient.get("공원") + "</span>";
        if (convenient.has("대형상가"))
          itemStr +=
            '  <span class="shoppingMall">' +
            convenient.get("대형상가") +
            "</span>";
        if (convenient.has("관공서"))
          itemStr +=
            '  <span class="office">' + convenient.get("관공서") + "</span>";
        if (convenient.has("기타"))
          itemStr +=
            '  <span class="etc">' + convenient.get("기타") + "</span>";

        if (edu.has("초등학교"))
          itemStr +=
            '  <span class="elementry School">' +
            edu.get("초등학교") +
            "</span>";
        if (edu.has("중학교"))
          itemStr +=
            '  <span class="middle School">' + edu.get("중학교") + "</span>";
        if (edu.has("고등학교"))
          itemStr +=
            '  <span class="high School">' + edu.get("고등학교") + "</span>";
        if (edu.has("대학교"))
          itemStr +=
            '  <span class="university School">' +
            edu.get("대학교") +
            "</span>";
        itemStr +=
          "    <span>" +
          place.doroJuso +
          "</span>" +
          '   <span class="jibun gray">' +
          place.kaptAddr +
          "</span>";

        itemStr += "</div>";

        el.innerHTML = itemStr;
        el.className = "item";

        return el;
      }

      // InfoWindow: 마커 또는 목록을 마우스 오버했을때 나오는 작은 창
      // InfoWindow를 지도 상에 표시한다.
      function DisplayInfoWindow(place, marker) {
        var content =
          '<div style="display:block; overflow:hidden; text-align: center; font-weight: bold; padding:5px; z-index:1;">';
        content += place.kaptName;
        content += "</div>";

        infoWindow.setContent(content);

        // 이미 오버레이가 떠있으면 인포윈도우를 띄우지 않는다.
        if (markerOverlay.getVisible() && markerOverlay.getContent() != null) {
          if (markerOverlay.getContent().includes(place.kaptName)) return;
        }
        infoWindow.open(map, marker);
      }

      // MarkerOverlay: 마커를 클릭했을 때 나오는 오버레이
      // 오버레이를 지도 상에 표시한다.
      function DisplayMarkerOverlay(place, marker, index) {
        var placePosition = new kakao.maps.LatLng(place.lat, place.lng);
        var content =
          '<div class="markeroverlay">' +
          '<div class="markeroverlay_wrap">' +
          '<div class="markeroverlay_icon">' +
          '<span class="apt_icon"></span>' +
          "</div>" +
          '<div class="markeroverlay_text">' +
          '<strong class="main_text">' +
          place.kaptName +
          "</strong>" +
          //'<div class="sub_text">' +
          //	place.doroJuso +
          //'</div>' +
          "<br>";

        // 학교
        var edu = new Map();
        var str = place.educationFacility;
        while (str != null && str.indexOf("(") != -1) {
          var start = str.indexOf("(");
          var end = str.indexOf(")");
          var name = str.substr(0, start);
          var found = str.substr(start + 1, end - start - 1);
          str = str.substr(end + 2, str.length);
          edu.set(name, found);
        }

        // 편의시설
        var convenient = new Map();
        var str = place.convenientFacility;
        while (str != null && str.indexOf("(") != -1) {
          var start = str.indexOf("(");
          var end = str.indexOf(")");
          var name = str.substr(0, start);
          var found = str.substr(start + 1, end - start - 1);
          str = str.substr(end + 2, str.length);
          convenient.set(name, found);
        }

        if (place.subwayLine != null)
          content += '  <span class="subwayLine"></span>';
        content += '  <span class="welfareFacility"></span>';

        if (convenient.has("병원"))
          content += '  <span class="hospital"></span>';
        if (convenient.has("공원")) content += '  <span class="park"></span>';
        if (convenient.has("대형상가"))
          content += '  <span class="shoppingMall"></span>';
        if (convenient.has("관공서"))
          content += '  <span class="office"></span>';

        if (edu.size > 0)
          content += '<span class="School" style="padding-right:2px"></span>';
        content += "<br>";
        var temp = JSON.stringify(place);
        content +=
          '<input id="fav_button" class="fav_button" type="button" value="북마크">' +
          "</div>" +
          "</div>" +
          "</div>";

        markerOverlay.setContent(content);
        markerOverlay.setPosition(placePosition);
        markerOverlay.setVisible(true);
        markerOverlay.setMap(map);

        document.getElementById("fav_button").onclick = function () {
          OnClickBookmark(temp);
        };
        // 해당 장소가 북마크되어있으면 버튼의 글을 "북마크 제거"로 바꿈
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "CheckBookmark.jsp");
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        // 콜백함수
        xhr.onreadystatechange = function () {
          if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
              var data = xhr.responseText;
              data = data.trim();
              if (data == "true") {
                console.log(
                  '이미 북마크가 되어있음, 버튼을 "북마크 제거"로 변경'
                );
                document.getElementsByClassName("fav_button")[0].value =
                  "북마크 제거";
              } else if (data == "false") {
                console.log(
                  '북마크가 되어있지 않음, 버튼을 "북마크 추가"로 변경'
                );
                document.getElementsByClassName("fav_button")[0].value =
                  "북마크 추가";
              }
            }
          }
        };
        xhr.send(JSON.stringify(place));
      }

      // 북마크가 이미 되어있는지 확인하고
      // 북마크가 되어있으면 북마크 취소(제거)
      // 북마크가 안되어있으면 북마크 추가
      function OnClickBookmark(str) {
        console.log(str);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "CheckBookmark.jsp");
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        // 콜백함수
        xhr.onreadystatechange = function () {
          if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
              // 요청완료
              var data = xhr.responseText;
              data = data.trim();
              console.log(data);
              // 북마크가 되어있으면 북마크제거
              if (data == "true") {
                console.log("북마크 제거");
                RemoveBookmark(str);
                document.getElementsByClassName("fav_button")[0].value =
                  "북마크 추가";
              }
              // 북마크가 안되어있으면 북마크추가
              else if (data == "false") {
                console.log("북마크 추가");
                AddBookmark(str);
                document.getElementsByClassName("fav_button")[0].value =
                  "북마크 제거";
              }
            }
          }
        };
        console.log(str);
        xhr.send(str);
      }

      // 북마크한다. (데이터베이스에 추가한다.)
      function AddBookmark(str) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AddBookmark.jsp");
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        // 콜백함수
        xhr.onreadystatechange = function () {
          if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
              //
              console.log("북마크 추가 완료");
            }
          }
        };
        xhr.send(str);
      }

      // 북마크를 제거한다. (데이터베이스에서 제거)
      function RemoveBookmark(str) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "RemoveBookmark.jsp");
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        // 콜백함수
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            if (xhr.status == 200) {
              console.log("북마크 제거 완료");

              if (currentState == 1) {
                // 북마크 다시 보여주기
                ShowBookmarks();
              }
            }
          }
        };
        xhr.send(str);
      }

      //지도 위에 표시되고 있는 마커를 모두 제거합니다
      function RemoveMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }

      //검색결과 목록의 자식 Element를 제거하는 함수입니다
      function RemoveList() {
        var el = document.getElementById("placesList");
        while (el.hasChildNodes()) {
          el.removeChild(el.lastChild);
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
    <% Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); if
    (session == null || !request.isRequestedSessionIdValid()) {
    //System.out.println("세션이 무효화 상태입니다."); %>
    <script>
      alert("먼저 로그인해주세요!");
      window.location.href = "/residence/start.jsp";
    </script>
    <% } else { String uid = (String) session.getAttribute("G_uid"); if (uid ==
    null) { //System.out.println("세션이 무효화 상태입니다."); %>
    <script>
      alert("먼저 로그인해주세요!");
      window.location.href = "/residence/start.jsp";
    </script>
    <% } else { %>
    <script>
      RunPython("<%=in_search_value%>");
    </script>
    <% } } %>
  </body>
</html>
