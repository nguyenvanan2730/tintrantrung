<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/resources/css/seat-styles.css">
<title>予約確認</title>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
<div id="section" class="container">
	<h3 class="padding-30">予約確認</h3>
	<table border="1">
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
	</table>
	<p class="price">
		<span>１席あたりの料金: ¥</span>
		<fmt:formatNumber pattern="#,###" value="${route.price}" />
	</p>

	<table border="1">
		<tr>
			<td class="row-title">座席</td>
			<td><c:forEach var="seat" items="${selectedSeats}"
					varStatus="status">
					<span>${seat}</span>
					<c:if test="${not status.last}">, </c:if>
				</c:forEach></td>
		</tr>
	</table>

	<p class=total-price>
		<span>小計: ¥</span>
		<fmt:formatNumber pattern="#,###"
			value="${route.price*selectedSeats.size()}" />
	</p>
	<p class="text-danger">上記で予約します。よろしいですか？</p>

	<form action="/finish" method="post">
		<fmt:formatDate value="${reservationDatetime}" pattern="yyyy-MM-dd"
			var="strDate" />
		<input type="hidden" name="reservationDatetime" value="${strDate}" />
		<input type="hidden" name="routeId" value="${route.routeId}" />
		<c:forEach items="${selectedSeats}" var="selectedSeat"
			varStatus="status">
			<input type="hidden" name="selectedSeats" value="${selectedSeat}" />
		</c:forEach>
		<div class="button-row-confirm">
			<input id="button" class="btn btn-primary" type="submit" value="OK"
				formaction="finish"> 
			<input id="button" class="btn btn-warning"
				type="submit" value="戻る" formaction="select">
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
