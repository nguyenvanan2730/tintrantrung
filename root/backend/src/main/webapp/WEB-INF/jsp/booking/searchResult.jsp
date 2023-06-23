<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section" class="container">
	<div class="col-md-12">
		<h3>予約状況管理</h3>
		<div class="magin-bottom-10">

			<form:form class="form-inline" method="get"
				modelAttribute="routeSearchForm" id="searchForm"
				action="searchResult">
				<div class="form-group">
					<label>路線</label>
					<form:select path="routeId" class="form-control">
						<form:option value="" label="路線を選択してください" />
						<form:options items="${routeList}" itemValue="routeId"
							itemLabel="routeFullName" />
					</form:select>

				</div>
				<div class="form-group">
					<label>日付</label> <input type="date" id="datepicker"
						class="form-control" path="reservationDate"
						value="${reservationDate}">
				</div>
				<input id="search-btn" type="submit" value="予約状況確認"
					class="btn btn-info">

				<c:if test="${hasErrors}">
					<div class="alert alert-danger" role="alert"
						style="margin: 10px; width: 50%">
						<form:errors path="*" element="p" />
					</div>
				</c:if>
		</div>
		</form:form>
		<c:if test ="${not empty reservationDate && not empty routeList}">
		<c:if test="${bus != null}">
			<table border="1" class="first-table magin-bottom-10">
				<tr class="warning-row">
					<td>路線</td>
					<td><c:out value="${bus.departureBusStopName}" />(<c:out
							value="${bus.departureTime}" />)～<c:out
							value="${bus.arrivalBusStopName}" />(<c:out
							value="${bus.arrivalTime}" />)</td>
				</tr>
				<tr class="warning-row">
					<td>バスのナンバープレート</td>
					<td><c:out value="${bus.busFullName}" /></td>
				</tr>
				<tr class="warning-row">
					<td>座席数</td>
					<td><c:out value="${bus.totalSeats}" /></td>
				</tr>
				<tr class="warning-row">
					<td>予約席数</td>
					<td><c:out value="${bus.reservedSeats}" /></td>
				</tr>

			</table>
		</c:if>


		<table id="booking-table" border="1" class="table table-striped">
			<thead>
				<tr>
					<th scope="col">順</th>
					<th scope="col">氏名</th>
					<th scope="col" style="width: 400px">予約座席名</th>
					<th scope="col">電話番号</th>
					<th scope="col">乗車確認</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members}" var="m" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td><c:out value="${m.fullName}" /></td>
						<td><c:forEach items="${m.seatNames}" var="seat"
								varStatus="status">
                        ${seat}<c:if test="${!status.last}">,</c:if>
							</c:forEach></td>
						<td><c:out value="${m.tel}" />
						<td></td>
					</tr>
				</c:forEach>
			</tbody>

			<c:if test="${empty members}">
				<tr>
					<td colspan="8" style="text-align: center; cssClass="text-danger" >
						<p >該当する情報が存在しませんでした。</p>
					</td>
				</tr>
			</c:if>
		</table>
		<div>
			<button class="btn btn-primary" onclick="window.print()">印刷</button>
		</div>
		</c:if>
	</div>
</div>
</div>

<script>
	$(document).ready(function() {
		$('#search-btn').click(function() {
			$('#datepicker').attr('name', 'date');
			$('#searchForm').submit();
		});

		$('#datepicker').datepicker({
			format : "yyyyMMdd",
			maxViewMode : 1,
			clearBtn : true,
			language : "ja",
			daysOfWeekHighlighted : "0"
		});
	});
	function goBack() {
		window.location.href = "/route/list";
	}
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>