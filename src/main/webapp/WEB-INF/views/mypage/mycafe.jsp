<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>My page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
    :root {
        font-size: 10px;
      }
      * {
        color: white;
      }
      *,
      *::before,
      *::after {
        box-sizing: border-box;
      }

      body {
        font-family: 'Open Sans', Arial, sans-serif;
        min-height: 100vh;
        background-color: #222;
        color: #262626;
        padding-bottom: 3rem;
      }

      
      .container {
        max-width: 93.5rem;
        margin: 0 auto;
        padding: 0 2rem;
      }

      .btn {
        display: inline-block;
        font: inherit;
        background: none;
        border: none;
        color: inherit;
        padding: 0;
        cursor: pointer;
      }
      .btn:hover {
        background: #373737;
      }

      .btn:focus {
        outline: 0.5rem auto #4d90fe;
      }

      .visually-hidden {
        position: absolute !important;
        height: 1px;
        width: 1px;
        overflow: hidden;
        clip: rect(1px, 1px, 1px, 1px);
      }

      /* Profile Section */

      .profile {
        padding: 5rem 0;
      }

      .profile::after {
        content: '';
        display: block;
        clear: both;
      }

      .profile-image {
        float: left;
        border-radius: 70%;
    	width: 200px;
    	height: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 3rem;
      	overflow:hidden;
      }
		
		
      .profile-image img {
         
        width:100%;
		height:100%;
		object-fit:cover;
      }

      .profile-user-settings,
      .profile-stats,
      .profile-bio {
        float: left;
        width: calc(66.666% - 2rem);
      }

      .profile-user-settings {
        margin-top: 1.1rem;
      }

      .profile-user-name {
        display: inline-block;
        font-size: 3.2rem;
        font-weight: 300;
      }

      .profile-edit-btn {
        font-size: 1.4rem;
        line-height: 1.8;
        border: 0.1rem solid #dbdbdb;
        border-radius: 0.3rem;
        padding: 0 2.4rem;
        margin-left: 2rem;
      }

      .profile-settings-btn {
        font-size: 2rem;
        margin-left: 1rem;
      }

      .profile-stats {
        margin-top: 2.3rem;
      }

      .profile-stats li {
        display: inline-block;
        font-size: 1.6rem;
        line-height: 1.5;
        margin-right: 4rem;
        cursor: pointer;
      }

      .profile-stats li:last-of-type {
        margin-right: 0;
      }

      .profile-bio {
        font-size: 1.6rem;
        font-weight: 400;
        line-height: 1.5;
        margin-top: 2.3rem;
      }

      .profile-real-name,
      .profile-stat-count,
      .profile-edit-btn {
        font-weight: 600;
      }

      /* Gallery Section */

      .gallery {
        display: flex;
        flex-wrap: wrap;
        margin: -1rem -1rem;
        padding-bottom: 3rem;
      }

      .gallery-item {
        position: relative;
        flex: 1 0 22rem;
        margin: 1rem;
        color: #fff;
        cursor: pointer;
      }

      .gallery-item:hover .gallery-item-info,
      .gallery-item:focus .gallery-item-info {
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.3);
      }

      .gallery-item-info {
        display: none;
      }

      .gallery-item-info li {
        display: inline-block;
        font-size: 1.7rem;
        font-weight: 600;
      }

      .gallery-item-likes {
        margin-right: 2.2rem;
      }

      .gallery-item-type {
        position: absolute;
        top: 1rem;
        right: 1rem;
        font-size: 2.5rem;
        text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
      }

      .fa-clone,
      .fa-comment {
        transform: rotateY(180deg);
      }

      .gallery-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      /* Loader */

      .loader {
        width: 5rem;
        height: 5rem;
        border: 0.6rem solid #999;
        border-bottom-color: transparent;
        border-radius: 50%;
        margin: 0 auto;
        animation: loader 500ms linear infinite;
      }

      /* Media Query */

      @media screen and (max-width: 40rem) {
        .profile {
          display: flex;
          flex-wrap: wrap;
          padding: 4rem 0;
        }

        .profile::after {
          display: none;
        }

        .profile-image,
        .profile-user-settings,
        .profile-bio,
        .profile-stats {
          float: none;
          width: auto;
        }

        .profile-image img {
          width: 7.7rem;
        }

        .profile-user-settings {
          flex-basis: calc(100% - 10.7rem);
          display: flex;
          flex-wrap: wrap;
          margin-top: 1rem;
        }

        .profile-user-name {
          font-size: 2.2rem;
        }

        .profile-edit-btn {
          order: 1;
          padding: 0;
          text-align: center;
          margin-top: 1rem;
        }

        .profile-edit-btn {
          margin-left: 0;
        }

        .profile-bio {
          font-size: 1.4rem;
          margin-top: 1.5rem;
        }

        .profile-edit-btn,
        .profile-bio,
        .profile-stats {
          flex-basis: 100%;
        }

        .profile-stats {
          order: 1;
          margin-top: 1.5rem;
        }

        .profile-stats ul {
          display: flex;
          text-align: center;
          padding: 1.2rem 0;
          border-top: 0.1rem solid #dadada;
          border-bottom: 0.1rem solid #dadada;
        }

        .profile-stats li {
          font-size: 1.4rem;
          flex: 1;
          margin: 0;
        }

        .profile-stat-count {
          display: block;
        }
      }

      /* Spinner Animation */

      @keyframes loader {
        to {
          transform: rotate(360deg);
        }
      }

      /*

The following code will only run if your browser supports CSS grid.

Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling. 

*/

      @supports (display: grid) {
        .profile {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-template-rows: repeat(3, auto);
          grid-column-gap: 3rem;
          align-items: center;
        }

        .profile-image {
          grid-row: 1 / -1;
        }

        .gallery {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
          grid-gap: 2rem;
        }

        .profile-image,
        .profile-user-settings,
        .profile-stats,
        .profile-bio,
        .gallery-item,
        .gallery {
          width: auto;
          margin: 0;
        }

        @media (max-width: 40rem) {
          .profile {
            grid-template-columns: auto 1fr;
            grid-row-gap: 1.5rem;
          }

          .profile-image {
            grid-row: 1 / 2;
          }

          .profile-user-settings {
            display: grid;
            grid-template-columns: auto 1fr;
            grid-gap: 1rem;
          }

          .profile-edit-btn,
          .profile-stats,
          .profile-bio {
            grid-column: 1 / -1;
          }

          .profile-user-settings,
          .profile-edit-btn,
          .profile-settings-btn,
          .profile-bio,
          .profile-stats {
            margin: 0;
          }
        }
      }
      /* a {
        text-decoration-line: none;
      } */
    </style>
  </head>
  <body background-color="#222">
	
    <header>
      <div class="container">
        <div class="profile">
          <div class="profile-image" >
           <img src="/resources/mypage/${dto.mem_img }" />
          </div>

          <div class="profile-user-settings">
            <h1 class="profile-user-name">${dto.mem_name }, ${dto.mem_level }</h1>

            <button class="btn profile-edit-btn" id="editprofile">
              Edit Profile
            </button>
            <button onclick="location.href='/cafein/messagebox' ">message</button>

            <button
              class="btn profile-settings-btn"
              aria-label="profile settings"
            >
              <i class="fas fa-cog" aria-hidden="true"></i>
            </button>
          </div>

          <div class="profile-stats">
            <ul>
              <li>
                <a href="/mypage/mypage"
                  ><span class="profile-stat-count">${dto.mem_level }</span> 내 게시물</a>
              </li>
   <c:if test="${dto.mem_level == 1}"> 
              <li>
                <a href="/mypage/mycafe"
                  ><span class="profile-stat-count">164</span> 내 가게 게시물</a>
              </li>
   </c:if>           
              <!-- <li>
                <a href="/mypage/follow">
                  <span class="profile-stat-count">164</span> 팔로우</a>
              </li> -->
              <li>
                <a href="/mypage/like"
                  ><span class="profile-stat-count">164</span> 좋아요 한 게시물</a>
              </li>
            </ul>
          </div>
          <!-- End of profile section -->

          <div class="profile-bio">
            <p>
              <span class="profile-real-name"></span> Lorem ipsum
              dolor sit, amet consectetur adipisicing elit 📷✈️🏕️
            </p>
          </div>
        </div>
        <!-- End of profile section -->
      </div>
      <!-- End of container -->
    </header>
    
<!-- ---------------사진 출력되는 부분---------------------- -->

    <main>
      <div class="container">
        <div class="gallery">
          
	<!-- -------------------------------------------------- -->
	
	<c:forEach var="i" items="${imglist }">
          <div class="gallery-item" tabindex="0">
           
            <a href="/cafein/selectBySeq?cafein_seq=${i.cafein_seq }">
            <img src="/cafein/${i.sys_name }" class="gallery-image"/>
            </a>

            <div class="gallery-item-type">
              <span class="visually-hidden">Gallery</span
              ><i class="fas fa-clone" aria-hidden="true"></i>
            </div>

            <div class="gallery-item-info">
             <!--  <ul>
                <li class="gallery-item-likes">
                  <span class="visually-hidden">Likes:</span
                  ><i class="fas fa-heart" aria-hidden="true"></i> 42
                </li>
                <li class="gallery-item-comments">
                  <span class="visually-hidden">Comments:</span
                  ><i class="fas fa-comment" aria-hidden="true"></i> 1
                </li>
              </ul> -->
            </div>
          </div>
    </c:forEach>
   
	<!-- -------------------------------------------------- -->

          
        </div>
        <!-- End of gallery -->

        <!-- <div class="loader"></div> -->
      </div>
      <!-- End of container -->
    </main>

    <script>
    	$("#editprofile").on("click",function(){
    		location.href = "/mypage/mypageEdit";
    	})
    </script>
  </body>
</html>
