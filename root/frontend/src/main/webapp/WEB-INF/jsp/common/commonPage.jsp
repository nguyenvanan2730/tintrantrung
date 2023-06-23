<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<h2>路線検索</h2>
		<div>
			<h4>検索条件</h4>

			<form:form method="get" modelAttribute="routeSearchForm" id="searchForm" action="/route/search">
				<div class="form-group">
					<label>出発地</label>
					<form:select path="departureBusStopName">
						<form:option value="" label="" />
						<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
						<form:errors path="departureBusStopName" element="p" />
					</form:select>

					<label>到着地</label>
					<form:select path="arrivalBusStopName">
						<form:option value="" label="" />
						<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
						<form:errors path="arrivalBusStopName" element="p" />
					</form:select>

					<label>日付</label>
					<input type="date" id="datepicker" name="date" value="${date}" >
					<form:errors path="date" element="p" />
				</div>
				<input id="search-btn" type="submit" value="検索">
			</form:form>

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
        format: "yyyy-mm-dd",
        maxViewMode: 1,
        clearBtn: true,
        language: "ja",
        daysOfWeekHighlighted: "0"
    });
});

</script>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
