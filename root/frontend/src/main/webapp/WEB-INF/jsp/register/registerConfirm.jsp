<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../resources/css/register.css">
<title>登録確認</title>
<section class="register my-4 p-4">
	<div class="container">
		<div class="row">
			<label class="text-center mb-2 " class="form-label">会員登録確認</label>
			<label id="register" class="text-center mb-3 " class="form-label">以下の内容で登録します。よろしいですか？</label>
			<form>
				<fieldset disabled>
					<div class="input-group mb-3">
						<input type="" class="form-control" placeholder="<c:out value="${registerForm.lastName}"/>">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="<c:out value="${registerForm.firstName}"/>"
							aria-label="Recipient's username" aria-describedby="basic-addon2">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="<c:out value="${registerForm.tel}"/>">
					</div>

					<div class="input-group mb-2">
						<input type="email" class="form-control" placeholder="<c:out value="${registerForm.email}"/>">
					</div>

					<div class="input-group mb-3">
						<input type="password" class="form-control"
							placeholder="●●●●●●●●●●●●●●">
					</div>

					<div class="input-group mb-3">
						<input type="password" class="form-control"
							placeholder="●●●●●●●●●●●●●●">
					</div>
				</fieldset>
			</form>
			
			<form:form modelAttribute="registerForm">
				<form:hidden path="firstName" />
				<form:hidden path="lastName" />
				<form:hidden path="tel" />
				<form:hidden path="email" />
				<form:hidden path="password" />
				<form:hidden path="matchingPassword" />
				<div class="btn">
					<input id="button" class="btn" type="submit" value="登録" formaction="insert"> 
					<input id="button" class="btn" type="submit" value="戻る" formaction="input">
				</div>
			</form:form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

