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

		<div id="article">
			<h2>会員予約状況</h2>

			<table border="1" class="first-table">
				<tr class="warning-row">
					<td>会員ID</td>
					<td><c:out value="${member.memberId}" /></td>
				</tr>
				<tr class="warning-row">
					<td>氏名</td>
					<td><c:out value="${member.lastName}" /> <c:out
							value="${member.firstName}" /></td>
				</tr>
				<tr class="warning-row">
					<td>電話番号</td>
					<td>${member.tel}</td>
				</tr>
				<tr class="warning-row">
					<td>メールアドレス</td>
					<td>${member.email}</td>
				</tr>
			</table>
			<br>

			<table id="booking-table" border="1" class="table table-striped">
				<thead>
					<tr>
						<th scope="col">選択</th>
						<th scope="col">日付</th>
						<th scope="col">路線ID</th>
						<th scope="col">出発</th>
						<th scope="col">到着</th>
						<th scope="col">料金</th>
						<th scope="col">バスID</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${booking}" var="b">
						<tr>
							<td><input type="radio" name="selectedreservationNo"
								value="${b.reservationNo}"></td>
							<td><fmt:formatDate pattern="yyyy年MM月dd日"
									value="${b.reservationDatetime}" /></td>
							<td><c:out value="${b.routeId}" /></td>
							<td><c:out value="${b.departureBusStopName}" /> <c:out
									value="(${b.departureTime})" /></td>
							<td><c:out value="${b.arrivalBusStopName}" /> <c:out
									value="(${b.arrivalTime})" /></td>
							<td>¥ <fmt:formatNumber pattern="#,###"
									value="${b.totalPrice}" />
							</td>
							<td><c:out value="${b.busId}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="button-row">
				<button class="btn btn-primary" onclick="checkBooking()">日別線路予約状況</button>
				<a class="btn btn-warning" href="/user/list" role="button">戻る</a>
			</div>
		</div>
	</div>
</div>
<script
	src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script>
				$(document).ready(function() {
				$('#booking-table').DataTable({
					language : {
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
					function checkBooking() {
						var selectedreservationNo = document
								.querySelector('input[name="selectedreservationNo"]:checked');
						if (selectedreservationNo) {
							window.location.href = "/user/booking?reservationDatetime=";
						} else {
							alert("対象の予約を選択してください。");
						}
					}
					
				</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>