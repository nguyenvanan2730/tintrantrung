<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/history-cancel.css">

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>キャンセル確認</title>
</head>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
<body>
	<div id="section" class="container">
		<div id="article">
			<h4 class="padding-30">キャンセル確認</h4>
			<div class="form-container content mb-4">
				<form action="/bookingCancel/cancel" class="form-horizontal">
					<c:forEach var="booking" items="${bookingHistory}">
						<div class="form-group">
							<dl class="row">
								<dt class="col-sm-3">日付</dt>
								<dd class="col-sm-9">${booking.reservationDatetime}</dd>
							</dl>
						</div>
						<div class="form-group">
							<dl class="row">
								<dt class="col-sm-3">予約番号</dt>
								<dd class="col-sm-9">${booking.reservationNo}</dd>
							</dl>
						</div>
						<div class="form-group">
							<dl class="row">
								<dt class="col-sm-3">出発</dt>
								<dd class="col-sm-9">${booking.departureBusStopName} (${booking.departureTime})</dd>
							</dl>
						</div>
						<div class="form-group">
							<dl class="row">
								<dt class="col-sm-3">到着</dt>
								<dd class="col-sm-9">${booking.arrivalBusStopName} (${booking.arrivalTime})</dd>
							</dl>
						</div>
						<div class="form-group">
							<dl class="row">
								<dt class="col-sm-3">座席</dt>
								<dd class="col-sm-9">
									<c:forEach var="seat" items="${booking.seatNames}" varStatus="seatStatus">
										${seat}${!seatStatus.last ? ', ' : ''}
									</c:forEach>
								</dd>
							</dl>
						</div>
						<div class="form-group">
							<dl class="row">
								<dt class="col-sm-3">合計</dt>
								<dd class="col-sm-9">
									¥<fmt:formatNumber value="${booking.price}" pattern="#,###" />
								</dd>
							</dl>
						</div>
						<input type="hidden" name="reservationNo" value="${booking.reservationNo}" />
					</c:forEach>
				</form>
				<p class="question">以上の予約をキャンセルしますか？</p>
				<form action="/bookingCancel/cancel" method="post">
					<c:forEach var="booking" items="${bookingHistory}">
						<input type="hidden" name="reservationNo" value="${booking.reservationNo}" />
					</c:forEach>
					<input id="cacel-button" type="submit" class="btn btn-primary" value="OK" />
					<input id="cacel-button" type="submit" class="btn btn-warning" value="戻る" formaction="/booking/list" />
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
</body>
</html>
