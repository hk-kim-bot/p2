package com.cos.sharehouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.sharehouse.model.like;

public interface likeRepository extends JpaRepository<like,Integer>{

	List<like> findByUserid(String userid);

	void deleteByHouseidAndUserid(String houseid, String userid);
	


}
