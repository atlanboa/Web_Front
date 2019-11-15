<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.s-nav-row {
	width: 100%;
	margin: 0 auto;
	margin-top: 10px;
}

.s-nav-row s-nav {
	width: 10%;
	margin: 0px auto;
}

.s-nav.p-3:hover {
	cursor: pointer;
	background: #dddddd;
}

.s-div-hover :hover {
	cursor: pointer;
	color: white;
}

div-center div {
	margin: 0 auto
}

h3 {
	display: inline;
}

#productImg {
	margin-top: 50px;
	width: 100%;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jquery 선언부가 먼저나오고 부트스트랩 선언부가 와야함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	
</script>
<script type="text/javascript">
var arr;
	
	$(function() {

		//alert(sessionStorage.getItem('ssafy'));
		if (sessionStorage.getItem('ssafy') == 'null') {
			//alert(sessionStorage.getItem('ssafy'));
			$('#loignOnlyInfo').text("");
			$('#loignOnly').text("");

			var str = '';
			str += '<button type="button" id="signUp" class="btn btn-primary">회원가입</button>'
			str += '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">로그인</button>'
			$('.memberBtn').append(str);
		} else {
			var str = '';
			str += '<button id="myPageBtn" type="button" class="btn btn-primary">마이페이지</button>'
			str += '<button id="logoutBtn" type="button" class="btn btn-primary">로그아웃</button>'
			$('.memberBtn').append(str);
		}

		$('#login').click(
				function() {
					$.ajax({
						type : 'post',
						url : 'http://localhost:8888/Tproject02/member.xml',
						dataType : 'xml',
						success : function(result) {
							var str = '';
							$(result).find('member').each(
									function(index, item) {
										var id = $(this).find('id').text();
										var pass = $(this).find('pass').text();
										if (id == $('#InputEmail').val()&& pass == $('#InputPassword').val()) {
											sessionStorage.setItem('ssafy',true);
											alert('로그인 되었습니다.');
											location.href = 'mainPage.html';
										} else {
											alert('일치하는 회원 정보가 없습니다.');
										}
									});
							/* $('table tr:gt(0)').remove(); */
						}
					});
				})

		$('#productBtn').click(function() {
			location.href = 'productPage.html';
		})
		$('#myPageBtn').click(function() {
			location.href = 'mypage.html';
		})
		$('#signUp').click(function() {
			location.href = 'signupPage.html';
		})
		$('#logoutBtn').click(function() {
			sessionStorage.setItem('ssafy', null);
			alert('로그아웃 되었습니다.');
			location.href = 'mainPage.html';
		})
		var position = sessionStorage.getItem('성영');
		$.ajax({
			type : 'post',
			url : 'http://localhost:8888/Tproject02/foodInfo.xml',
			dataType : 'xml',
			success : function(result) {
				var str = '';
				$(result).find('food').each(
					function(index, item) {
						var code = $(this).find('code').text();
							if (code ==<%=request.getParameter("code")%>) {
								var name = $(this).find('name').text();
								var maker = $(this).find('maker').text();
								var material = $(this).find('material').text();
								var image = $(this).find('image').text();

								$('#pName').text(name);
								$('#material').text(material);
								$('#maker').text(maker);
								$("#productImg").attr("src","image/" + image);

								$.ajax({
									type : 'post',
									url : 'http://localhost:8888/Tproject02/FoodNutritionInfo.xml',
									dataType : 'xml',
									success : function(result) {
									arr = new Array(10);
									$(result).find('item').each(
									function(index,item) {
										if (name == $(item).find('DESC_KOR').text()) {
											var i = 0;
											$(item).find('*').each(function() {
												arr[i] = $(this).text();
												i = i + 1;
											});					
											//alert(arr);
											
											google.charts.load('current', {'packages' : [ 'corechart' ]});
											google.charts.setOnLoadCallback(drawChart);
											function drawChart() {
												var i = 1;
												var info = [ [ 'Task', 'Hours per Day' ], [ '칼로리', Number(arr[1]) ],
															[ '탄수화물', Number(arr[2]) ], [ '단백질', Number(arr[3]) ], [ '지방',  Number(arr[4])],
															[ '당류', Number(arr[5]) ], [ '나트륨', Number(arr[6])],
															[ '콜레스테롤', Number(arr[7]) ], [ '포화 지방산', Number(arr[8]) ],
															[ '트렌스지방', Number(arr[9])] ];
												
												var data = google.visualization.arrayToDataTable(info);
												var options = {
													title : 'My Daily Activities'
												};

												var chart = new google.visualization.PieChart(document.getElementById('piechart'));
												chart.draw(data, options);
											}
										}
									});						
								}
							});
						}
					});
					}
				});
		$('#productBtn').click(function() {
			location.href = 'productPage.html';
		})
	});
	
	

</script>

</head>
<body>
	<div>
		<!-- class="fixed-top" -->
		<nav
			class="navbar navbar-expand-sm bg-primary navbar-dark justify-content-end">
			<div class="btn-group memberBtn"></div>
		</nav>
		<div class="container bg-light">
			<div class="row s-nav-row">
				<div class="col-sm-2 s-nav">
					<a href="mainPage.html"><img alt=""
						src="image/page_image/header-logo.jpg" id="logo-hover"> </a>
				</div>
				<div class="col-sm-2 s-nav p-3 ">공지사항</div>
				<div id="productBtn" class="col-sm-2 s-nav p-3">상품정보</div>
				<div class="col-sm-2 s-nav p-3">베스트섭취정보</div>
				<div class="col-sm-2 s-nav p-3">내섭취정보</div>
				<div class="col-sm-2 s-nav p-3">예상섭취정보</div>
			</div>
		</div>
	</div>

	<div class="container-fluid jumbotron text-center container"
		style="background-color: rgb(153, 217, 234); margin-top: 10px; margin-bottom: 10px;">
		<h1 style="color: white">WHAT WE PROVIDE</h1>
		<hr width="500">
		<br>
		<div class="row div-center">
			<div class="col-sm-3 "></div>
			<div class="col-sm-6 ">
				<div class="row input-group mt-3 mb-3">

					<div class="input-group mb-3">
						<select name="job">
							<option value="">전체</option>
							<option value="학생">상품명</option>
							<option value="회사원">재료명</option>
							<option value="기타">회사명</option>
						</select> <input type="text" class="form-control" placeholder="검색어를 입력하세요">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">OK</button>
							<button class="btn btn-danger" type="button">Cancel</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3 "></div>
		</div>
	</div>
	<div class="container">

		<h1 style="text-align: center">제품 정보</h1>
		<hr>
		<div class="container" style="width: 1000px; height: 1000px">
			<div class="row">
				<div class="col-sm-3">
					<img id="productImg" alt="아카페라 아메리카노" src="" align=left>
				</div>
				<div class="col-sm-9">
					<h1 id="pName"></h1>
					<!-- 이름  -->
					<br> <label>수량 : &nbsp;&nbsp;</label><input type="number"
						value="0" required="required">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary">추가</button>
					&nbsp;&nbsp;
					<button class="btn btn-primary">장바구니 담기</button>
					<hr></hr>
					<h3>제조사</h3>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<p id="maker"></p>
					<!-- 제조사  -->
					<hr></hr>
					<h3>원재료</h3>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<p id="material"></p>
					<hr></hr>
					<h3>알레르기 성분</h3>
					<hr></hr>
				</div>

			</div>

			<div id="piechart" style="width: 900px; height: 500px;"></div>
		</div>

	</div>



	<div id="myModal" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="InputEmail"
							aria-describedby="emailHelp" placeholder="Enter email"> <small
							id="emailHelp" class="form-text text-muted">We'll never
							share your email with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="InputPassword"
							placeholder="Password">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="login">로그인</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>