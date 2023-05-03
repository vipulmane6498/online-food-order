package com.onlinefoodorder.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.onlinefoodorder.model.Food;

@Repository
public interface FoodDao extends JpaRepository<Food, Integer> {
	
	List<Food> findByNameContainingIgnoreCase(String name);
	List<Food> findByCategoryId(int categpryId);
	
	@Query(value="delete from Food f where f.categoryId = :categoryId")
	void deleteProductByCategoryId(@Param("categoryId") int categoryId);

}
