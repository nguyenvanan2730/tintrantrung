<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
  .required::after {
    content: "*";
    color: red;
    margin-left: 5px;
  }
</style>
<div id="section" class="container">
	<div id="article" class="card">
		<h3>バス登録</h3>
		<div class="form-container content" style="width:800px">

			<form:form modelAttribute="busForm">
				<div class="form-group" style="width:400px">
					<label><spring:message code="busForm.rowNum" /><span class="required"></label>
					<form:input path="rowNum" class="form-control" placeholder="半角数値"/>
					<form:errors path="rowNum" element="p" cssClass="text-danger" />
					</div>
				<div class="form-group">
					<label><spring:message code="busForm.columnNum" /><span class="required"></label>
					<form:select path="columnNum" class="form-control" style="width:400px">
						<form:option value="" label="選択してください" />
						<form:option value="3" label="3" />
						<form:option value="4" label="4" />
					</form:select>
					<form:errors path="columnNum" element="p" cssClass="text-danger" />
				</div>
					<p><strong>ナンバー</strong></p>
					<div class="bus-number" style="border: 1.5px solid black; border-radius: 8px; padding: 20px;">
						<div class="form-group">
						<div class="row">
							<div class="col-sm-6">
								<label><spring:message code="busForm.numberPlace" /><span class="required"></label>
								<form:input path="numberPlace" class="form-control"
									pattern="^[^\x01-\x7E\xA1-\xDF]+$" title="全角を入力してください"
									placeholder="例：東京" />
								<form:errors path="numberPlace" element="p"
									cssClass="text-danger" />
							</div>
							<div class="col-sm-6" style>
								<label><spring:message code="busForm.numberDivision" /><span class="required"></label>
								<form:input path="numberDivision" class="form-control" placeholder="半角数値2桁"/>
								<form:errors path="numberDivision" element="p"
									cssClass="text-danger"/>
							</div>
							</div>
						<div class="form-group" style="margin-top:20px">
						<div class="row">
							<div class="col-sm-2">
								<label><spring:message code="busForm.numberKana" /><span class="required"></label>
								<form:input path="numberKana" class="form-control" placeholder="例：あ"/>
								<form:errors path="numberKana" element="p"
									cssClass="text-danger" />
							</div>
							<div class="col-sm-5">
								<label><spring:message code="busForm.numberFirstHalf" /><span class="required"></label>
								<form:input path="numberFirstHalf" class="form-control" placeholder="半角数値2桁"/>
								<form:errors path="numberFirstHalf" element="p"
									cssClass="text-danger" />
							</div>
							<div class="col-sm-5">
								<label><spring:message code="busForm.numberLatterHalf" /><span class="required"></label>
								<form:input path="numberLatterHalf" class="form-control" placeholder="半角数値2桁"/>
								<form:errors path="numberLatterHalf" element="p"
									cssClass="text-danger" />
							</div>
						</div>
						</div>
					</div>
					</div>
					<p style="color:red; font-size:14px; margin-top:20px">*必須項目</p>
					<div class="button" style="margin:20px;display: flex; justify-content: center;">
					<input type="submit" value="登録" class="btn btn-primary" formaction="confirm" style="margin-right: 20px;">
					<input type="submit" value="戻る" class="btn btn-warning" formaction="/busList/index" style="margin-left: 20px;">
					</div>
			</form:form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
