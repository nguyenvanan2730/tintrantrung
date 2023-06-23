<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<form action="/routeInsert/input">
			<input type="submit" value="新規登録">
		</form>
		<div>
			<label for="searchBox">絞り込む</label>
		</div>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>選択</th>
				<th>路線ID</th>
				<th>出発停留所ID</th>
				<th>出発時刻</th>
				<th>到着停留所ID</th>
				<th>到着時刻</th>
				<th>運行開始日</th>
				<th>運行終了日</th>
				<th>料金</th>
				<th>バスID</th>
			</tr>
			<c:forEach items="${routeList}" var="route">
				<tr>
					<td><input type="radio" name="selectedRoute" value="${route.routeId}"/></td>
					<td><c:out value="${route.routeId}" /></td>
					<td><c:out value="${route.departureBusStopId}" /></td>
					<td><c:out value="${route.departureTime}" /></td>
					<td><c:out value="${route.arrivalBusStopId}" /></td>
					<td><c:out value="${route.arrivalTime}" /></td>
					<td><c:out value="${route.runStartDate}" /></td>
					<td><c:out value="${route.runEndDate}" /></td>
					<td><c:out value="${route.price}" /></td>
					<td><c:out value="${route.busId}" /></td>
				</tr>
			</c:forEach>
		</table>
		<div class="button-row">
			<a class="btn btn-info" id="edit-btn">編集</a> 
			<a class="btn btn-danger" id="delete-btn">削除</a>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$("#edit-btn").click(function() {
			var selectedRoute = $("input[name='selectedRoute']:checked").val();
			if (selectedRoute) {
				window.location.href = "/routeEdit/input?routeId=" + selectedRoute;
			} else {
				alert("変更対象の路線を選択してください。");
			}
		});
	});

	$(document).ready(function() {
		$("#delete-btn").click(function() {
			var selectedRoute = $("input[name='selectedRoute']:checked").val();
			if (selectedRoute) {
				window.location.href = "/routeDelete/confirm?routeId=" + selectedRoute;
			} else {
				alert("削除対象の路線を選択してください。");
			}
		});
	});
</script>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>