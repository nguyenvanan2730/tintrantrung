<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section" class="container">
	<div id="article" class="card">
		<h3>バス削除確認</h3>
		<p class="question">以下の情報を削除します。よろしいですか？</p>
		<div class="form-container content" style="width:300px">

				<dt>
					<spring:message code="busForm.rowNum" />
				</dt>
				<dd style="text-align:center">
					<c:out value="${busForm.rowNum}" />
				</dd>
				<dt>
					<spring:message code="busForm.columnNum" />
				</dt>
				<dd style="text-align:center">
					<c:out value="${busForm.columnNum}" />
				</dd>
				<p style="margin-top: 20px;"><strong>ナンバー</strong></p>
					<div class="bus-number" style="border: 1.5px solid black; border-radius: 8px; padding: 20px;text-align:center">
					<p>
					<span><c:out value="${busForm.numberPlace}" /></span>
					<span><c:out value="${busForm.numberDivision}" /></span>
					</p>
					<p style="font-size:30px">
					<span><c:out value="${busForm.numberKana}" /></span>
					<span><c:out value="${busForm.numberFirstHalf}"/>-<c:out value="${busForm.numberLatterHalf}" /></span>
					</p>
		</div>
		<div class="button" style="margin:20px;display: flex; justify-content: center;">
		<form:form modelAttribute="busForm">
			<form:hidden path="busId" />
			<input type="submit" value="バス削除確認" class="btn btn-primary"
				formaction="delete" style="margin-right: 20px;">
			<input type="submit" value="戻る" class="btn btn-warning"
				formaction="/busList/index" style="margin-left: 20px;">
		</form:form>
	</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
