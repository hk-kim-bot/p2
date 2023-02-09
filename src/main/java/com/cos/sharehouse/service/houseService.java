package com.cos.sharehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.sharehouse.model.House;
import com.cos.sharehouse.model.Users;
import com.cos.sharehouse.repository.houseRepository;

@Service
public class houseService {
	
	@Autowired
	private houseRepository houseRepository;
	
	@Transactional
	public void save(House house, Users user) {
		house.setUsers(user);
		houseRepository.save(house);
	}
}
