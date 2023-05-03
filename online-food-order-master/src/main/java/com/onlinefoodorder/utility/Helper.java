package com.onlinefoodorder.utility;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import com.onlinefoodorder.dao.FoodDao;
import com.onlinefoodorder.model.Cart;
import com.onlinefoodorder.model.Food;

public class Helper {
	
	@Autowired
	private FoodDao foodDao;
	
	public static String get10Words(String productDescription)
    {
    	String[] str=productDescription.split(" ");
    	if(str.length>10)
    	{
    		String res="";
    		for(int i=0;i<10;i++)
    		{
    			res=res+str[i]+" ";
    		}
    		
    		return res+"...";
    	}
    	
    	else
    	{
    		return productDescription+"...";
    	}
    }
    
    public static double getFoodSellingPrice(double foodPrice,double foodDiscountPercent)
    {
    	
    	Double tenPercentValue=foodDiscountPercent*0.01;
    	Double tenPercentOfPrice=tenPercentValue*foodPrice;
    	Double finalPrice=foodPrice-tenPercentOfPrice;
    	
    	return finalPrice;
    }
    
    public static String getAlphaNumericOrderId(int n)
    {
  
        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz";
  
        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);
  
        for (int i = 0; i < n; i++) {
  
            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                = (int)(AlphaNumericString.length()
                        * Math.random());
  
            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                          .charAt(index));
        }
  
        return sb.toString();
    }
    
    public double getProductsTotalSellingPrice(List<Cart> carts) {
    	double totalPrice = 0;
    	for(Cart c : carts) {
    		Optional<Food> optinal = foodDao.findById(c.getFoodId());
    		Food f = null;
    		f = optinal.get();
    	    double foodPrice = getFoodSellingPrice(f.getPrice(),f.getDiscount());
    	    totalPrice = totalPrice + (foodPrice*c.getQuantity());
    	    
    	}
    	
    	return totalPrice;
    	
    }
    
    
}
