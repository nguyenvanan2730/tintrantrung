<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="./resources/css/stylelogin.css">

<div class="login-wrapper" id="login">
	<div class="bcontainer">
		<div class="login">
			<div class="login-wrapper-title">

				<div class="error-message">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
				<h1>ログイン</h1>
			</div>
			<div class="login-form">
				<form:form modelAttribute="loginForm" action="auth">
					<form:errors path="*" />
					<div class="form-group">
						<p>ログインID</p>
						<div class="input-box">
							<form:input path="username" />
						</div>
					</div>
					<div class="form-group">
						<p>パスワード</p>
						<div class="input-box">
							<form:password path="password" />
						</div>
					</div>
					<input type="submit" value="ログイン" class="btn btn-submit">
				</form:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
