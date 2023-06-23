<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
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
	$(document).ready(function() {
		$("#delete-btn").click(function() {
			var selectedBus = $("input[name='selectedBus']:checked").val();
			if (selectedBus) {
				window.location.href = "/busDelete/confirm?busId=" + selectedBus;
			} else {
				alert("No bus selected");
			}
		});
	});

    $('#bus').DataTable({
      stateSave: true,
      language: {
        "emptyTable": "テーブルにデータがありません",
        "info": " _TOTAL_ 件中 _START_ から _END_ まで表示",
        "infoEmpty": " 0 件中 0 から 0 まで表示",
        "infoFiltered": "（全 _MAX_ 件より抽出）",
        "infoThousands": ",",
        "lengthMenu": "_MENU_ 件表示",
        "loadingRecords": "読み込み中...",
        "processing": "処理中...",
        "search": "検索:",
        "zeroRecords": "一致するレコードがありません",
        "paginate": {
          "first": "先頭",
          "last": "最終",
          "next": "次",
          "previous": "前"
        },
      }
    });
  });
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
