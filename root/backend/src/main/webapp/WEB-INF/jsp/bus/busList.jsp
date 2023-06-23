<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section" class="container">
	<div class="col-md-12">

		<h3>バス一覧</h3>

		<div class="button" style="margin:20px 0 10px 0">
			<a class="btn btn-primary" href="/busInsert/input" role="button" style="width:100px">新規登録</a>
			<a class="btn btn-danger" id="delete-btn" style="width:100px">削除</a>
			<span class ="text" style="font-size:1rem; color:red"></span>
		</div>

		<table id="bus-list-table" border="1" class="table table-striped">
			<thead>
			<tr>
				<th scope="col">選択</th>
				<th scope="col">ID</th>
				<th scope="col">ナンバープレート</th>
				<th scope="col">１列あたりシート数</th>
				<th scope="col">シート列数</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${busList}" var="bus">
					<tr>
						<td><input type="radio" name="selectedBus"
							value="${bus.busId}" /></td>
						<td><c:out value="${bus.busId}" /></td>
						<td><c:out
								value="${bus.numberPlace}${bus.numberDivision} ${bus.numberKana} ${bus.numberFirstHalf}-${bus.numberLatterHalf}" /></td>
						<td><c:out value="${bus.rowNum}" /></td>
						<td><c:out value="${bus.columnNum}" /></td>
					</tr>
				</c:forEach>
				</form>
			</tbody>
		</table>  
	</div>
</div>
<script>
$(document).ready(function() {
    $('#bus-list-table').DataTable({
        language: {
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
            }
        }
    });

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
