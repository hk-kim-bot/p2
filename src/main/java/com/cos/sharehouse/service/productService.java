package com.cos.sharehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.sharehouse.model.House;
import com.cos.sharehouse.model.like;
import com.cos.sharehouse.repository.houseRepository;
import com.cos.sharehouse.repository.likeRepository;

@Service
public class productService {
	@Autowired
	private houseRepository houseRepository;
	@Autowired
	private likeRepository likeRepository;
	
	@Transactional(readOnly=true)
	public Page<House> 제품검색(String[] type,String[] category,int[] bedroom,String amenities,Pageable page) {
		
		Page<House> houselist =null;
//		//repository에 가서 직접 sql 문 입력 해주기
//		//타입은 or  침실수 or 건물도 or  편의 시설은 and 
		amenities = amenities.replace(",", ",%"); //amenities like 와일드카드 사용하기위함
		
		if(type.length==0) {
			type =new String[] {"entire","privateRoom","publicRoom"};
		}
		
		if(category.length==0) {
			category=new String[] {"housing","apartment","hotel","separate"};
		}
		
		if(bedroom.length==0) {
			bedroom=new int[] {1,2,3,4};
		}
		
		if(amenities.equals("")) {
			amenities ="%%";
		}
		
		
		System.out.println(houseRepository.searchhouse(type,category,bedroom,amenities,page));
		houselist=houseRepository.searchhouse(type,category,bedroom,amenities,page);
		
		//----성공----
//		System.out.println(houseRepository.searchtype(type,page));
//		System.out.println(houseRepository.searchcategory(category,page));
//		System.out.println( houseRepository.search(amenities,page));
//		System.out.println(houseRepository.searchbedroom(bedroom, page));// 방갯수 찾기는 성공 
		
		return houselist;
	}
	@Transactional(readOnly=true)
	public Page<House> house전체보기(Pageable page){
		return houseRepository.findAll(page);
	}
	@Transactional(readOnly=true)
	public List<like> like전체보기(String userid){
		return likeRepository.findByUserid(userid);
		
	}
	@Transactional
	public void unlike(String houseid, String userid) {
		likeRepository.deleteByHouseidAndUserid(houseid,userid);
	}
	@Transactional
	public void tolike(String houseid, String userid) {
		like refer=new like();
		refer.setHouseid(houseid);
		refer.setUserid(userid);
		likeRepository.save(refer);
	}
	@Transactional(readOnly=true)
	public Page<House> 찜목록보기(String userid,Pageable page){
		return houseRepository.findlikelist(userid,page);
	}
	
	
	
}
