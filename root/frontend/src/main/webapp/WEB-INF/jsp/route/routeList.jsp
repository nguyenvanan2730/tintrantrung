<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<h2>路線検索</h2>
		<div>
			<h4>検索条件</h4>

			<form:form modelAttribute="routeSearchForm" action="/route/search"
				method="get">
				<form:errors path="month" element="p" />
				<form:errors path="day" element="p" />
				
				<div class="form-group">
					<form:select path="year">
						<form:option value="2023" label="2023" />
						<form:option value="2024" label="2024" />
					</form:select>
					<label>年</label>

					<input type="number" id="month" name="month"
						value="${month}"> 
					<label for="month">月</label> 
					
					<input type="number" id="day" name="day" value="${day}"> 
					<label for="day">日</label>
				</div>
				
				<div class="form-group">
					<label>出発地</label>
					<form:select path="departureBusStopName">
						<form:option value="" label="" />
						<form:options items="${busStopList}" itemValue="busStopName"
							itemLabel="busStopName" />
					</form:select>
	
					<label> 到着地</label>
					<form:select path="arrivalBusStopName">
						<form:option value="" label="" />
						<form:options items="${busStopList}" itemValue="busStopName"
							itemLabel="busStopName" />
					</form:select>
				</div>

				<input type="submit" value="検索">
			</form:form>

		</div>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>No.</th>
				<th>出発</th>
				<th>到着</th>
				<th>シート</th>
				<th>空席数</th>
				<th>料金</th>
				<th>予約</th>
			</tr>
			<c:forEach items="${routeList}" var="r">
				<tr>
					<td><c:out value="${r.rowNumber}" /></td>
					<td><c:out
							value="${r.departureBusStopName}(${r.departureTime})" /></td>
					<td><c:out value="${r.arrivalBusStopName}(${r.arrivalTime})" /></td>
					<td><c:out value="${r.columnNum}列" /></td>
					<td><c:out value="${r.availableSeats}" /></td>
					<td>¥<fmt:formatNumber value="${r.price}" pattern="#,###" /></td>
					<td><c:choose>
							<c:when test="${r.availableSeats == 0}">
								<button type="button" class="btn btn-danger"
									disabled="disabled">満席</button>
							</c:when>
							<c:otherwise>
								<a href="" id="booking-btn" class="btn btn-success">予約</a>
								<%--
								<a href="booking?routeId=<c:out value="${r.routeId}"/>" id="booking-btn" class="btn btn-success">予約</a>
								--%>
								</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>

		<c:if test="${empty routeList}">
			<tr>
				<td colspan="8">
					<p>該当する情報が存在しませんでした。</p>
				</td>
			</tr>
		</c:if>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
