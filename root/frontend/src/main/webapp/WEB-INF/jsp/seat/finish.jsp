<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/resources/css/seat-styles.css">
<title>予約完了</title>
<!-- BANNER -->
<section id="banner" class="container-fluid banner">
	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img"
		alt="...">
</section>
<div id="section" class="container">
	<h3 class="padding-30">予約完了</h3>
	<table border="1">
		<tr>
		<td class="row-title">予約番号</td>
		<td><c:out value="${reservation.reservationNo}" /><fmt:formatDate value="${reservationDatetime}" pattern="yyyyMMdd" /></td>
		</tr>
		<tr>
			<td class="row-title">日付</td>
			<td><fmt:formatDate value="${reservationDatetime}"
					pattern="yyyy年MM月dd日" /></td>
		</tr>
		<tr>
			<td class="row-title">出発</td>
			<td><c:out value="${route.departureBusStopName}" /> (<c:out
					value="${route.departureTime}" />)</td>
		</tr>
		<tr>
			<td class="row-title">到着</td>
			<td><c:out value="${route.arrivalBusStopName}" /> (<c:out
					value="${route.arrivalTime}" />)</td>
		</tr>
		<tr>
			<td class="row-title">座席</td>
			<td><c:forEach var="seat" items="${selectedSeats}"
					varStatus="status">
					<span>${seat}</span>
					<c:if test="${not status.last}">, </c:if>
				</c:forEach></td>
		</tr>
	</table>
	<p class="total-price">
		<span>小計: ¥</span>
		<fmt:formatNumber pattern="#,###"
			value="${route.price*selectedSeats.size()}" />
	</p>
	<p class="text-danger">予約が完了しました。この画面を印刷して当日持参してください。</p>

	<div class="button-row-confirm">
		<a id="button" class="btn btn-primary" href="/" role="button">OK</a>
		<button id="button" class="btn btn-outline-dark"
			onclick="window.print()">印刷</button>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
