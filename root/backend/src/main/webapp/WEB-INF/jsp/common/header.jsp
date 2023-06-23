<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BUS RESERVATION SYSTEM</title>
<script src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="/resources/css/jquery.dataTables.min.css" />
<script src="/resources/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/resources/css/font-awesome_5.15.3_css_all.min.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/styles.css" />
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-default navbar-toggleable-sm">
		<div class="container-fluid">
			<div class="navbar-header">
				<a id="logo" class="navbar-brand" href="/route/list"> <span> <img
						src="/resources/imgs/logo.png" alt="diamond bus">
				</span>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize access="hasRole('ROLE_MANAGER')">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><i class="fas fa-road"></i> 路線管理 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/route/list"><i class="fas fa-road"></i> 路線管理</a></li>
								<li><a href="/booking/search"><i class="fas fa-calendar-day"></i> 日別路線予約状況</a></li>
							</ul></li>
						<li><a href="/busList/index"><i class="fas fa-bus"></i>
								バス管理</a></li>
						<li><a href="/user/list"><i class="fas fa-users"></i>
								会員管理</a></li>
						<li><a href="/logout"><i class="fas fa-sign-out-alt"></i>
								ログアウト</a></li>
					</sec:authorize>
				</ul>

			</div>
	</nav>
	<p style="margin: auto; width: 600px; color: red; text-align: center">
		<c:out value="${message}" />
	</p>
</body>
</html>
