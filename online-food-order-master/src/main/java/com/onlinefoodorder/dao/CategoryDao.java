package com.onlinefoodorder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.onlinefoodorder.model.Category;

@Repository
public interface CategoryDao extends JpaRepository<Category, Integer> {

}
