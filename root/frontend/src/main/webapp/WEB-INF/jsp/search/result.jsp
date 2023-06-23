<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<script type="text/javascript" src="../resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.ja.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/search.css">
<style>
	input.search{
		padding:10px;
		border-radius: 4px
	}
</style>
<div id="section">
	<div id="article">
		<div>
			<input class="search" id="bookName" onchange="searchFunction()" value="" placeholder="キーワードを入力してください"/>
			<button class="btn" onclick="searchFunction()">検索</button>
		</div>
		
		<h1>検査結果</h1>
		<ul id="list"></ul>
		
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		$('#datepicker').datepicker({
		    format: "yyyy年MMdd日",
		    clearBtn: true,
		    forceParse: false,
		    language: "ja",
		    daysOfWeekHighlighted: "0,6",
		    todayHighlight: true
		});
		
		$('#search-btn').click(function() {
			$('#datepicker').attr('name', 'date');
			$('#searchForm').submit();
		});
	});

</script>

