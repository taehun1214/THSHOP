<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	<script>
$(document).ready(function(){
	if ("${optionList }"!="[]"){
		 $('#optionNullCheck').show();	
    	}
    })
</script>


<style>
.preview {
width:300px;
height:230px;
}

.thumb {
width:90.7px;
height:81px;
margin-right:3px;}

.normal {
border:3px solid #000000;}

.selected {
border:3px solid #ff0000;}
</style>


</head>
<body>

<img id="0" class="preview normal" src="http://i.imgur.com/wB73OvB.jpg" alt="preview" onclick="showPopup"><br />
<img id="1" class="thumb normal" src="http://i.imgur.com/vblRxAI.jpg" onmouseover="preview(this)" />
<img id="2" class="thumb normal" src="http://i.imgur.com/IxpW9YU.jpg" onmouseover="preview(this)"/>
<img id="3" class="thumb normal" src="http://i.imgur.com/u1kXpzS.jpg" onmouseover="preview(this)"/>

<div class=""></div>

	<!-- productDetail -->
	<form action="/shop/cart/insertCart" method="get">
		<div><input type="hidden" value="${productDetail.p_no }" name="p_no"></div>
		<!-- TODO: 세션으로 b_id 넣어줘야함.. -->
		<div><input type="hidden" value="${login_id}" name="b_id"></div> 
		<div>
			<span>상품명 : </span>${productDetail.p_name }</div>
			<!-- TODO: product 테이블에서 select 해야함 밑에도  -->
			<input type="hidden" value="${productDetail.p_name }" name="p_name">
		<div>
			<span>가격 : </span>${productDetail.p_price }</div>
			<input type="hidden" value="${productDetail.p_price }" name="p_price">
		<div>
			<span>구매 수량 : </span><input type="number" required name="buy_cnt">
		</div>
		<div><span>상품 옵션 : </span>
		<select name="o_cont">
	  	<option>파란색</option>
  		<option>빨간색</option>
  		<option>초록색</option>
 		 <option>노란색</option>
		</select>
		</div>
		<input type="submit" value="장바구니 담기">
	</form>
	

<script>
	
    var lastImg = 1; //Set initial thumbnail and preview
    document.getElementById(0).src = document.getElementById(lastImg).src;
    document.getElementById(lastImg).className = "thumb selected";

    function preview(img) {
        document.getElementById(lastImg).className = "thumb normal";
        img.className = "thumb selected";
        document.getElementById(0).src = img.src;
        lastImg = img.id
    }
    
</script>

<!-- 
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>

<style rel="stylesheet">
body{
background-color: hsla(0,0%,0%,1);
margin: 0px;
overflow: hidden;
font-family: 'Molle', cursive;
}
h2{
  left: 50%;
  position: absolute;
  top: 50%;
  transform: translate( -50%, -50%);
  font-size:3em;
  color:hsla(255, 255%, 255%, .1);
}
</style>
</head>
<body>

<canvas id='canv'></canvas>
<h2>Midnight Snow</h2>


<script type="text/javascript">
var c = document.getElementById('canv'), 
    $ = c.getContext("2d");
var w = c.width = window.innerWidth, 
    h = c.height = window.innerHeight;

Snowy();
function Snowy() {
  var snow, arr = [];
  var num = 600, tsc = 1, sp = 1;
  var sc = 1.3, t = 0, mv = 20, min = 1;
    for (var i = 0; i < num; ++i) {
      snow = new Flake();
      snow.y = Math.random() * (h + 50);
      snow.x = Math.random() * w;
      snow.t = Math.random() * (Math.PI * 2);
      snow.sz = (100 / (10 + (Math.random() * 100))) * sc;
      snow.sp = (Math.pow(snow.sz * .8, 2) * .15) * sp;
      snow.sp = snow.sp < min ? min : snow.sp;
      arr.push(snow);
    }
  go();
  function go(){
    window.requestAnimationFrame(go);
      $.clearRect(0, 0, w, h);
      $.fillStyle = 'hsla(242, 95%, 3%, 1)';
      $.fillRect(0, 0, w, h);
      $.fill();
        for (var i = 0; i < arr.length; ++i) {
          f = arr[i];
          f.t += .05;
          f.t = f.t >= Math.PI * 2 ? 0 : f.t;
          f.y += f.sp;
          f.x += Math.sin(f.t * tsc) * (f.sz * .3);
          if (f.y > h + 50) f.y = -10 - Math.random() * mv;
          if (f.x > w + mv) f.x = - mv;
          if (f.x < - mv) f.x = w + mv;
          f.draw();}
 }
 function Flake() {
   this.draw = function() {
      this.g = $.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.sz);
      this.g.addColorStop(0, 'hsla(255,255%,255%,1)');
      this.g.addColorStop(1, 'hsla(255,255%,255%,0)');
      $.moveTo(this.x, this.y);
      $.fillStyle = this.g;
      $.beginPath();
      $.arc(this.x, this.y, this.sz, 0, Math.PI * 2, true);
      $.fill();}
  }
}
/*________________________________________*/
window.addEventListener('resize', function(){
  c.width = w = window.innerWidth;
  c.height = h = window.innerHeight;
}, false);

</script>
</body>
</html>




 -->
	
</body>
</html>