<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../resources/css/search.css">

<!-- SEARCH BOX -->
 <section>
        <div class="search-box">
            <div class="row mb-4 p-4">
                <div class="container">
                    <div class="">
                        <form method="get" modelAttribute="routeSearchForm" class="search-form" id="searchForm"
                            action="/route/search">
                            <div class="form-group">
                                <label for="departureBusStopName"><i class="fa-solid fa-location-dot"
                                        style="color: #444444;"></i>&nbsp;出発地:</label>
                                <select id="input" class="form-control" id="departureBusStopName"
                                    name="departureBusStopName">
                                    <option value="">出発地を選択する</option>
                                    <c:forEach items="${busStopList}" var="busStop">
                                        <option value="${busStop.busStopName}">${busStop.busStopName}</option>
                                    </c:forEach>
                                </select>
                                <form:errors path="departureBusStopName" element="p" />
                            </div>

                            <div class="">
                                <label for="arrivalBusStopName"><i class="fa-solid fa-location-dot"
                                        style="color: #444444;"></i>&nbsp;到着地:</label>
                                <select id="input" class="form-control" id="arrivalBusStopName"
                                    name="arrivalBusStopName">
                                    <option value="">出発地を選択する</option>
                                    <c:forEach items="${busStopList}" var="busStop">
                                        <option value="${busStop.busStopName}">${busStop.busStopName}</option>
                                    </c:forEach>
                                </select>
                                <form:errors path="arrivalBusStopName" element="p" />
                            </div>

                            <div class="">
                                <label for="datepicker"><i class="fa-solid fa-calendar-days"
                                        style="color: #444444;"></i>&nbsp;日付:</label>
                                <input id="input" type="date" class="form-control" id="datepicker" name="date"
                                    value="${date}">
                                <form:errors path="date" element="p" />
                            </div>

                            <button type="submit" class="btn btn-primary" id="button"><i
                                    class="fa-sharp fa-solid fa-magnifying-glass"
                                    style="color: #ffffff;"></i>&nbsp;高速バス検索</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- SEARCH RESULT -->
	<section class="result-title">
        <div class="container text-center">
            <h4>検査結果</h4>
        </div>
    </section>
    
    <section class="result">
        <div class="container ">          
		<table class="table table-light table-hover">
			<tr>
				<th>No.</th>
				<th>出発</th>
				<th>到着</th>
				<th>シート</th>
				<th>空席数</th>
				<th>料金</th>
				<th>予約</th>
			</tr>
			<c:forEach items="${routeList}" var="r">
				<tr>
					<td><c:out value="${r.rowNumber}" /></td>
					<td><c:out value="${r.departureBusStopName}(${r.departureTime})" /></td>
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
								<a href= "/seat/select?reservationDatetime=
									<c:out value="${date}"/>&routeId=
									<c:out value="${r.routeId}"/>"
								 id="booking-btn" class="btn">予約</a>
								</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
        </div>
    </section>
		<c:if test="${empty routeList}">
			<tr>
				<td colspan="8">
					<p>該当する情報が存在しませんでした。</p>
				</td>
			</tr>
		</c:if>
		</table>
	</div>
</div>

<script>

$(document).ready(function() {
    $('#search-btn').click(function() {
        $('#datepicker').attr('name', 'date');
        $('#searchForm').submit();
    });
    
    $('#datepicker').datepicker({
        format: "yyyy-mm-dd",
        maxViewMode: 1,
        clearBtn: true,
        language: "ja",
        daysOfWeekHighlighted: "0"
    });
});

</script>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
