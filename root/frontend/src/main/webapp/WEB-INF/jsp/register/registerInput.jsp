<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../resources/css/register.css">
<title>登録入力</title>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
 
  <section class="register my-4 p-4">
        <div class="container">
		<form:form modelAttribute="registerForm">
			<div class="row">
				<label for="basic-url" class="text-center mb-3 " class="form-label">新規会員登録</label>
				<div class="input-group mb-3">
					<form:input path="lastName" type="text" class="form-control" placeholder="姓" />
				</div>
				<div class="input-group mb-1">
					<form:errors path="lastName" element="p" id="error" class="form-control alert alert-danger" role="alert" />
				</div>

				<div class="input-group mb-3">
					<form:input path="firstName" type="text" class="form-control" placeholder="名" />
				</div>
				<div class="input-group mb-1">
					<form:errors path="firstName" element="p" id="error" class="form-control alert alert-danger" role="alert" />
				</div>

				<div class="input-group mb-3">
					<form:input path="tel" type="text" class="form-control" placeholder="電話番号（例：080-1234-5678）" />
				</div>
				<div class="input-group mb-1">
					<form:errors path="tel" element="p" id="error" class="form-control alert alert-danger" role="alert" />
				</div>

				<div class="input-group mb-3">
					<form:input type="email" path="email" class="form-control" placeholder="ログインID（メールアドレス）" />
				</div>
				<div class="input-group mb-1">
					<form:errors path="email" element="p" id="error" class="form-control alert alert-danger" role="alert" />
				</div>

				<div class="input-group mb-3">
					<form:input type="password" path="password" class="form-control" placeholder="パスワード" />
				</div>
				<div class="input-group mb-1">
					<form:errors path="password" element="p" id="error" class="form-control alert alert-danger" role="alert"/>
				</div>

				<div class="input-group mb-3">
					<form:input type="password" path="matchingPassword" class="form-control" placeholder="パスワード確認" />
				</div>
					<div class="input-group mb-1">
					<form:errors path="matchingPassword" element="p" id="error" class="form-control alert alert-danger" role="alert"/>
				</div>

				<div class="btn">
					<input id="button" class="btn btn-outline-secondary"
						type="submit" value="登録" formaction="confirm"> <input
						id="button" class="btn" type="submit" value="戻る" formaction="/">
				</div>
			</div>
		</form:form>
	</div>
    </section>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
