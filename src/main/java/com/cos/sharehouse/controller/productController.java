package com.cos.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.sharehouse.config.auth.PrincipalDetail;
import com.cos.sharehouse.service.productService;

@Controller
public class productController {
	@Autowired
	private productService productService;
	@GetMapping("/product/main")
	public String productmain(Model model,@PageableDefault(size=8,sort="id",direction= Sort.Direction.ASC)Pageable page,@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal == null) {
			model.addAttribute("houses",productService.house전체보기(page));
			System.out.println("principal null");
		}else {
			
			model.addAttribute("houses",productService.house전체보기(page));
			model.addAttribute("houselike",productService.like전체보기(Integer.toString(principal.getUser().getId())));
			
		}
		return "product/searchProduct";
	}
	@GetMapping("/search")
	public String searchproduct(
					@RequestParam(value="type")String[] type,
					@RequestParam(value="category")String[] category,
					@RequestParam(value="bedroom")int[] bedroom,
					@RequestParam(value="amenities")String amenities,
					@PageableDefault(size=8,sort="id",direction= Sort.Direction.ASC)Pageable page,
					Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		//대충 모델에 제품검색에서 나온 결과들을house 에 넣어서 뿌려주기
		if(principal == null) {
			model.addAttribute("houses",productService.제품검색(type, category, bedroom, amenities, page));
		}else {
			model.addAttribute("houses",productService.제품검색(type, category, bedroom, amenities, page));
			model.addAttribute("houselike",productService.like전체보기(Integer.toString(principal.getUser().getId())));
		}
		
//		model.addAttribute("houses",productService.제품검색(type, category, bedroom, amenities, page));
		
		
		
		return "product/searchProduct";
	}
	
}
