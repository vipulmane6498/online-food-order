<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
th, h4, label {
	color: var(- -theme-title);
}

.card {
	width: 800px;
}
</style>
	<div class="container" style="margin-top: 70px;" >
		<div class="creditCardForm">
			<h2 class="heading">Confirm Purchase</h2>
			<div class="payment row">
				<div class="col-sm-6">
					<form action="/showticket" method="post">
						<input type="hidden" name="bid" value="${bk.bid }">
						<div class="form-group owner">
							<label for="owner">Name on Card</label> <input type="text"
								class="form-control" id="owner" pattern="[A-Za-z]+{1,32}">
						</div>
						<div class="form-group CVV">
							<label for="cvv">CVV</label> <input type="text"
								class="form-control" id="cvv" pattern="[0-9]{3}">
						</div>
						<div class="form-group" id="card-number-field">
							<label for="cardNumber">Card Number</label> <input type="text"
								class="form-control" id="cardNumber"
								pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}">
						</div>
						<div class="form-group row" id="expiration-date">
							<label class="col-sm-4">Expiration Date</label>
							<div class="col-sm-4">
								<select class="form-control">
									<option value="01">Jan</option>
									<option value="02">Feb</option>
									<option value="03">March</option>
									<option value="04">April</option>
									<option value="05">May</option>
									<option value="06">June</option>
									<option value="07">July</option>
									<option value="08">Aug</option>
									<option value="09">Sept</option>
									<option value="10">Oct</option>
									<option value="11">Nov</option>
									<option value="12">Dec</option>
								</select>
							</div>
							<div class="col-sm-4">
								<select class="form-control">
									<option value="21">2021</option>
									<option value="21">2022</option>
									<option value="21">2023</option>
									<option value="21">2024</option>
									<option value="21">2025</option>
								</select>
							</div>
						</div>
						<div class="form-group" id="credit_cards">
							<img src="resources/images/visa.jpg" id="visa"> <img
								src="resources/images/mastercard.jpg" id="mastercard"> <img
								src="resources/images/amex.jpg" id="amex">
						</div>
						<div class="form-group" id="pay-now">
							<button class="btn btn-primary" id="confirm-purchase">Confirm
								Order</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>