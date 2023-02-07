package com.cos.sharehouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.sharehouse.model.House;

public interface houseRepository extends JpaRepository<House,Integer>{
	
}
