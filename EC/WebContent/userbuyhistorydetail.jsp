<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	page import="beans.ItemDataBeans"%>
<%@ page import="beans.DeliveryMethodDataBeans"%>
<%@ page import="beans.BuyDataBeans"%>
<%@	page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入履歴詳細</title>
<jsp:include page="/baselayout/head.html" />
<%
	ArrayList<ItemDataBeans> buyIDBList = (ArrayList<ItemDataBeans>) request.getAttribute("buyIDBList");
	BuyDataBeans resultBDB = (BuyDataBeans) request.getAttribute("resultBDB");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h4 class=" col s12 light">購入詳細</h4>
		</div>
		<!--  購入 -->
		<div class="row">
			<div class="col s10 offset-s1">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table>
							<thead>
								<tr>
									<th class="center">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center">合計金額</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center"><%=resultBDB.getFormatDate()%></td>
									<td class="center"><%=resultBDB.getDeliveryMethodName()%></td>
									<td class="center"><%=resultBDB.getTotalPrice()%>円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 詳細 -->
		<div class="row">
			<div class="col s10 offset-s1">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th class="center">商品名</th>
									<th class="center" style="width: 20%">単価</th>
								</tr>
							</thead>
							<tbody>
								<%
								for(ItemDataBeans buyIDB : buyIDBList){
								%>
								<tr>
									<td class="center"><%=buyIDB.getName()%></td>
									<td class="center"><%=buyIDB.getPrice()%>円</td>
								</tr>
								<%
								}
								%>
								<tr>
									<td class="center"><%=resultBDB.getDeliveryMethodName()%></td>
									<td class="center"><%=resultBDB.getDeliveryMethodPrice()%>円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>