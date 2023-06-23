<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<script type="text/javascript" src="../resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.ja.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/home.css">

<title>ホームページ</title>
<!-- BANNER -->
<section class="banner">
	<div class="container-fluid">
		<div class="row">
			<div id="carouselExampleControls" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active c-item">
						<img src="../resources/imgs/shirakawa2.jpg" class="d-block w-100 c-img" alt="...">
					</div>
					<div class="carousel-item c-item">
						<img src="../resources/imgs/arakurayama1.jpg" class="d-block w-100 c-img" alt="..." >
					</div>
					<div class="carousel-item c-item">
						<img src="../resources/imgs/odaiba.jpg" class="d-block w-100 c-img " alt="...">
					</div>
					<div class="carousel-item c-item">
						<img src="../resources/imgs/Tadami.jpg" class="d-block w-100 c-img " alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
</section>

<!-- SEARCH BOX -->
<section>
	<div class="search-box">
			<div class="container">
				<div class="row mx-auto">
					<form:form method="get" modelAttribute="routeSearchForm"
						id="searchForm" class="search-form p-4" action="route/result">
						<div class="form-group">
							<label><i class="fa-solid fa-location-dot" style="color: #444444;"></i>&nbsp;出発地</label>
							<form:select path="departureBusStopName" id="input" class="form-control">
								<form:option value="" label="出発地を選択する" />
								<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
							</form:select>
						</div>
						<div class="form-group">
							<label><i class="fa-solid fa-location-dot" style="color: #444444;"></i>&nbsp;到着地</label>
							<form:select path="arrivalBusStopName" id="input" class="form-control">
								<form:option value="" label="到着地を選択する" />
								<form:options items="${busStopList}" itemValue="busStopName" itemLabel="busStopName" />
							</form:select>
						</div>
						<div class="form-group">
							<label><i class="fa-solid fa-calendar-days" style="color: #444444;"></i>&nbsp;日付</label> 
							<input id="datepicker" type="text" path="date" name="date" value="${date}" class="form-control" placeholder="日付を選択する">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary" id="search-button">
								<i class="fa-sharp fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>&nbsp;高速バス検索
							</button>
						</div>
					</form:form>
				</div>
		</div>
</section>

<!-- ADVERTISE -->
<section class="advertise-title">
	<div class="container text-center py-3 mt-4">
		<h4>人気路線</h4>
	</div>
</section>

<section class="advertise">
	<div class="container-fluid">
		<div class="row py-4">

			<div class="card" style="width: 20rem;">
				<img src="../resources/imgs/osaka.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">東京⇒大阪</h5>
					<p class="card-text">
						東京～大阪間をとにかく安く移動したいなら、やっぱり高速バス。平日出発であれば2,600円～</p>
					<a id="tokyo-osaka-btn" href="" class="btn btn-primary">ご予約はこちら</a>
				</div>
			</div>

			<div class="card" style="width: 20rem;">
				<img src="../resources/imgs/shizuoka.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">愛知⇒静岡</h5>
					<p class="card-text">愛知から静岡は、飛行機や新幹線よりも高速バスが便利でお得！最高値区間 3,080円～
					</p>
					<a id="aichi-shizu-btn" href="#" class="btn btn-primary">ご予約はこちら</a>
				</div>
			</div>

			<div class="card" style="width: 20rem;">
				<img src="../resources/imgs/autumn.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">東京⇒京都</h5>
					<p class="card-text">
						夜行バスで東京から京都まで格安系のバス会社でとにかく値段が魅力です。最安値2,900円～</p>
					<a id="tokyo-kyoto-btn" href="#" class="btn btn-primary">ご予約はこちら</a>
				</div>
			</div>

		</div>
	</div>
</section>
<section class="advertise">
	<div class="container-fluid">
		<div class="row py-4">
			<div class="card" style="width: 20rem;">
				<img src="../resources/imgs/disney.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">宮城⇒東京</h5>
					<p class="card-text">
						宮城県発新宿駅行きの高速バス、夜行バスを比較して最安値で予約！平日出発であれば安い3,380円〜</p>
					<a id="miyagi-tokyo-btn" href="#" class="btn btn-primary">ご予約はこちら</a>
				</div>
			</div>
			
			<div class="card" style="width: 20rem;">
				<img src="../resources/imgs/shirakawago.png" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">京都⇒岐阜</h5>
					<p class="card-text">
					京都発・岐阜行き高速バスの最安値を検索.日々価格が変わるので、ご予約はお早めに！最安値3,800円～</p>
					<a id="kyoto-gifu-btn" href="#" class="btn btn-primary">ご予約はこちら</a>
				</div>
			</div>
			
			<div class="card" style="width:20rem;">
				<img src="../resources/imgs/yokohama.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">大阪⇒神奈川</h5>
					<p class="card-text">
						高速バス・夜行バス 大阪 神奈川 直行便最安値 乗換ルートの最安値ランキング。4,380円〜</p>
					<a id="osaka-yokohama-btn" href="#" class="btn btn-primary">ご予約はこちら</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- contact -->
<section class="advertise-title">
	<div id="contact" class="container text-center pt-5">
		<h4>お問い合わせ</h4>
	</div>
</section>
<!-- contact -->
<section class="">
	<div class="container">
		<div class="row my-5">
				<div class="col px-3">
				<div class="contact">
					<h5>お困りの際も安心。万全のサポートをご用意</h4>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">氏名</label>
						<input type="text" class="form-control"
							id="exampleFormControlInput1" placeholder="">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">メール</label>
						<input type="email" class="form-control"
							id="exampleFormControlInput1" placeholder="">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">電話番号</label>
						<input type="text" class="form-control"
							id="exampleFormControlInput1" placeholder="">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">メッセージ</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>
					<a id="button" href="#" class="btn btn-primary">メッセージを送信</a>
				</div>
			</div>

			<div class="col px-3">
				<div class="map">
					<iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d36658.08813224877!2d139.70911429913608!3d35.69797941683583!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e0!4m3!3m2!1d35.6929026!2d139.7174897!4m5!1s0x60188ddb54657f03%3A0xaa4227fce669a841!2zVlRJIEphcGFuIENvLCBMdGQsIFQmVOODk-ODqyA06ZqOIDjnlaoyMSwgVG9taWhpc2FjaG8sIFNoaW5qdWt1IENpdHksIFRva3lvIDE2Mi0wMDY3!3m2!1d35.6911207!2d139.7176661!5e0!3m2!1sen!2sjp!4v1687085645657!5m2!1sen!2sjp" width="538" height="468" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- MEMBER -->
    <section class="member-title">
        <div class="container text-center py-4">
            <h4>私たちのチーム</h4>
        </div>
    </section>

    <section class="member">
        <div class="container">
            <div class="row">
				<div class="card" style="width: 14rem;">
					<img src="../resources/imgs/1.png" class="card-img-top" alt="...">
				</div>
       
				<div class="card" style="width: 14rem;">
					<img src="../resources/imgs/2.png" class="card-img-top" alt="...">
				</div>
        
				<div class="card" style="width: 14rem;">
					<img src="../resources/imgs/3.png" class="card-img-top" alt="...">
				</div>
      
    </section>
<!-- DEV TEAM -->
    <section class="about">
        <div class="container py-4 mt-4">
            <h4>高速バス予約システム VTI TAKUMI ダイヤモンド開発チーム</h4>
            <p>このプロジェクトは、私たちのチームメンバーであるチ、ヒェン、ティンの協力と努力の結果、そしてズン先生の導きのもとで実現しました。</p>

            <p>VTI TAKUMIプログラムのおかげで、私たちは短期間でITスキルを習得し、実際のプロジェクトに取り組むことができました。</p>
            <p>このプロジェクトは私たちの卒業論文としても機能し、将来のキャリアにおいて重要な実績となります。</p>

            <p>私たちのチームは異なる専門性と経験を持つメンバーで構成されており、お互いの強みを最大限に活かしながら協力しています。</p>
            <p>私たちの目標は、クオリティの高い高速バスシステムを開発し、人々の移動体験を向上させることです。</p>

            <p>もしVTI TAKUMIプログラムや私たちのプロジェクトに興味を持たれた方がいらっしゃいましたら、ぜひお問い合わせください。</p>
            <p>私たちはチームとして協力し、さらなる成長を目指しています。</p>

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
</script>
<script>
$(document).ready(function() {
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
	
    var formattedDate = tomorrow.getFullYear() + '年' + (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '月' + tomorrow.getDate().toString().padStart(2, '0') + '日';

    $('#tokyo-osaka-btn').attr('href', 'route/result?departureBusStopName=東京都&arrivalBusStopName=大阪府&date=' + formattedDate);

    $('#tokyo-osaka-btn').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      window.location.href = url;
    });
  });

$(document).ready(function() {
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
	
    var formattedDate = tomorrow.getFullYear() + '年' + (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '月' + tomorrow.getDate().toString().padStart(2, '0') + '日';

    $('#aichi-shizu-btn').attr('href', 'route/result?departureBusStopName=愛知県&arrivalBusStopName=静岡県&date=' + formattedDate);

    $('#aichi-shizu-btn').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      window.location.href = url;
    });
  });

$(document).ready(function() {
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
	
    var formattedDate = tomorrow.getFullYear() + '年' + (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '月' + tomorrow.getDate().toString().padStart(2, '0') + '日';
	
    $('#tokyo-kyoto-btn').attr('href', 'route/result?departureBusStopName=東京都&arrivalBusStopName=京都府&date=' + formattedDate);

    $('#tokyo-kyoto-btn').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      window.location.href = url;
    });
  });

$(document).ready(function() {
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
	
    var formattedDate = tomorrow.getFullYear() + '年' + (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '月' + tomorrow.getDate().toString().padStart(2, '0') + '日';
	
    $('#miyagi-tokyo-btn').attr('href', 'route/result?departureBusStopName=宮城県&arrivalBusStopName=東京都&date=' + formattedDate);

    $('#miyagi-tokyo-btn').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      window.location.href = url;
    });
  });

$(document).ready(function() {
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
	
    var formattedDate = tomorrow.getFullYear() + '年' + (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '月' + tomorrow.getDate().toString().padStart(2, '0') + '日';
	
    $('#kyoto-gifu-btn').attr('href', 'route/result?departureBusStopName=京都府&arrivalBusStopName=岐阜県&date=' + formattedDate);

    $('#kyoto-gifu-btn').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      window.location.href = url;
    });
  });

$(document).ready(function() {
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
	
    var formattedDate = tomorrow.getFullYear() + '年' + (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '月' + tomorrow.getDate().toString().padStart(2, '0') + '日';
	
    $('#osaka-yokohama-btn').attr('href', 'route/result?departureBusStopName=大阪府&arrivalBusStopName=神奈川県&date=' + formattedDate);

    $('#osaka-yokohama-btn').on('click', function(event) {
      event.preventDefault();
      var url = $(this).attr('href');
      window.location.href = url;
    });
  });

</script>


