<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<script type="text/javascript" src="../resources/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.ja.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/search.css">

<title>検索</title>
<!-- BANNER -->
 <section id="banner" class="container-fluid banner">
 	<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img" alt="..." >
 </section>

<!-- SEARCH BOX -->
<section>
	<div class="search-box mb-5">
		<div class="row" id="row-search">
			<div class="container pt-3">
					<form:form method="get" modelAttribute="routeSearchForm"
						id="searchForm" class="search-form" action="result">
						<div class="form-group">
							<label><i class="fa-solid fa-location-dot" style="color: #444444;"></i>&nbsp;出発地</label>
							<form:select path="departureBusStopName" id="input" class="form-control">
								<form:option value="" label="出発地を選択する" />
								<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
							</form:select>
							<form:errors id="error" cssClass="hidden alert" path="date" element="p" />
						</div>
						<div class="form-group">
							<label><i class="fa-solid fa-location-dot" style="color: #444444;"></i>&nbsp;到着地</label>
							<form:select path="arrivalBusStopName" id="input" class="form-control">
								<form:option value="" label="到着地を選択する" />
								<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
							</form:select>
							<form:errors id="error" cssClass="hidden alert" path="date" element="p" />
						</div>
						<div class="form-group">
							<label><i class="fa-solid fa-calendar-days" style="color: #444444;"></i>&nbsp;日付</label> 
							<input id="datepicker" type="text" path="date" name="date" value="${date}" class="form-control" placeholder="日付を選択する">
							<form:errors id="error" cssClass="alert alert-danger" path="date" element="p" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary" id="search-button">
								<i class="fa-sharp fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>&nbsp;高速バス検索
							</button>
							<form:errors id="error" cssClass="hidden alert" path="date" element="p" />
						</div>
					</form:form>
			</div>
		</div>
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

	document.addEventListener('DOMContentLoaded', function () {
	    let footerheight = document.querySelector("footer").offsetHeight;
	    document.querySelector("body").style.paddingBottom = footerheight;
	});

</script>
