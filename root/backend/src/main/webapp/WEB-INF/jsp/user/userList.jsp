<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<script>
    $(document).ready(function() {
        $('#user').DataTable({
            stateSave: true,　
            "searching": false,
            language: {
                "emptyTable": "一致するレコードがありません",
                "info": " _TOTAL_ 件中 _START_ から _END_ まで表示",
                "infoEmpty": " 0 件中 0 から 0 まで表示",
                "infoFiltered": "（全 _MAX_ 件より抽出）",
                "infoThousands": ",",
                "lengthMenu": "_MENU_ 件表示",
                "loadingRecords": "読み込み中...",
                "processing": "処理中...",
                "zeroRecords": "一致するレコードがありません",
                "paginate": {
                    "first": "先頭",
                    "last": "最終",
                    "next": "次ページ",
                    "previous": "前ページ"
                },
            },
            pageLength: 10 
        });
    });
</script>

<div id="section" class="container">
	<div class="magin-bottom-10">

		<h3>会員一覧</h3>
	</div>
	<div class="col-md-12">

		<div class="row magin-bottom-10">
			<form action="/user/search" method="GET" class="form-inline"
				float-left>
				<div class="form-group">
					<label for="memberId">会員ID</label> <input type="text"
						name="memberId" id="memberId" class="form-control"
						placeholder="会員IDを入力してください" pattern="[0-9]*" title="半角数字のみ入力してください">
				</div>
				<div class="form-group">
					<label for="name">氏名</label> <input type="text" name="name"
						id="name" class="form-control" placeholder="氏名を入力してください"
						value="${param.name}">
				</div>
				<button type="submit" class="btn btn-info">絞り込む</button>
			</form>
		</div>
		<div class="row">
			<table id="user" border="1" class="table table-striped">
				<thead>
					<tr>
						<th>選択</th>
						<th>会員ID</th>
						<th>氏名</th>
						<th>電話番号</th>
						<th>メールアドレス</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="member">
						<tr>
							<td><input type="radio" name="selectedMember"
								value="${member.memberId}"></td>
							<td><c:out value="${member.memberId}" /></td>
							<td><c:out value="${member.lastName}" /> <c:out
									value="${member.firstName}" /></td>
							<td><c:out value="${member.tel}" /></td>
							<td><c:out value="${member.email}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="button-row">
			<script>
                function checkBooking() {
                    var selectedMember = document.querySelector('input[name="selectedMember"]:checked');
                    if (selectedMember) {
                        var memberId = selectedMember.value;
                        window.location.href = "/booking/list?memberId=" + memberId;
                    } else {
                        alert("対象の会員を選択してください。");
                    }
                }
                function goBack() {
					window.location.href = "/user/list";
				}
            </script>
			<div class="row">
				<button onclick="checkBooking()" class="btn btn-primary">予約状況</button>
				<button onclick="goBack()" class="btn btn-warning">戻る</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
