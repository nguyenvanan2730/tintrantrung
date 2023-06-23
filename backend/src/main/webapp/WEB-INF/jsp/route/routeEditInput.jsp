<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<h1>路線変更</h1>
<p>路線情報</p>
<div id="section">
	<div id="article">	
		<form:form modelAttribute="routeForm">
			<dl>
				<dt><spring:message code="routeForm.routeId"/></dt>
				<dd>
					<c:out value="${route.routeId}"/>
				</dd>
			
				<dt><spring:message code="routeForm.departureBusStopId"/></dt>
				<dd>
					<form:errors path="departureBusStopId" element="p"/>
					<form:select path="departureBusStopId">
					<form:option value=""/>
					<form:options items="${busStopList}" itemValue = "busStopId" itemLabel="busStopName"/>
					</form:select>
				</dd>
				<dt><spring:message code="routeForm.departureTime"/></dt>
				<dd>
					<form:errors path="departureTime" element="p"/>
					<form:input path="departureTime" placeholder="HH:MM"/>
				</dd>
				<dt><spring:message code="routeForm.arrivalBusStopId"/></dt>
				<dd>
					<form:errors path="arrivalBusStopId" element="p"/>
					<form:select path="arrivalBusStopId">
					<form:option value="" />
					<form:options items="${busStopList}" itemValue = "busStopId" itemLabel="busStopName"/>
					</form:select>
					
				</dd>
				<dt><spring:message code="routeForm.arrivalTime"/></dt>
				<dd>
					<form:errors path="arrivalTime" element="p"/>
					<form:input path="arrivalTime" placeholder="HH:MM"/>
				</dd>
				<dt><spring:message code="routeForm.price"/></dt>
				<dd>
					<form:errors path="price" element="p"/>
					<form:input path="price"/>
				</dd>
				<dt><spring:message code="routeForm.busId"/></dt>
				<dd>
					<form:errors path="busId" element="p"/>
					<form:select path="busId">
					<form:option value="" />
					<form:options items="${busList}" itemValue = "busId" itemLabel= "fullNameLabel"/>
					</form:select>
				</dd>
				<dt><spring:message code="routeForm.runStartDate"/></dt>
				<dd>
					<form:errors path="runStartDate" element="p"/>
					<form:input path="runStartDate" placeholder="YYYYMMDD"/>
				</dd>
				<dt><spring:message code="routeForm.runEndDate"/></dt>
				<dd>
					<form:errors path="runEndDate" element="p"/>
					<form:input path="runEndDate" placeholder="YYYYMMDD"/>
				</dd>
			</dl>
			<input type="submit" value="更新" formaction="confirm?routeId=${route.routeId}"/>
			<input type="submit" value="戻る" formaction="/route/list"/>
		</form:form>
	</div>
	
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>