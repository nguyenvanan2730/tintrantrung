<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<p>以下の情報を削除します。よろしいですか？</p>
			<dl>
				<dt>路線情報</dt>
				
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
					<c:out value="${routeForm.price}"/>
				</dd>
				
				
				<dt><spring:message code="routeForm.busId"/></dt>
				<dd>
					<c:out value="${routeForm.busId}"/>
					<c:out value="${bus.columnNum}列シート✕${bus.rowNum}"/>
				</dd>
				
				<dt><spring:message code="routeForm.runStartDate"/></dt>
				<dd>
					<fmt:formatDate pattern="yyyy年MM月dd日" value="${routeForm.runStartDate}" />
				</dd>
				
				<dt><spring:message code="routeForm.runEndDate"/></dt>
				<dd>
					<fmt:formatDate pattern="yyyy年MM月dd日" value="${routeForm.runEndDate}" />
				</dd>

			</dl>
	
	</div>
	<form:form modelAttribute="routeForm">
		<input type="submit" value="路線削除確認" formaction="delete?routeId=${route.routeId}">
		<input type="submit" value="戻る" formaction="/route/list">
	</form:form>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
