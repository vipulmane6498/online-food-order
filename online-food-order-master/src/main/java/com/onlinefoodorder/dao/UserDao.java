package com.onlinefoodorder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.onlinefoodorder.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {
	
	//user table name
	//integer datatype of primary key
	User findByEmailidAndPassword(String emailId, String password);//custom query methods
	User findByEmailid(String emailId);
	User findByEmailidAndMobileno(String emailId, String mobileNo);

}
