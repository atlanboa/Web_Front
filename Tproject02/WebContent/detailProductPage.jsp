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

<!-- jquery ����ΰ� ���������� ��Ʈ��Ʈ�� ����ΰ� �;��� -->
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
		var foodlist;
		var select = '��ü';
		
		$("#select").change(function() {
			var select_val = $(this).children("option:selected").text();
			select = select_val;
		});
		
		$('#searchBtn').click(function() {			
			var searchText = $("#searchText").val();
			if(searchText == ''){
				alert("�˻� ����� �����ϴ�!!!");
			}
			var str = '';
			alert(select);
			if(select == '��ü' ){
				$(foodlist).find('food').each(function(index, item){
					var name = $(this).find('name').text();
					var maker = $(this).find('maker').text();
					var code = $(this).find('code').text();
					var material = $(this).find('material').text();
					var image = $(this).find('image').text();
					
					if(name.includes(searchText) || maker.includes(searchText) || material.includes(searchText)){
						str += '<div id="detailBtn" class="media box hi s-div-hover" name="'+code+'">'
						str += '<img src="image/'+image+'"class="align-self-center mr-3" style="width: 20%"><div class="media-body"> <h4 class="s-div-hover">';
						str +=  name + '<span class="badge badge-secondary">' + maker + '</span>' + '</h4>';
						str += 	'<hr>';
						str += 	'<p>'+material+'</p>';
						str +='</div>';
						str += '</div>';
						str += '<hr>'
					}
					$('.products').html(str);
				});
			}
			else if(select == "��ǰ��"){
				$(foodlist).find('food').each(function(index, item){
					var name = $(this).find('name').text();
					var maker = $(this).find('maker').text();
					var code = $(this).find('code').text();
					var material = $(this).find('material').text();
					var image = $(this).find('image').text();
					if(name.includes(searchText)){
						str += '<div id="detailBtn" class="media box hi s-div-hover" name="'+code+'">'
						str += '<img src="image/'+image+'"class="align-self-center mr-3" style="width: 20%"><div class="media-body"> <h4 class="s-div-hover">';
						str +=  name + '<span class="badge badge-secondary">' + maker + '</span>' + '</h4>';
						str += 	'<hr>';
						str += 	'<p>'+material+'</p>';
						str +='</div>';
						str += '</div>';
						str += '<hr>'
					}
					$('.products').html(str);
				});
			}else if(select == "����"){
				$(foodlist).find('food').each(function(index, item){
					  var name = $(this).find('name').text();
						var maker = $(this).find('maker').text();
						var code = $(this).find('code').text();
						var material = $(this).find('material').text();
						var image = $(this).find('image').text();
						if(material.includes(searchText)){
							str += '<div id="detailBtn" class="media box hi s-div-hover" name="'+code+'">'
							str += '<img src="image/'+image+'"class="align-self-center mr-3" style="width: 20%"><div class="media-body"> <h4 class="s-div-hover">';
							str +=  name + '<span class="badge badge-secondary">' + maker + '</span>' + '</h4>';
							str += 	'<hr>';
							str += 	'<p>'+material+'</p>';
							str +='</div>';
							str += '</div>';
							str += '<hr>'
						}
						$('.products').html(str);
					});
			}else if(select == "ȸ���"){
				$(foodlist).find('food').each(function(index, item){
					  var name = $(this).find('name').text();
						var maker = $(this).find('maker').text();
						var code = $(this).find('code').text();
						var material = $(this).find('material').text();
						var image = $(this).find('image').text();
						if(maker.includes(searchText)){
							str += '<div id="detailBtn" class="media box hi s-div-hover" name="'+code+'">'
							str += '<img src="image/'+image+'"class="align-self-center mr-3" style="width: 20%"><div class="media-body"> <h4 class="s-div-hover">';
							str +=  name + '<span class="badge badge-secondary">' + maker + '</span>' + '</h4>';
							str += 	'<hr>';
							str += 	'<p>'+material+'</p>';
							str +='</div>';
							str += '</div>';
							str += '<hr>'
						}
						$('.products').html(str);
					});
			}
			
		});
		//alert(sessionStorage.getItem('ssafy'));
		if (sessionStorage.getItem('ssafy') == 'null') {
			//alert(sessionStorage.getItem('ssafy'));
			$('#loignOnlyInfo').text("");
			$('#loignOnly').text("");

			var str = '';
			str += '<button type="button" id="signUp" class="btn btn-primary">ȸ������</button>'
			str += '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">�α���</button>'
			$('.memberBtn').append(str);
		} else {
			var str = '';
			str += '<button id="myPageBtn" type="button" class="btn btn-primary">����������</button>'
			str += '<button id="logoutBtn" type="button" class="btn btn-primary">�α׾ƿ�</button>'
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
											alert('�α��� �Ǿ����ϴ�.');
											location.href = 'mainPage.html';
										} else {
											alert('��ġ�ϴ� ȸ�� ������ �����ϴ�.');
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
			$("#myModal2").modal();
		})
		$('#logoutBtn').click(function() {
			sessionStorage.setItem('ssafy', null);
			alert('�α׾ƿ� �Ǿ����ϴ�.');
			location.href = 'mainPage.html';
		})
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
												var info = [ [ 'Task', 'Hours per Day' ], [ 'Į�θ�', Number(arr[2]) ],
															[ 'ź��ȭ��', Number(arr[3]) ], [ '�ܹ���', Number(arr[4]) ], [ '����',  Number(arr[5])],
															[ '���', Number(arr[6]) ], [ '��Ʈ��', Number(arr[7])],
															[ '�ݷ����׷�', Number(arr[8]) ], [ '��ȭ �����', Number(arr[9]) ],
															[ 'Ʈ��������', Number(arr[10])] ];
												
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
		$('#signUpBtn').click(function() {
			$.ajax({
				type:'post',
				url:'http://localhost:8888/Tproject02/member.xml',
				dataType:'xml',
				success:function(result){
					var str = '';
					$(result).find('member').each(function(index, item){
						var id = $(this).find('id').text();
						var pass = $(this).find('pass').text();
						if(id == $('#usrname').val()){
							alert('�̹� �ִ� ȸ���Դϴ�.');
						}
						else{
							alert('�̹� ��ϵ� ȸ���� ������ �Է��Ͻ� ������ ��ϵ��� �ʽ��ϴ�. \n id: ssafy\n password: 1234\n�� �α������ּ���');
						}
					});	
					/* $('table tr:gt(0)').remove(); */
				}
			});
		});
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
				<div class="col-sm-2 s-nav p-3 ">��������</div>
				<div id="productBtn" class="col-sm-2 s-nav p-3">��ǰ����</div>
				<div class="col-sm-2 s-nav p-3">����Ʈ��������</div>
				<div class="col-sm-2 s-nav p-3 loignOnlyInfo">����������</div>
				<div class="col-sm-2 s-nav p-3 loignOnly">����������</div>
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
							<option value="">��ü</option>
							<option value="�л�">��ǰ��</option>
							<option value="ȸ���">����</option>
							<option value="��Ÿ">ȸ���</option>
						</select> <input type="text" class="form-control" placeholder="�˻�� �Է��ϼ���">
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

		<h1 style="text-align: center">��ǰ ����</h1>
		<hr>
		<div class="container" style="width: 1000px; height: 1000px">
			<div class="row">
				<div class="col-sm-3">
					<img id="productImg" alt="��ī��� �Ƹ޸�ī��" src="" align=left>
				</div>
				<div class="col-sm-9">
					<h1 id="pName"></h1>
					<!-- �̸�  -->
					<br> <label>���� : &nbsp;&nbsp;</label><input type="number"
						value="0" required="required">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary">�߰�</button>
					&nbsp;&nbsp;
					<button class="btn btn-primary">��ٱ��� ���</button>
					<hr></hr>
					<h3>������</h3>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<p id="maker"></p>
					<!-- ������  -->
					<hr></hr>
					<h3>�����</h3>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<p id="material"></p>
					<hr></hr>
					<h3>�˷����� ����</h3>
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
					<button type="button" class="btn btn-primary" id="login">�α���</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">��й�ȣ ã��</button>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> ȸ������
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> ���̵�</label> <input type="text"
								class="form-control" id="usrname" placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> �����ȣ</label> <input
								type="text" class="form-control" id="psw"
								placeholder="���� ���� ���� 6�ڸ� �̻�">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> �̸�</label> <input
								type="text" class="form-control" id="psw"
								placeholder="user name">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> �ּ�</label> <input
								type="text" class="form-control" id="psw" placeholder="address">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> ��ȭ��ȣ</label> <input
								type="text" class="form-control" id="psw"
								placeholder="010-xxxx-xxxx">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> �˷�����</label>
							<field>
							<div class="checkbox">
								<input type="checkbox" value="" checked>���<input
									type="checkbox" value="" checked>���� <input
									type="checkbox" value="" checked>���� <input
									type="checkbox" value="" checked>��<br> <input
									type="checkbox" value="" checked>���� <input
									type="checkbox" value="" checked>��ġ <input
									type="checkbox" value="" checked>���� <input
									type="checkbox" value="" checked>��<br><input
									type="checkbox" value="" checked>�Ұ��<input
									type="checkbox" value="" checked>�߰��<input
									type="checkbox" value="" checked>�������<br><input
									type="checkbox" value="" checked>������<input
									type="checkbox" value="" checked>�ε鷹<input
									type="checkbox" value="" checked>�������
							</div>
							</field>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="signUpBtn" class="btn btn-primary btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" ></span> ����
					</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>