<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
<div id="article">
		
	<a href="/busInsert/input" class="btn btn-primary">新規登録 </a>
	<a class="btn btn-danger" id="delete-btn">削除</a>

	<div>
		<table class="table table-striped table-bordered table-hover" >
		<thead>
			<tr>
				<th>選択</th>
				<th>ID</th>
				<th>ナンバープレート</th>
				<th><spring:message code="busForm.rowNum"/></th>
				<th><spring:message code="busForm.columnNum"/></th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${busList}" var="bus">
				<tr>
					<td><input type="radio" name="selectedBus" value="${bus.busId}"/></td>
					<td><c:out value="${bus.busId}"/></td>
					<td><c:out value="${bus.numberPlace}${bus.numberDivision} ${bus.numberKana} ${bus.numberFirstHalf}-${bus.numberLatterHalf}"/></td>
					<td><c:out value="${bus.rowNum}"/></td>
					<td><c:out value="${bus.columnNum}"/></td>
				</tr>
			</c:forEach>
		</tbody>

		</table>
	</div>
</div>
</div>

<script>
	$(document).ready(function() {
		$("#delete-btn").click(function() {
			var selectedBus = $("input[name='selectedBus']:checked").val();
			if (selectedBus) {
				window.location.href = "/busDelete/confirm?busId=" + selectedBus;
			} else {
				alert("削除対象のバスを選択してください。");
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
