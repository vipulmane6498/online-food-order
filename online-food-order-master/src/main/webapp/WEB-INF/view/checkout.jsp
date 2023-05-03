<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@ include file="./components/common_cs_js.jsp"%>
<script type="text/javascript">
function backtohome(){
	window.location.replace('/')
}
</script>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <%
                   String amount = (String)request.getAttribute("amount");
                %>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Payment Page</h3>
            <form action="order" method="post">
                 <div class="form-group">
                     <label for="email">Amount</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="amount" value="<%=amount %>" readonly required>
                     <jsp:include page="Payment.jsp" />
                 </div>  
            </form>
            <center><button class="btn btn-primary btn-sm my-2 px-3" onclick="backtohome()">Back to Home</button></center>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>