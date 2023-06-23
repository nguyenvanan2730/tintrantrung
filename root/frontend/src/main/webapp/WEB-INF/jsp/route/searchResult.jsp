<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<script type="text/javascript" src="../resources/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.ja.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/search-result.css">

<title>検索結果</title>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
 
<!-- SEARCH BOX -->
<section>
	<div class="search-box ">
		<div class="row mb-2 p-4">
			<div class="container">
					<form:form method="get" modelAttribute="routeSearchForm"
						id="searchForm" class="search-form" action="result">
						<div class="form-group">
							<label><i class="fa-solid fa-location-dot" style="color: #444444;"></i>&nbsp;出発地</label>
							<form:select path="departureBusStopName" id="input" class="form-control">
								<form:option value="" label="出発地を選択する" />
								<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
							</form:select>
						</div>
						<div class="form-group">
							<label><i class="fa-solid fa-location-dot" style="color: #444444;"></i>&nbsp;到着地</label>
							<form:select path="arrivalBusStopName" id="input" class="form-control">
								<form:option value="" label="到着地を選択する" />
								<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
							</form:select>
						</div>
						<div class="form-group">
							<label><i class="fa-solid fa-calendar-days" style="color: #444444;"></i>&nbsp;日付</label> 
							<input id="datepicker" type="text" path="date" name="date" value="${date}" class="form-control" placeholder="日付を選択する">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary" id="search-button">
								<i class="fa-sharp fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>&nbsp;高速バス検索
							</button>
						</div>
					</form:form>
			</div>
		</div>
	</div>
</section>

<!-- SEARCH RESULT -->
<section class="result-title">
	<div class="container py-3">
		<h4 class="padding-30">検索結果</h4>
	</div>
</section>

<section class="result">
	<div class="container mb-5">
		<table id="table" class="table table-hover">
			<thead class="table-light">
				<tr>
					<th>No.</th>
					<th>出発</th>
					<th>到着</th>
					<th>シート</th>
					<th>空席数</th>
					<th>料金</th>
					<th>予約</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${routeList}" var="r">
					<tr>
						<td><c:out value="${r.rowNumber}" /></td>
						<td><c:out
								value="${r.departureBusStopName}(${r.departureTime})" /></td>
						<td><c:out value="${r.arrivalBusStopName}(${r.arrivalTime})" /></td>
						<td><c:out value="${r.columnNum}列" /></td>
						<td><c:out value="${r.availableSeats}" /></td>
						<td>¥<fmt:formatNumber value="${r.price}" pattern="#,###" /></td>
						<td><c:choose>
								<c:when test="${r.availableSeats == 0}">
									<button type="button" id="disabled-btn" class="btn btn-danger"
										disabled="disabled">満席</button>
								</c:when>
								<c:otherwise>
									<a
										href="/seat/select?reservationDatetime=
									<c:out value="${dateStr}"/>&routeId=
									<c:out value="${r.routeId}"/>"
										id="booking-btn" class="btn">予約</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

<script>
$(function() {
	var minDate = new Date();
	var maxDate = new Date();
	minDate.setDate(minDate.getDate() + 1);
	maxDate.setDate(maxDate.getDate() + 90);

	$('#datepicker').datepicker({
		format : "yyyy年mm月dd日",
		language : "ja",
	    todayBtn: true,
	    clearBtn: true,
		todayHighlight : true,
		daysOfWeekHighlighted : "0,6",
		startDate : minDate,
		endDate : maxDate
	});
});
</script>

<script
		src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script>
	$(document).ready(function() {
		$('#table').DataTable({
			language : {
				"emptyTable" : "該当する情報が存在しませんでした。",
				"info" : " _TOTAL_ 件中 _START_ から _END_ まで表示",
				"infoEmpty" : " 0 件中 0 から 0 まで表示",
				"infoFiltered" : "（全 _MAX_ 件より抽出）",
				"infoThousands" : ",",
				"lengthMenu" : "_MENU_ 件表示",
				"loadingRecords" : "読み込み中...",
				"processing" : "処理中...",
				"search" : "検索:",
				"zeroRecords" : "一致するレコードがありません",
				"paginate" : {
					"first" : "先頭",
					"last" : "最終",
					"next" : "次",
					"previous" : "前"
				},
			}
		});
	});
</script>
