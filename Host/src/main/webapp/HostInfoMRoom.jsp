<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/yjstyle.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<style type="text/css">

.mybtns {
	border: 0 solid black;
	transition: background-color .5s;
	border-radius: 15px;
}

.mybtns:hover {
	background-color: #E94560;
}

.mbtn {
	background-color: #E94560;
	color: white;
}

.myinfoinput{
	
	width: 150px;
	border: 0.5px solid gray;
	border-radius: 10px;
	height: 30px;
	padding: 0px 10px 0px 10px;
	
}

</style>

</head>
<body>

<%-- nav include --%>
<%@ include file = "hnav1.jsp" %>

<%-- ?????? --%>
<%-- ????????? --%>
<div class="container">
	<div class="row">
		<h5 class="row" style="margin: 20px 0 20px 0">???????????? ????????? ????????????</h5>
	</div>
	<div class="row">
		<div class="col"></div>
		<%-- ?????? ????????? --%>
		<div class="col">
			<div class="row myscontainer justify-content-center">
				<div class="card col-8 myhcard" style="border-radius: 20px;">
					<table>
						<tr class="myhtr">
							<td class="myth">????????????</td><td class="myth">?????????</td><td class="myth">????????????</td>
							<td class="myth"></td>
						</tr>
						<%-- for??? ????????? --%>
						<c:forEach items="${list}" var="dto">
							<tr class="myhtr ">
								<td class="mytd">${dto.roNum }</td>
								<td class="mytd">${dto.roPrice }</td>
								<td class="mytd">${dto.roMax }</td>
								<td class="mytd">
									<a href="HostInfoRoomDel.do?roSeq=${dto.roSeq }" type="button" class="btn btn-secondary" style="height: 30px; font-size: 13px;" >
										?????? 
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>	  
				</div>
			</div>
		<%-- ?????? ??? --%>
			<div class="container ">
				<form name ="Member" action="HostInfoRoomIn.do" method="post">
					<table class="myscontainer" style="width: 500px; margin-right: 0px">
						<tr class="row justify-content-center">
							<td class="col-3">?????? ??????</td>
							<td class="col-3"><input name="roNum" type="text" class="form-control myinfoinput" placeholder="????????? ??????????????????" aria-label="text"></td>
						</tr>
						<tr class="row justify-content-center">
							<td class="col-3">?????????</td>
							<td class="col-3"><input name="roPrice" type="text" class="form-control myinfoinput" placeholder="????????? ??????????????????" aria-label="text"></td>
						</tr>
						<tr class="row justify-content-center">
							<td class="col-3">?????? ??????</td>
							<td class="col-3"><input name="roMax" type="text" class="form-control myinfoinput" placeholder="????????? ??????????????????" aria-label="text"></td>
						</tr>
					</table>
					<%-- ??????, ?????? ?????? --%>
					<div class="row myscontainer justify-content-center">
						<input type="button" onclick="checkMember()" style="border-radius: 15px; width:100px;" value="??????" class=" col-2 btn mybtns btn-secondary">
					</div>
				</form>
				<div class="row justify-content-end">
					<a href="HostRInfo.do" style="border-radius: 15px; width:100px;" class="col-2 btn mbtn">??????</a>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

//?????????
function checkMember(){
	
	var regExNum = /[^0-9]/g;
	
	var form = document.Member
	
	let roNum = form.roNum.value
	let roPrice = form.roPrice.value
	let roMax = form.roMax.value
	
	//null ??????
	if(roNum == ""){
		alert("??????????????? ??????????????????.")
		form.roNum.focus();
		return false;
	}
	
	if(roPrice == ""){
		alert("???????????? ??????????????????.")
		form.roPrice.focus();
		return false;
	}
	
	if(roMax == ""){
		alert("?????? ????????? ??????????????????.")
		form.roMax.focus();
		return false;
	}
	
	//???????????? ??????
	if(regExNum.test(roNum)){
		alert("????????? ????????? ??????????????????.")
		form.roNum.select()
		return
	}
	
	if(regExNum.test(roPrice)){
		alert("???????????? ????????? ??????????????????.")
		form.roPrice.select()
		return
	}
	
	if(regExNum.test(roMax)){
		alert("?????? ????????? ????????? ??????????????????.")
		form.roMax.select()
		return
	}
	
	form.submit();
	
}

</script>

</body>
</html>