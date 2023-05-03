package com.onlinefoodorder.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.onlinefoodorder.model.Cart;

@Repository
public interface CartDao extends JpaRepository<Cart, Integer> {
	
	List<Cart> findByUserId(int userId);
	Long countByUserId(int userId);

}
