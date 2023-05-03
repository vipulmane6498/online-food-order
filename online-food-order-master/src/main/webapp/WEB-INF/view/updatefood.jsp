<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Food</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%
   Food fod = (Food)request.getAttribute("food"); 
%>
<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Update Food</h3>
            <form action="updatefood" method="post" enctype="multipart/form-data">
            <div class="form-group">
            <label>Food Id</label>
							<input type="text" class="form-control" name="id"
								placeholder="Enter Food Id" value="<%=fod.getId() %>" readonly required>
						</div>
						<div class="form-group">
						<label>Food Title</label>
							<input type="text" class="form-control" name="name"
								placeholder="Enter Food Title here" value="<%=fod.getName() %>" required>
						</div>

						<div class="form-group">
						<label>Food Description</label>
							<textarea style="height: 150px" class="form-control"
								name="description" placeholder="Enter Food Description here"
								required><%=fod.getDescription() %></textarea>
						</div>

						<div class="form-group">
						<label>Food Price</label>
							<input type="number" class="form-control" name="price" value="<%=fod.getPrice()%>"
								placeholder="Enter Food Price here" required>
						</div>

						<div class="form-group">
						<label>Food Discount</label>
							<input type="text" class="form-control" name="discount" value="<%=fod.getDiscount() %>"
								placeholder="Enter Food Discount in (%)" required>
						</div>

						<div class="form-group">
							<select name="categoryId" class="form-control">
								<option value="">Select Category</option>
								<%
								for (Category category : categoryDao.findAll()) {
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
							<button class="btn custom-bg text-white">Update Food</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>