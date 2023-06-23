<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section" class="container">

	<div class="col-md-12">
		<div>
			<div class="row magin-bottom-10">
				<h3>
					<c:out value="${title}"/>
				</h3>
			</div>
			<div class="row magin-bottom-10">
				<form class="form-inline float-left" action="/route/search">
					<div class="form-group">
						<label>運行日</label> <input type="text" id="date-input" name="date"
							placeholder="YYYYMMDD" class="form-control"> <input
							type="submit" value="絞り込む" class="btn btn-info"
							onclick="validateDate()">
						<p id="error-message" style="color: red; display: none;">
							運行日はYYYYMMDD形式で入力してください。</p>
					</div>
				</form>
				<form action="/routeInsert/input" class="float-right">
					<input type="submit" value="新規登録" class="btn btn-primary">
				</form>
			</div>
			<div class="row magin-bottom-10">
				<table id="route" border="1" class="table table-striped">
					<thead>
						<tr>
							<th>選択</th>
							<th>ID</th>
							<th>出発</th>
							<th>到着</th>
							<th>運行開始日</th>
							<th>運行終了日</th>
							<th>料金</th>
							<th>バスID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${routeList}" var="routeCustomized">
							<tr>
								<td><input type="radio" name="selectedRoute"
									value="${routeCustomized.routeId}"></td>
								<td><c:out value="${routeCustomized.routeId}" /></td>
								<td><c:out value="${routeCustomized.departureBusStopName}(${routeCustomized.departureTime})" /></td>
								<td><c:out value="${routeCustomized.arrivalBusStopName}(${routeCustomized.arrivalTime})" /></td>
								<td><fmt:formatDate value="${routeCustomized.runStartDate}" pattern="yyyy年MM月dd日" /></td>
								<td><fmt:formatDate value="${routeCustomized.runEndDate}" pattern="yyyy年MM月dd日" /></td>
								<td><fmt:formatNumber value="${routeCustomized.price}" pattern="¥#,###" /></td>
								<td><c:out value="${routeCustomized.busId}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
				<button onclick="updateRoute()" class="btn btn-success">更新</button>
				<button onclick="deleteRoute()" class="btn btn-danger">削除</button>
				<button onclick="goBack()" class="btn btn-warning">戻る</button>
			</div>
		</div>
	</div>
</div>

<script>
    $(document).ready(function() {
        $('#route').DataTable({
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
	function updateRoute() {
		var selectedRoute = document
				.querySelector('input[name="selectedRoute"]:checked');
		if (selectedRoute) {
			var routeId = selectedRoute.value;
			window.location.href = "/routeEdit/input?routeId="
					+ routeId;
		} else {
			alert("変更対象の線路を選択してください。");
		}
	}

	function deleteRoute() {
		var selectedRoute = document
				.querySelector('input[name="selectedRoute"]:checked');
		if (selectedRoute) {
			var routeId = selectedRoute.value;
			window.location.href = "/routeDelete/confirm?routeId="
					+ routeId;
		} else {
			alert("削除対象の線路を選択してください。");
		}
	}

	function goBack() {
		window.location.href = "/route/list";
	}
	function validateDate() {
		  var dateInput = document.getElementById("date-input").value;
		  var datePattern = /^\d{8}$/;
		  var errorMessage = document.getElementById("error-message");
		  if (!datePattern.test(dateInput)) {
		    errorMessage.style.display = "block";
		    return false;
		  } else {
		    errorMessage.style.display = "none";
		    return true;
		  }
		}

		document.addEventListener("DOMContentLoaded", function() {
		  var form = document.querySelector("form");
		  form.addEventListener("submit", function(event) {
		    if (!validateDate()) {
		      event.preventDefault(); 
		    }
		  });
		});

</script>
				
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
