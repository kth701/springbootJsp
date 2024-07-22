package com.springstudy.springbootJsp.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springstudy.springbootJsp.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/thymeleaf")
public class ThymeleafViewTestController {
	
	@GetMapping("/ex01")
	public String thymeleafRoot(Model model) {
		
		model.addAttribute("msg","Hello Thymeleaf !!!");
		
		return "thymeleaf/root";

	}
	
	@GetMapping("/ex02")
	public String  ex02(Model model) {
		MemberVO vo = MemberVO.builder()
				.id("id100").pwd("1234")
				.name("hong100").email("id100@gmail.com")
				.build();
		
		model.addAttribute("member", vo);
		
		return "thymeleaf/memberView";
	}
		
	@GetMapping("/ex03")
	public String  ex03(Model model) {
		List<MemberVO> list = new ArrayList<>();
		
		for (int i=0;i<3; i++) {
			MemberVO vo = MemberVO.builder()
					.id("id100"+i).pwd("1234")
					.name("hong100"+i).email("id100"+i+"@gmail.com")
					.build();
			
			list.add(vo);
		}

		model.addAttribute("members", list);
		
		
		return "thymeleaf/memberList";
	}
	
	@GetMapping("/ex04")
	public String thymeleafLink(Model model) {	
		return "thymeleaf/href";
	}
	@GetMapping("/ex05")
	public String thymeleafParam(Model model, 
				String id, String name) {
		
		model.addAttribute("id",id);
		model.addAttribute("name" , name);
		
		return "thymeleaf/href_param";

	}	
	@GetMapping("/ex06")
	public String thymeleafLayout(Model model, 
				String id, String name) {
		
		model.addAttribute("id",id);
		model.addAttribute("name" , name);
		
		return "thymeleaf/layoutViewTest";

	}	
	@GetMapping("/ex07")
	public String thymeleafLayout() {

		
		return "thymeleaf/thymeleafViewTest";

	}	
			

}
