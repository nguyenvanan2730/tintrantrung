<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/history-cancel.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約履歴</title>
</head>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
<body>
	<div id="section" class="container mb-5">
		<div class="col-md-12">
			<div id="article">
				<h4 class="padding-30">予約履歴</h4>
				<div class="table-container">
					<table id="booking-table" class="table table-striped">
						<thead>
							<tr>
								<th>予約番号</th>
								<th>日付</th>
								<th>出発</th>
								<th>到着</th>
								<th>合計</th>
								<th style="width: 30%">座席</th>
								<th>キャンセル</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bookingHistory}" var="booking"
								varStatus="status">
								<c:if
									test="${status.index == 0 || booking.reservationNo != bookingHistory[status.index - 1].reservationNo}">
									<tr>
										<td>${booking.reservationNo}</td>
										<td><fmt:formatDate
												value="${booking.reservationDatetime}" pattern="yyyy年MM月dd日" /></td>
										<td><c:out value="${booking.departureBusStopName}" /> <c:out
												value="(${booking.departureTime})" /></td>
										<td><c:out value="${booking.arrivalBusStopName}" /> <c:out
												value="(${booking.arrivalTime})" /></td>
										<td>¥<fmt:formatNumber value="${booking.price}"
												pattern="#,###" /></td>
										<td><c:forEach var="seat" items="${booking.seatNames}"
												varStatus="seatStatus">
        ${seat}${not seatStatus.last ? ', ' : ''}
    </c:forEach></td>
										<td><c:set var="currentTime"
												value="<%=new java.util.Date().getTime()%>" /> <c:set
												var="reservationTime"
												value="${booking.reservationDatetime.time}" /> <c:set
												var="twentyFourHours" value="86400000" /> <c:if
												test="${currentTime < (reservationTime - twentyFourHours)}">
												<a
													href="/bookingCancel/confirm?reservationNo=${booking.reservationNo}"
													class="btn btn-danger">キャンセル</a>
											</c:if></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<a id="button" href="/" class="btn btn-primary">ホームページへ戻る</a>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#booking-table').DataTable({
				language : {
					"emptyTable" : "予約履歴はありません。",
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
</body>
</html>
