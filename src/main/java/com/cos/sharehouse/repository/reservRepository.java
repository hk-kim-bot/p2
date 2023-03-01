package com.cos.sharehouse.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.sharehouse.model.Users;
import com.cos.sharehouse.model.reserv;

public interface reservRepository extends JpaRepository<reserv,Integer>{

	Page<reserv> findByUsers(Users user,Pageable page);

}
