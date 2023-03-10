package com.cos.sharehouse.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.sharehouse.model.Users;

public interface userRepository extends JpaRepository<Users,Integer> {

	Optional<Users> findByUsername(String username);

}
