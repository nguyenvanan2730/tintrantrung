<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<title>ログイン</title>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
 
    <section class="login my-4 p-4">
        <div class="container">
		<form:form modelAttribute="loginForm">
			<form:errors path="*" />
			<div class="row">
				<label for="basic-url" class="text-center mb-3 " class="form-label">ログイン</label>
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					<div id="error" class="alert alert-danger mb-2" role="alert">
						${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
				</c:if>
				<div class=" input-group mb-3">
					<form:input type="email" path="username" class="form-control"
						placeholder="ログインID (メールアドレス)" />
				</div>
				<div class="input-group mb-3">
					<form:password path="password" class="form-control"
						placeholder="パスワード" />
				</div>
				<div class="input-group mb-3">
					<input type="submit" id="button" formaction="auth"
						class="form-control" value="ログイン" class="btn">
				</div>

				<label id="register" class="input-group"> 
					会員登録がお済みでないお客様<a href="/register/input" id="register-btn">&nbsp;新規会員登録</a>
				
				</label>
			</div>
		</form:form>
	</div>
    </section>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>