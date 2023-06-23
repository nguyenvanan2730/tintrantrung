<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
  .required::after {
    content: "*";
    color: red;
    margin-left: 5px;
  }
</style>
<div id="section" class="container">
		<div id="article" class="card">
			<h3>路線更新</h3>
			<div class="form-container content">
				<form:form modelAttribute="routeForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-4"><spring:message code="routeForm.routeId" /><span class="required"></span></label>
						<div class="col-sm-8"><c:out value="${route.routeId}" /></div>
					</div>

					<div class="form-group">
						<label class="col-sm-3"><spring:message code="routeForm.departureBusStopId" /><span class="required"></span></label>
						<div class="col-sm-3">
							<form:select path="departureBusStopId" class="form-control">
								<form:option value="" label="選択してください" />
								<form:options items="${busStopList}" itemValue="busStopId"
									itemLabel="busStopName" />
							</form:select>
							<form:errors path="departureBusStopId" element="p" class="error-message"/>
						</div>
						<label class="col-sm-3"><spring:message code="routeForm.departureTime" /><span class="required"></span></label>
						<div class="col-sm-3">
							<form:input path="departureTime" placeholder="HH:MM"
								class="form-control" /><form:errors path="departureTime" element="p" class="error-message"/>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3"><spring:message code="routeForm.arrivalBusStopId" /><span class="required"></span></label>
						<div class="col-sm-3">
							<form:select path="arrivalBusStopId" class="form-control">
								<form:option value="" label="選択してください" />
								<form:options items="${busStopList}" itemValue="busStopId"
									itemLabel="busStopName" />
							</form:select>
							<form:errors path="arrivalBusStopId" element="p" class="error-message"/>
						</div>
							<label class="col-sm-3">
							<spring:message code="routeForm.arrivalTime" /><span class="required"></span>
						</label>
							<div class="col-sm-3">
							<form:input path="arrivalTime" placeholder="HH:MM"
								class="form-control" />
							<form:errors path="arrivalTime" element="p" class="error-message"/>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-3"><spring:message code="routeForm.price" /><span class="required"></span></label>
						<div class="col-sm-3">
							<form:input path="price" class="form-control" />
							<form:errors path="price" element="p" class="error-message"/>
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-3">
							<spring:message code="routeForm.busId" /><span class="required"></span>
						</label>
						<div class="col-sm-6">
							<form:select path="busId" class="form-control">
								<form:option value="" />
								<form:options items="${busList}" itemValue="busId"
									itemLabel="fullNameLabel" />
							</form:select>
							<form:errors path="busId" element="p" class="error-message"/>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3"><spring:message code="routeForm.runStartDate" /><span class="required"></span>
						</label>
							<div class="col-sm-3">
							<form:input path="runStartDate" class="form-control" readonly="true"/>
							<form:errors path="runStartDate" element="p" class="error-message"/>
						</div>
						<label class="col-sm-3">
							<spring:message code="routeForm.runEndDate" />
						</label>
						<div class="col-sm-3">
							<form:input path="runEndDate" placeholder="YYYYMMDD"
								class="form-control"/>
							<form:errors path="runEndDate" element="p" class="error-message"/>								
						</div>
					</div>
					<p style="color:red; font-size:14px">*必須項目</p>
					<input type="submit" value="更新" class="btn btn-success" formaction="confirm?routeId=${route.routeId}" />
					<input type="submit" value="戻る" class="btn btn-warning" formaction="/route/list" />
				</form:form>
			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
