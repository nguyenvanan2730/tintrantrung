<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<h1>路線登録確認</h1>
<p>以下の内容で更新します。よろしいですか？</p>
<div id="section">
	<div id="article">
			<dl>
				<dt><spring:message code="routeForm.routeId"/></dt>
				<dd>
					<c:out value="${route.routeId}"/>
				</dd>
			
				<dt><spring:message code="routeForm.departureBusStopId"/></dt>
				<dd>
					<c:out value="${departureBusStop.busStopName}"/>
				</dd>
				<dt><spring:message code="routeForm.departureTime"/></dt>
				<dd>
					<c:out value="${routeForm.departureTime}"/>
				</dd>
				<dt><spring:message code="routeForm.arrivalBusStopId"/></dt>
				<dd>
					<c:out value="${arrivalBusStop.busStopName}"/>
				</dd>
				<dt><spring:message code="routeForm.arrivalTime"/></dt>
				<dd>
					<c:out value="${routeForm.arrivalTime}"/>
				</dd>
				<dt><spring:message code="routeForm.price"/></dt>
				<dd>
					<fmt:formatNumber pattern="#,###" value="${routeForm.price}"/>円
				</dd>
				<dt><spring:message code="routeForm.busId"/></dt>
				<dd>
					<c:out value="${bus.fullNameLabel}"/>
				</dd>
				<dt><spring:message code="routeForm.runStartDate"/></dt>
				<dd>
					<fmt:formatDate pattern="yyyy年MM月dd日" value="${routeForm.runStartDate}"/>
				</dd>
				<dt><spring:message code="routeForm.runEndDate"/></dt>
				<dd>
					<fmt:formatDate pattern="yyyy年MM月dd日" value="${routeForm.runEndDate}"/>
				</dd>
			</dl>
	</div>
	<form:form modelAttribute="routeForm">
		<form:hidden path="departureBusStopId"/>
		<form:hidden path="departureTime"/>
		<form:hidden path="arrivalBusStopId"/>
		<form:hidden path="arrivalTime"/>
		<form:hidden path="price"/>
		<form:hidden path="busId"/>
		<form:hidden path="runStartDate"/>
		<form:hidden path="runEndDate"/>
		<input type="submit" value="OK" formaction="update?routeId=${route.routeId}"/>
		<input type="submit" value="戻る" formaction="input"/>
	</form:form>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>