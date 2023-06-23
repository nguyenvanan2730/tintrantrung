<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<style>
  .required::after {
    content: "*";
    color: red;
    margin-left: 5px;
  }
</style>
<div id="section" class="container">

		<h3>路線登録</h3>
		<div id="article">
			<div class="form-container content">
				<form>
					<form:form modelAttribute="routeForm">
						<div class="form-group">
							<label><spring:message
									code="routeForm.departureBusStopId" /><span class="required"></span></label>
							<form:select path="departureBusStopId" class="form-control">
								<form:option value="" label="出発停留所を選択してください" />
								<form:options items="${busStopList}" itemValue="busStopId"
									itemLabel="busStopName" />
							</form:select>
							<form:errors path="departureBusStopId" element="p"
								class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.departureTime" /><span class="required"></span></label>
							<form:input path="departureTime" placeholder="HH:MM"
								class="form-control" />
							<form:errors path="departureTime" element="p" class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.arrivalBusStopId" /><span class="required"></span></label>
							<form:select path="arrivalBusStopId" class="form-control">
								<form:option value="" label="到着停留所を選択してください" />
								<form:options items="${busStopList}" itemValue="busStopId"
									itemLabel="busStopName" />
							</form:select>
							<form:errors path="arrivalBusStopId" element="p"
								class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.arrivalTime" /><span class="required"></span></label>
							<form:input path="arrivalTime" placeholder="HH:MM"
								class="form-control" />
							<form:errors path="arrivalTime" element="p"
								class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.price" /><span class="required"></span></label>
							<form:input path="price" class="form-control" />
							<form:errors path="price" element="p" class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.busId" /><span class="required"></span></label>
							<form:select path="busId" class="form-control">
								<form:option value="" label="バスを選択してください" />
								<form:options items="${busList}" itemValue="busId"
									itemLabel="fullNameLabel" />
							</form:select>
							<form:errors path="busId" element="p" class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.runStartDate" /><span class="required"></span></label>
							<form:input path="runStartDate" placeholder="YYYYMMDD"
								class="form-control" />
							<form:errors path="runStartDate" element="p" class="text-danger" />
						</div>
						<div class="form-group">
							<label><spring:message code="routeForm.runEndDate" /></label>
							<form:input path="runEndDate" placeholder="YYYYMMDD"
								class="form-control" />
							<form:errors path="runEndDate" element="p" class="text-danger" />
						</div>
						<p style="color:red; font-size:14px">*必須項目</p>
						<div>
							<input type="submit" value="登録" class="btn btn-primary"formaction="confirm?routeId=${route.routeId}" />
							<input type="submit" value="戻る" class="btn btn-warning" formaction="/route/list" />
						</div>
					</form:form>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>