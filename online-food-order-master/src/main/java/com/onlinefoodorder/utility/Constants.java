package com.onlinefoodorder.utility;

public class Constants {

	public enum DeliveryStatus {
		DELIVERED("Delivered"),
		PENDING("Pending"),
		ON_THE_WAY("On the Way");
		
		private String status;

	    private DeliveryStatus(String status) {
	      this.status = status;
	    }

	    public String value() {
	      return this.status;
	    }
	     
	}
	
}
