<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/seat-styles.css">
<title>座席指定</title>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>
<div id="section" class="container">
	<h3 class="padding-30">座席指定</h3>
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
	<p class=price>
		<span>１席あたりの料金: ¥</span>
		<fmt:formatNumber pattern="#,###" value="${route.price}" />
	</p>
	<p>予約する座席を選択して、予約ボタンを押下してください。</p>
	<div class="seat-wrapper">
	<div class="seat-area">
		<div class="handle_wrapper">
			<img src="/resources/imgs/hanlde_wrapper.jpg"
				class="handle-wrapper-img" />
			<div class="driving_seat">運転席</div>
		</div>
		<div class="bus-layout">
			<c:set var="numSeatsPerRow" value="${colNum}" />
			<c:choose>
				<c:when test="${numSeatsPerRow eq 3}">
					<style>
						.seat[data-seat*='A'], 
						.seat[data-seat*='B'] {
							margin-right: 30px;
						}
				</style>
				</c:when>
				<c:when test="${numSeatsPerRow eq 4}">
					<style>
						.seat[data-seat*='B'] {
							margin-right: 30px;
							}
						</style>
				</c:when>
			</c:choose>
			<c:forEach var="seatName" items="${allSeatNames}" varStatus="status">
				<c:if test="${status.index % numSeatsPerRow == 0}">
					<div class="bus-row">
				</c:if>
				<div class="seat" data-seat="${seatName}">
					<span class="seat-number">${seatName}</span>
				</div>
				<c:if
					test="${status.index % numSeatsPerRow == numSeatsPerRow - 1 || status.last}">
		</div>
		</c:if>
		</c:forEach>
	</div>
</div>
<div class="seat-explain">
		<table border="1">
			<tr>
				<td>空席</td>
				<td><img src="/resources/imgs/bg_vacancy.jpg" class="seat-img"></td>
			</tr>
			<tr>
				<td>あなたの席</td>
				<td><img src="/resources/imgs/bg_selected.jpg" class="seat-img"></td>
			</tr>
			<tr>
				<td>座席選択できない席</td>
				<td><img src="/resources/imgs/bg_reserved.jpg" class="seat-img"></td>
			</tr>
		</table>
	</div>
</div>
<c:if test="${not empty errorReservedSeat}">
	<div class="popup">
		<div class="error-reserved-seat">${errorReservedSeat}</div>
		<div class="ok-button">
			<button onclick="closePopup()">OK</button>
		</div>
	</div>
</c:if>

<c:if test="${not empty errorAllReserved}">
	<div class="popup">
		<div class="error-all-reserved">${errorAllReserved}</div>
		<div class="ok-button">
			<button onclick="redirectToURL('/')">TOPページに戻る</button>
		</div>
	</div>
</c:if>
<form id="seatSelectionForm" action="/seat/confirm" method="post">
	<fmt:formatDate value="${reservationDatetime}" pattern="yyyy-MM-dd"
		var="strDate" />
	<fmt:formatDate value="${reservationDatetime}" pattern="yyyy年MM月dd日"
		var="formattedDate" />
	<input type="hidden" name="reservationDatetime" value="${strDate}" />
	<input type="hidden" name="routeId" value="${route.routeId}" /> <input
		type="hidden" name="selectedSeats" id="selectedSeats" value="" />
	<div class="button-row">
		<button id="button" type="button" onclick="checkBooking()" class="btn btn-primary">予約</button>
		<button id="button" type="button" onclick="goBack()" class="btn btn-warning">戻る</button>
	</div>
</form>
</div>
</div>
<script>
    $(document).ready(function() {
        var reservedSeats = [
            <c:forEach var="reservedSeat" items="${reservedSeatsList}">
                '${reservedSeat}',
            </c:forEach>
        ];

        $('.seat').each(function() {
            var seatName = $(this).data('seat');
            if ($.inArray(seatName, reservedSeats) !== -1) {
                $(this).addClass('reserved').prop('disabled', true);
            }
        });

        $('.seat').click(function() {
            if ($(this).hasClass('reserved')) {
                return;
            }

            $(this).toggleClass('selected');

            var selectedSeats = [];
            $('.seat.selected').each(function() {
                selectedSeats.push($(this).data('seat'));
            });

            $('#selectedSeats').val(selectedSeats.join(','));
        });
    });

    function checkBooking() {
        var selectedSeats = [];
        var seats = document.getElementsByClassName("seat");
        
        for (var i = 0; i < seats.length; i++) {
            if (seats[i].classList.contains("selected")) {
                selectedSeats.push(seats[i].getAttribute("data-seat"));
            }
        }

        if (selectedSeats.length === 0) {
            alert("座席を選択してください。");
            return;
        }

        document.getElementById("selectedSeats").value = selectedSeats.join(",");
        document.getElementById("seatSelectionForm").submit();
    }

    function goBack() {
        var url ="/route/result?departureBusStopName=${route.departureBusStopName}&arrivalBusStopName=${route.arrivalBusStopName}&date=${formattedDate}";
    		window.location.href = url;
        	
    }
    function closePopup() {
        var popup = document.querySelector('.popup');
        popup.style.display = 'none';
    }

    function redirectToURL(url) {
        window.location.href = "/";
    }
    

</script>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
