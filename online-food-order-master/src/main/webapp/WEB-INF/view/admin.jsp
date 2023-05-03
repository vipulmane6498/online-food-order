<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page- Online Food Ordering</title>
<%@ include file="./components/common_cs_js.jsp"%>

</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<%
	List<Category> li = new ArrayList<>();
	li = categoryDao.findAll();
	List<User> listOfAllUsers = new ArrayList<>();
	listOfAllUsers = userDao.findAll();
	%>

	<div class="container admin mt-2">
		<%@ include file="./components/message.jsp"%>
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#show-users-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/user.png" alt="users_pic">
						</div>
						<h1><%=userDao.count()%></h1>
						<h2 class="text-uppercase text-muted">Users</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#show-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/category.png" alt="users_pic">
						</div>
						<h1><%=categoryDao.count()%></h1>
						<h2 class="text-uppercase text-muted">Total Category</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#show-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/product.png" alt="users_pic">
						</div>
						<h1><%=foodDao.count()%></h1>
						<h2 class="text-uppercase text-muted">Total Foods</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#total-order-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/check.png" alt="users_pic">
						</div>
						<h1 class="text-lowercase text-muted"><%=orderDao.count()%></h1>
						<h2 class="text-uppercase text-muted">Total Orders</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container md-5">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/addCategory.jpg" alt="users_pic">
						</div>
						<p class="text-lowercase text-muted mt-2 " style="font-size: 22px">click
							to add category</p>
						<h2 class="text-uppercase text-muted mt-1">Add Category</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card hover" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle"
								src="resources/images/addproduct.png" alt="users_pic">
						</div>
						<p class="text-lowercase text-muted mt-2 " style="font-size: 22px">click
							to add food</p>
						<h2 class="text-uppercase text-muted">Add Food</h2>
					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- add category modal -->

	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title text-color" id="exampleModalLongTitle">Fill
						category details.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="addcategory" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								placeholder="Enter Category Title here" required>
						</div>

						<div class="form-group">
							<textarea style="height: 250px" class="form-control"
								name="description" placeholder="Enter Category Description here"
								required></textarea>
						</div>

						<div class="container text-center">
							<button class="btn custom-bg text-color">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- end add category modal -->

	<!-- add product modal -->

	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title text-color" id="exampleModalLongTitle">Add Food
						details.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="addfood" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								placeholder="Enter Food Title here" required>
						</div>

						<div class="form-group">
							<textarea style="height: 150px" class="form-control"
								name="description" placeholder="Enter Food Description here"
								required></textarea>
						</div>

						<div class="form-group">
							<input type="number" class="form-control" name="price"
								placeholder="Enter Food Price here" required>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" name="discount"
								placeholder="Enter Food Discount in (%)" required>
						</div>

						<div class="form-group">
							<select name="categoryId" class="form-control">
								<option value="">Select Category</option>
								<%
								for (Category category : li) {
								%>
								<option value="<%=category.getId()%>"><%=category.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<label>Select Food Pic</label><br> <input type="file"
								class="form-control" name="image" required>
						</div>

						<div class="container text-center">
							<button class="btn custom-bg text-color">Add Food</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- end add product modal -->

	<!-- show users modal -->

	<div class="modal fade" id="show-users-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white text-center">
					<h5 class="modal-title text-color" id="exampleModalLongTitle">Total
						Users</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr class="text-color">
									<th scope="col">User Id</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Email Id</th>
									<th scope="col">Mobile</th>
									<th scope="col">Address</th>
								</tr>
							</thead>
							<tbody>

								<%
								for (User u : listOfAllUsers) {
								%>
								<tr>
									<th scope="row" class="mid-align"><%=u.getId()%></th>
									<td class="mid-align"><%=u.getFirstname()%></td>
									<td class="mid-align"><%=u.getLastname()%></td>
									<td class="mid-align"><%=u.getEmailid()%></td>
									<td class="mid-align"><%=u.getMobileno()%></td>
									<td class="mid-align"><%=u.getStreet() + " " + u.getCity() + " " + u.getPincode()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end of show users modal -->

	<!-- show category modal -->

	<div class="modal fade" id="show-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white text-center">
					<h5 class="modal-title text-color" id="exampleModalLongTitle">Total
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr class="text-color">
									<th scope="col">Category Id</th>
									<th scope="col">Category Name</th>
									<th scope="col">Category Description</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								for (Category c : categoryDao.findAll()) {
								%>
								<tr>
									<td class="mid-align"><%=c.getId()%></td>
									<td class="mid-align"><%=c.getName()%></td>
									<td class="mid-align"><%=c.getDescription()%></td>
									<td class="mid-align"><a
										href="deletecategory?categoryId=<%=c.getId()%>"><input
											type="submit" class="btn btn-danger" value="Delete"></a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ********************* -->

	<!-- show Product modal -->

	<div class="modal fade" id="show-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white text-center">
					<h5 class="modal-title text-color" id="exampleModalLongTitle">Total Food</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr class="text-color">
									<th scope="col">Food Name</th>
									<th scope="col">Food Image</th>
									<th scope="col">Food Description</th>
									<th scope="col">Food Category</th>
									<th scope="col">Food Price</th>
									<th scope="col">Food Discount</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<Food> lp = foodDao.findAll();
								%>

								<%
								for (Food p : lp) {
								%>
								<tr>
									<td class="mid-align"><%=p.getName()%></td>
									<td class="mid-align"><img style="max-width: 70px"
										class="img-fluid"
										src="resources/productpic/<%=p.getImagePath()%>"
										alt="users_pic"></td>
									<td class="mid-align"><%=p.getDescription()%></td>

									<%
									Category cat = null;
									Optional<Category> optional = categoryDao.findById(p.getCategoryId());
									if (optional.isPresent()) {
										cat = optional.get();
									}
									%>

									<td class="mid-align"><%=cat.getName()%></td>
									<td class="mid-align"><%=p.getPrice()%></td>
									<td class="mid-align"><%=p.getDiscount()%></td>

								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ********************* -->

	<!-- total order modal -->

	<div class="modal fade bd-example-modal-lg" id="total-order-modal"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg modal-size" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white text-center">
					<h5 class="modal-title text-color" id="exampleModalLongTitle">TOTAL
						ORDERS</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">

					<%
					List<Orders> lor = orderDao.findAll();
					if (lor == null) {
					%>
					<div class="text-center">
						<h1>NO ORDERS MADE BY ANYONE !!</h1>
						<hr>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
					<%
					}

					else {
					%>
					<div class="table-responsive">
						<table class="table">
							<thead class="custom-bg text-white">
								<tr class="text-center text-color">
									<th scope="col">Order Id</th>
									<th scope="col">User Id</th>
									<th scope="col">User Name</th>
									<th scope="col">User Email</th>
									<th scope="col">User Phone</th>
									<th scope="col">Food Image</th>
									<th scope="col">Food Title</th>
									<th scope="col">Qnty</th>
									<th scope="col">Price</th>
									<th scope="col">Ord. date</th>
									<th scope="col">Delivery date</th>
									<th scope="col">Delivery Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>



							<tbody>

								<%
								for (Orders o : lor) {

									Optional<Food> of = foodDao.findById(o.getFoodId());
									Food f = null;

									if (of.isPresent()) {
										f = of.get();
									}

									Optional<User> ou = userDao.findById(o.getUserId());
									User u = null;

									if (of.isPresent()) {
										u = ou.get();
									}
								%>
								<tr class="text-center">
									<td class="mid-align"><%=o.getOrderId()%></td>
									<td class="mid-align"><%=u.getId()%></td>
									<td class="mid-align"><%=u.getFirstname()%></td>
									<td class="mid-align"><%=u.getEmailid()%></td>
									<td class="mid-align"><%=u.getMobileno()%></td>
									<td><img
										style="max-height: 100px; max-width: 70px; width: auto;"
										class="img-fluid mx-auto d-block"
										src="resources/productpic/<%=f.getImagePath()%>"
										alt="users_pic"></td>
									<td class="mid-align"><%=f.getName()%></td>
									<td class="mid-align"><%=o.getQuantity()%></td>
									<td class="mid-align"><%=(new Helper().getFoodSellingPrice(f.getPrice(), f.getDiscount())) * o.getQuantity()%></td>
									<td class="mid-align"><%=o.getOrderDate()%></td>
									<td class="mid-align"><%=o.getDeliveryDate()%></td>
									<td class="mid-align"><%=o.getDeliveryStatus()%></td>
									<td class="mid-align">
										<form action="updatedeliverydate">

											<input type="hidden" name="orderId" value=<%=o.getOrderId()%>>

											<div class="form-group mx-sm-3 mb-2">
												<input type="text" class="form-control" name="deliveryDate"
													placeholder="Delivery Date" size="85" required>
											</div>
											<div class="form-group mx-sm-3 mb-2">
												<select name="deliveryStatus" class="form-control">
													<option value="Pending">Pending</option>
													<option value="Delivered">Delivered</option>
													<option value="On the Way">On the Way</option>
													<option value="Processing">Processing</option>
												</select>
											</div>
											<button type="submit" class="btn custom-bg text-white mb-2">Set</button>
										</form>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>


						</table>
					</div>
					<hr>

					<div class="text-center">
						<button type="button" class="btn btn-secondary ml-5"
							data-dismiss="modal">Close</button>
					</div>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</div>

	<!--  -->

</body>
</html>