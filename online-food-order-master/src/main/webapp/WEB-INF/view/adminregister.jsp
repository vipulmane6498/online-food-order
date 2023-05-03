<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Register</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Register Admin</h3>
            <form action="adminregister" method="post">
            
                 <div class="form-group">
                     <label for="name">First Name</label>
                     <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="firstname" pattern="[A-Za-z]+" placeholder="Enter first name.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Last Name</label>
                     <input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" name="lastname" pattern="[A-Za-z]+" placeholder="Enter last name.." required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Email</label>
                     <input type="email" class="form-control" id="emailid" aria-describedby="emailHelp" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" placeholder="Enter email id.." required>
                 </div>
           
          
                  <div class="form-group">
                     <label for="email">Mobile</label>
                     <input type="tel" class="form-control" id="mobileno" aria-describedby="emailHelp" name="mobileno" pattern="[0-9]{10}" placeholder="Enter mobile no.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Street</label>
                     <input type="text" class="form-control" id="street" aria-describedby="emailHelp" name="street" placeholder="Enter street.." required>
                 </div>
                 
             
                 <div class="form-group">
                     <label for="name">City</label>
                     <input type="text" class="form-control" id="city" aria-describedby="emailHelp" name="city" pattern="[A-Za-z]+" placeholder="Enter city.." required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Pin code</label>
                     <input type="text" class="form-control" id="pincode" aria-describedby="emailHelp" name="pincode" pattern="[0-9]{6}" placeholder="Enter pincode.." required>
                 </div>
              
               
                 <div class="form-group">
                     <label for="password">Password</label>
                     <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="password" pattern="/^[a-zA-Z0-9!@#\$%\^\&*_=+-]{8,12}$/g" placeholder="Enter password.." required>
                     <small id="passwordHelpInline" class="text-muted">
                        Must be 8-20 characters long.
                     </small>
                 </div>
                 
            
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Register</b></button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>