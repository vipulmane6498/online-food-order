<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.time.LocalDate"%>
   <%@ page import ="com.onlinefoodorder.model.*"%>
<%@ page import="com.onlinefoodorder.utility.*"%>
<%@ page import="com.onlinefoodorder.dao.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
    
<% 
    Food fod = (Food)request.getAttribute("food"); 
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=fod.getName() %></title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<script type="text/javascript">
      function checkUser()
      {
    	  <%
    	       
    	      if(userType != null)
    	      {
    	    	  if(userType.equals("user"))
    	    	  {
    	  %>
    	             return  true;
    	          <%
    	    	  }
    	    	  
    	    	  else
    	    	  {	  
    	    	  %>
    	    	  alert("Please login as customer to buy the product.");
    	    	  return false;
    	    	  <%
    	    	  }
    	    	  
    	      }
    	      else
    	      {
    	  %>
    	    	  alert("Please login to buy the product.");
    	    	  return false;
    	  <%
    	      }
    	  %>
      }
</script>
<%@ include file="./components/message.jsp"%>

<div class="container-fluid">
   <div class="row">
         <div class="col-md-2" >
             <div class="list-group mt-4">
                 <a href="category?categoryId=0" class="list-group-item list-group-item-action active" style="background-color: #fcde67"><span class="text-color">All Categories</span></a>
               <%
                   
                    for(Category c: categoryDao.findAll())
                    {    	
               %>      
                         <a href="category?categoryId=<%=c.getId() %>" class="list-group-item list-group-item-action"><%=c.getName() %></a>
               <%
                    }
               %>
             </div>
        </div> 
        
        <div class="col-sm-3 mt-4 admin">
              <div class="card">
                   <img src="resources/productpic/<%=fod.getImagePath() %>" style="max-height:500px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
              </div>
        </div>
        
        <div class="col-sm-6 mt-4 admin">
              <div class="card">
                   <div class="card-header text-center">
                        <h1><%=fod.getName() %></h1>
                   </div>
                    <div class="text-left ml-3 mt-3"><h2>Description :</h2></div>
                        <div class="card-body text-left">     
                                 <h4 class="card-text"><%=fod.getDescription() %></h4> 
                        </div>
                        <div class="card-footer text-center">
                                 <p style="font-size:35px"><span style="font-size:35px;"><b>Price :</b></span><span class="ml-2"><b>&#8377;<%=new Helper().getFoodSellingPrice(fod.getPrice(), fod.getDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:30px;color:red"><s>&#8377;<%=fod.getPrice()%></s></span>
                                  <span class="ml-2" style="font-size:25px;color:green"><%=fod.getDiscount() %>&#37 off</span>
                                  
                                 </p>
                                 <hr>
                                 
                               <%
                                   if(userType != null && userType.equals("user"))
                                   {
                               %>
                               
                               //add food into cart
                               <form class="form-inline" action="addToCart" onclick="return checkUser()">
                                  <input type="hidden" name="foodId" value="<%=fod.getId()%>">
                                  <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                  <% LocalDate date=LocalDate.now(); %>
                                  <input type="hidden" name="date" value="<%=date.toString()%>">
                                  <div class="form-group mx-sm-3 mb-2">
                                      <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
                                  </div>
                                  <button type="submit" class="btn custom-bg text-color mb-2">Add To Cart</button>
                               </form>
                              
                              <%
                                   }
                               
                                   else if(userType != null && userType.equals("admin"))
                                   {
                              %> 
                                     
                                      <a href="deletefood?foodId=<%=fod.getId()%>"><button type="button" class="btn btn-danger">Delete Product</button></a>
                                     <a href="updatefood?foodId=<%=fod.getId()%>"><button type="button" class="btn btn-danger">Update Product</button></a>
                                      
                              <%
                                   }
                               
                                   else {
                              %> 
                              
                                 <form class="form-inline" action="addToCart" onclick="return checkUser()">
                                  <input type="hidden" name="foodId" value="<%=fod.getId()%>">
                                  <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                  <% LocalDate date=LocalDate.now(); %>
                                  <input type="hidden" name="date" value="<%=date.toString()%>">
                                  <div class="form-group mx-sm-3 mb-2">
                                      <input type="number" class="form-control" name="quantity"  placeholder="Quantity" required>
                                  </div>
                                  <button type="submit" class="btn custom-bg text-white mb-2">Add To Cart</button>
                               </form>
                              
                              <%
                                   }
                              %>
                             
                        </div>
                   </div>
              </div>
        </div>
        
</div>
</body>
</html>