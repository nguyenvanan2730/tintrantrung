<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<p>以下の情報を削除します。よろしいですか？</p>
			<dl>
				<dt><spring:message code="busForm.rowNum"/></dt>
				<dd>
					<c:out value="${busForm.rowNum}"/>
				</dd>
				<dt><spring:message code="busForm.columnNum"/></dt>
				<dd>
					<c:out value="${busForm.columnNum}"/>
				</dd>
				<dt><spring:message code="busForm.numberPlace"/></dt>
				<dd>
					<c:out value="${busForm.numberPlace}"/>
				</dd>
				<dt><spring:message code="busForm.numberDivision"/></dt>
				<dd>
					<c:out value="${busForm.numberDivision}"/>
				</dd>
				<dt><spring:message code="busForm.numberKana"/></dt>
				<dd>
					<c:out value="${busForm.numberKana}"/>
				</dd>
				<dt><spring:message code="busForm.numberFirstHalf"/></dt>
				<dd>
					<c:out value="${busForm.numberFirstHalf}"/>
				</dd>
				<dt><spring:message code="busForm.numberLatterHalf"/></dt>
				<dd>
					<c:out value="${busForm.numberLatterHalf}"/>
				</dd>
			</dl>
	</div>
	<form:form modelAttribute="busForm">
		<form:hidden path="busId"/>
		<input type="submit" value="バス削除確認" formaction="delete">
		<input type="submit" value="戻る" formaction="/busList/index">
	</form:form>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
