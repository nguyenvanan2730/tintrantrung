<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section" class="container">
	<div id="article" class="card">
		<h3>路線更新確認</h3>
		<div class="form-container content">
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.routeId" />
					</label>
					<div class="col-sm-8">
						<c:out value="${route.routeId}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.departureBusStopId" />
					</label>
					<div class="col-sm-8">
						<c:out value="${departureBusStop.busStopName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.departureTime" />
					</label>
					<div class="col-sm-8">
						<c:out value="${routeForm.departureTime}" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.arrivalBusStopId" />
					</label>
					<div class="col-sm-8">
						<c:out value="${arrivalBusStop.busStopName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.arrivalTime" />
					</label>
					<div class="col-sm-8">
						<c:out value="${routeForm.arrivalTime}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.price" />
					</label>
					<div class="col-sm-8">
						<fmt:formatNumber pattern="#,###" value="${routeForm.price}" />
						円
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.busId" />
					</label>
					<div class="col-sm-8">
						<c:out value="${bus.fullNameLabel}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.runStartDate" />
					</label>
					<div class="col-sm-8">
						<fmt:formatDate pattern="yyyy年MM月dd日"
							value="${routeForm.runStartDate}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4"> <spring:message
							code="routeForm.runEndDate" />
					</label>
					<div class="col-sm-8">
						<fmt:formatDate pattern="yyyy年MM月dd日"
							value="${routeForm.runEndDate}" />
					</div>
				</div>

			</div>
			<p class="question">以上の内容で更新します。よろしいですか？</p>

			<form:form modelAttribute="routeForm">
				<form:hidden path="departureBusStopId" />
				<form:hidden path="departureTime" />
				<form:hidden path="arrivalBusStopId" />
				<form:hidden path="arrivalTime" />
				<form:hidden path="price" />
				<form:hidden path="busId" />
				<form:hidden path="runStartDate" />
				<form:hidden path="runEndDate" />
				<div class="form-buttons">
					<input type="submit" class="btn btn-primary" value="OK"
						formaction="update?routeId=${route.routeId}" /> <input
						type="submit" class="btn btn-warning" value="戻る"
						formaction="input?routeId=${route.routeId}" />
				</div>
			</form:form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>