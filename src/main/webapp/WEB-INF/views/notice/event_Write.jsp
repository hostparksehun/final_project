<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap ver 5.1  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
</head>
<style>
/*board UI출력부분----------------------------*/
.tz-gallery {
    padding: 40px;
    padding-top:0px;
}

/* Override bootstrap column paddings */
   .tz-gallery .row > div {
       padding: 2px;
   }
   
   .tz-gallery .lightbox img {
       width: 100%;
       border-radius: 0;
       position: relative;
   }
      .container h1 {
          text-align: center;
          margin-top: 50px;
          font-family: 'Droid Sans', sans-serif;
          font-weight: bold;
      }

      button{
        border:none;
      }
       #row4 .btn{
         font-family: 'Noto Sans KR';
         font-style: normal;
         font-weight: 700;
            height: 45px;
            line-height: 30px;
            font-weight: bold;
            background-color: #760c0c;
            color: #FFFFFF;
            border-radius: 12px;
            width:120px;
            border: none;
            margin-left:10px;
         }
</style>
<body>
<!--  ------------------------------------------------------------header-----------------------------------------------------  -->

<%@ include file="header.jsp"%>
      
<!-------------------------------------------------------Main------------------------------------------------->
<div class="container" id="main">
   <div class="col-12" style="margin-bottom:40px;">
      <a style="color: white; font-size: 40px;">Event</a>
    </div>
    <form action="event_insert">
			<div id="notice" align=center style="color: #ededed; width: 100%; height: 80%;">
            <div id="row1" style="font-size : 25px; width: 100%; padding-bottom: 1%; border-bottom: 2px solid gray;" align=left>
            <input type=text name=title id=title placeholder="제목 (최대 33자)" style="width:97%; maxlength="33"">
            </div>
            <div id="row3" style="font-size : 15px; width: 100%; height: 600px; margin-top: 2%; border-bottom: 2px solid gray; overflow: hidden;" align=left>
            <textarea name="contents" id="contents" style="width: 98%;" rows="30" placeholder="내용 (최대 1300자)"></textarea>
            </div>
            <div id="row4" style="width: 100%; margin-top: 25px; margin-bottom: 25px;" align=right>
                <p class="textCount"><span>0</span> / 1300</p>
                <a href="/notice/event"><button class="btn" type="button">뒤로</button></a>
                <button type="submit" class="btn" style="margin-left:10px;">작성</button>
            </div>
        </div>
    </form>
</div>
 <!-------------------------------------------------------Footer------------------------------------------------->
 
 <%@ include file="footer.jsp"%>

 <!-------------------------------------------------------Footer------------------------------------------------->

<script>

//글 입력시
$("#contents").keyup(function(e) {
	let content = $(this).val();
	
	// 글자수 계산
	if (content.length == 0 || content == ''){
		$(".textCount").text("0자 /1300자");
	} else {
		$(".textCount").text(content.length + "자 /1300자");
		
	}
	
	// 글자수 제한
	 	if($(this).val().length > 1300) {
    	$(this).val($(this).val().substring(0, 1300));
    	alert("1300자까지 입력 가능합니다")
		 }
});

$(".cbtn").click(function() {
	location.href = "/notice/event";
})




</script>
          
</body>
</html>