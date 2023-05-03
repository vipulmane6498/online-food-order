package com.onlinefoodorder.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinefoodorder.dao.CartDao;
import com.onlinefoodorder.dao.OrderDao;
import com.onlinefoodorder.model.Cart;
import com.onlinefoodorder.model.Orders;
import com.onlinefoodorder.model.User;
import com.onlinefoodorder.utility.Constants;
import com.onlinefoodorder.utility.Helper;

@Controller
public class OrderController {
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private OrderDao orderDao;

	@PostMapping("/order")
	public ModelAndView orderfoods(HttpSession session) {
        ModelAndView mv = new ModelAndView();
		
        User user = (User)session.getAttribute("active-user");
        
		String orderId = Helper.getAlphaNumericOrderId(10);
		String orderedDate = LocalDate.now().toString();
		
		List<Cart> carts = cartDao.findByUserId(user.getId());
		
		for(Cart cart : carts) {
			Orders order = new Orders();
			order.setOrderDate(orderedDate);
			order.setOrderId(orderId);
			order.setUserId(user.getId());
			order.setQuantity(cart.getQuantity());
			order.setFoodId(cart.getFoodId());
			order.setDeliveryStatus(Constants.DeliveryStatus.PENDING.value());
			order.setDeliveryDate(Constants.DeliveryStatus.PENDING.value());
			orderDao.save(order);
			cartDao.delete(cart);
		}
		
	
	    mv.addObject("status","Order placed Successfully, Order Id is "+orderId);
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/myorder")
	public ModelAndView goToMyOrder(HttpSession session) {
		User user  = (User)session.getAttribute("active-user");
		ModelAndView mv = new ModelAndView();
		List<Orders> orders = orderDao.findByUserId(user.getId()); 
		mv.addObject("orders", orders);
		mv.setViewName("myorder");
		return mv;
	}
	
	@GetMapping("/searchorderbyid")
	public ModelAndView searchByOrderId(@RequestParam("orderid") String orderId) {
		ModelAndView mv = new ModelAndView();
		List<Orders> orders = orderDao.findByOrderId(orderId);
		mv.addObject("orders", orders);
		mv.setViewName("myorder");
		return mv;
	}
	
	@GetMapping("/searchorderbydate")
	public ModelAndView searchByOrderDate(@RequestParam("orderdate") String orderDate, HttpSession session) {
		User user = (User)session.getAttribute("active-user");
		ModelAndView mv = new ModelAndView();
		List<Orders> orders = orderDao.findByOrderDateAndUserId(orderDate, user.getId());
		mv.addObject("orders", orders);
		mv.setViewName("myorder");
		return mv;
	}
	
	@PostMapping("/checkout")
	public ModelAndView searchByOrderDate(@RequestParam("amount") String amount) {
		
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("amount", amount);
		mv.setViewName("checkout");
		return mv;
	}
	
	@GetMapping("/updatedeliverydate")
	public ModelAndView addDeliveryStatus(@RequestParam("orderId") String orderId, @RequestParam("deliveryStatus") String deliveryStatus, @RequestParam("deliveryDate") String deliveryDate ) {
		ModelAndView mv = new ModelAndView();
		
		List<Orders> orders = this.orderDao.findByOrderId(orderId);
		
		for(Orders order : orders) {
			order.setDeliveryDate(deliveryDate);
			order.setDeliveryStatus(deliveryStatus);
		    this.orderDao.save(order);
		}
			mv.addObject("status", "Order Delivery Status Updated.");
			mv.setViewName("index");
	        return mv;
	}
	
	
	
}
