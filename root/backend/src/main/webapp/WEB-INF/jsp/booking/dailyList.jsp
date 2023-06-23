<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.first-table td {
	font-weight: bold;
}

.warning-row {
	background-color: #fcf8e3;
}
</style>

<div id="section" class="container">
	<div class="col-md-12">
		<h2>予約状況管理</h2>
		<div id="article">
			<form:form class="form-inline" method="get"
				modelAttribute="routeSearchForm" id="searchForm" action="dailyList">
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
					class="btn btn-primary">

				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert"
						style="margin: 10px; width: 50%">
						<form:errors path="*" element="p" />
					</div>
				</c:if>
			</form:form>
		</div>

		<c:if test="${bus != null}">
			<table class="table table-bordered"
				style="margin: 20px; width: 400px">
				<tr>
					<td>路線</td>
					<td><c:out value="${bus.departureBusStopName}" />(<c:out
							value="${bus.departureTime}" />)～<c:out
							value="${bus.arrivalBusStopName}" />(<c:out
							value="${bus.arrivalTime}" />)</td>
				</tr>
				<tr>
					<td>バスのナンバープレート</td>
					<td><c:out value="${bus.busFullName}" /></td>
				</tr>
				<tr>
					<td>座席数</td>
					<td><c:out value="${bus.totalSeats}" /></td>
				</tr>
				<tr>
					<td>予約席数</td>
					<td><c:out value="${bus.reservedSeats}" /></td>
				</tr>

			</table>
		</c:if>
		<br>

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
					<td colspan="8">
						<p>該当する情報が存在しませんでした。</p>
					</td>
				</tr>
			</c:if>
		</table>

		<div class="button-row">
			<div class="col-md-4 text-left">
				<button class="btn btn-primary" onclick="goBack()">戻る</button>
			</div>
			<div class="col-md-8 text-right">
				<button class="btn btn-default" onclick="window.print()">印刷</button>
			</div>
		</div>
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
		window.location.href = "/user/list";
	}
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>