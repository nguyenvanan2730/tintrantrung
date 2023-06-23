<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
<script src="../resources/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">

</head>

<body>

<header>
        <div class="container-fluid">
            <div class="row">
				<div class="col-md-2">
					<nav class="navbar">
						<div class="container" style="padding-left: 16px;">
							<a class="navbar-brand" href="/"> <img
								src="../resources/imgs/logo.png" alt=""
								width="150" height="">
							</a>
						</div>
					</nav>
				</div>

				<!-- NAVBAR -->
                
                <!-- NOT LOGIN -->
                <sec:authorize access="!hasRole('ROLE_MEMBER')">
                <div class=" col-md-10">
                    <ul id="nav-bar" class="nav justify-content-end">
                        <li class=" nav-item">
                            <a href="/" class="nav-link" ><i class="fa-solid fa-house"></i>&nbsp;ホーム</a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="/booking/list" class="nav-link"><i class="fa-solid fa-list-ol"></i>&nbsp;予約履歴</a>
                        </li>

                        <li class="nav-item">
                            <a href="/login" class="nav-link"><i class="fa-solid fa-right-to-bracket"></i>&nbsp;ログイン</a>
                        </li>
                        <li class="nav-item">
                            <a href="/register/input" class="nav-link"><i class="fa-solid fa-user-plus"></i>&nbsp;会員登録</a>
                        </li>
                        <li class="nav-item">
                            <a href="/#contact" class="nav-link"><i class="fa-solid fa-phone-volume"></i>&nbsp;お問い合わせ</a>
                        </li>
                    </ul>
                </div>
                </sec:authorize>
                
                <!-- LOGIN -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<div class=" col-md-10">
						<ul id="nav-bar" class="nav justify-content-end">
							<li class=" nav-item">
								<a href="/" class="nav-link"><i class="fa-solid fa-house"></i>&nbsp;ホーム</a></li>
							<li class="nav-item">
								<a href="/#contact" class="nav-link"><i class="fa-solid fa-phone-volume"></i>&nbsp;お問い合わせ</a></li>
							<li class="nav-item">
								<a href="/booking/list" class="nav-link"><i class="fa-solid fa-list-ol"></i>&nbsp;予約履歴</a>
							</li>
							<li class="nav-item">
								<form:form action="/logout" name="logoutForm" id="logoutForm" style="display:inline-flex">
									<a href="javascript:logoutForm.submit()" class="nav-link">
										<i class="fa-solid fa-right-from-bracket"></i>&nbsp;ログアウト
									</a>
								</form:form></li>
							<li class="nav-item">
								<a href="/booking/list" class="nav-link">
									<i class="fa-solid fa-circle-user fa-lg"></i>
									<sec:authentication property="principal.member.lastName"/> 
									<sec:authentication property="principal.member.firstName"/> 
									様
								</a>
							</li>
						</ul>
					</div>
				</sec:authorize>
			</div>
        </div>
    </header>
	<p class="message">
		<c:out value="${message}" />
	</p>
	<button id="top-btn" onclick="topFunction()"  title="Go to top"><i class="fa-solid fa-arrow-up fa-lg" style="color: #ffffff;"></i></button>

<script>
let topBtn = document.getElementById("top-btn");

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	  topBtn.style.display = "block";
  } else {
	  topBtn.style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>