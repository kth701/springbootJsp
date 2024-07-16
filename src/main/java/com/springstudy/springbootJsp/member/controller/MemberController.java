package com.springstudy.springbootJsp.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springstudy.springbootJsp.member.dao.MemberDAOMybatis;
import com.springstudy.springbootJsp.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberController {
	static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberDAOMybatis memberDAO;

	// 서비스 객체 선언
	
	@GetMapping("/now")
	public String getDbGetTime(Model model) {
		
		String getTime = memberDAO.getTime();
		logger.info("==> XML로작성한 sql과 java선언 함수 getTime() mapping결과: "+getTime);

		model.addAttribute("now", getTime);
		model.addAttribute("now2", memberDAO.getTime2());
		
		return "member/mybatisViewTest";
	}
	
	@GetMapping("/list")
	public String getList(Model model) {
		List<MemberVO> list = memberDAO.getMemberList();
		logger.info("=> member list: "+list);
		
		model.addAttribute("members", list);
		
		return "member/memberList";
	}
	@GetMapping("/view")
	public String getView(Model model, HttpServletRequest req) {
		String id =  req.getParameter("id");
		logger.info("member/view id: "+id);
		
		model.addAttribute("member",memberDAO.getMemberView(id));
		
		return "member/memberView";
	}
	// 회원 등록 입력폼 요청
	@GetMapping("/registerMember")
	public String registerMember() {
		return "member/registerMember";
	}
	// 회원 정보 데이터 처리 요청
	@GetMapping("/insert")
	public String  memberRegister(HttpServletRequest req ) {
		MemberVO vo = MemberVO.builder()
				.id(req.getParameter("id"))
				.pwd(req.getParameter("pwd"))
				.name(req.getParameter("name"))
				.email(req.getParameter("email"))
				.build();
		
		logger.info("member/insert : "+vo);
		
		memberDAO.insertMember(vo);
		//logger.info("=> member/insert isOK: "+isOK);

		return  "indexjs";
	}	
	
	@GetMapping("/remove")
	public String removeMember(HttpServletRequest req) {
		String id = req.getParameter("id");
		logger.info("=> /remove id: "+id);
		
		memberDAO.deleteMember(id);
		return "redirect:/member/list";
	}
	
	@GetMapping("/modify")
	public String modifyMembver(HttpServletRequest req) {
		MemberVO vo = MemberVO.builder()
				.id(req.getParameter("id"))
				.pwd(req.getParameter("pwd"))
				.name(req.getParameter("name"))
				.email(req.getParameter("email"))
				.build();
		
		logger.info("member/modify : "+vo);
		
		memberDAO.updateMember(vo);
	
		return "redirect:/member/list";
	}
	
	@GetMapping("/idcheck")
	public String idCheck(HttpServletRequest req) {
		String id = req.getParameter("id");
		
		String isOK = memberDAO.idCheck(id);
		
		logger.info("=> /idcheck id: "+id);
		logger.info("=> id check result: "+isOK);
		logger.info("=> "+( isOK.equals("true") ? "이미 사용중인 아이디입니다.":"사용가능한 아이디입니다."));
		
		return "redirect:/member/list";
	}
	
	
	// ------------------------------------------ //
	// 동적 SQL
	// ------------------------------------------ //
	// 조건 검색 하는 DAO기능 요청
	@GetMapping("/searchMember")
	public String searchMember(Model model, HttpServletRequest req) {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		model.addAttribute("members",memberDAO.getMemberListIf(name, email));
		
		return "member/memberList";
	}
	
	@GetMapping("/foreachMemberSelect")
	public String foreachMember(Model model) {
		
		List<String> nameList = new ArrayList<>();
		nameList.add("홍길동");
		nameList.add("이순신");
		nameList.add("강감찬");
		
		model.addAttribute("members",memberDAO.getForEachSelect(nameList));
		
		return "member/memberList";
	}
	@GetMapping("/foreachMemberInsert")
	public String foreachMemberInsert(Model model) {
		
		List<MemberVO> memberList = new ArrayList<>();
		
		for (int i=100; i<104; i++) {
			
			MemberVO vo = MemberVO.builder()
					.id("m"+i).pwd("1234").name("김길순"+i).email("m"+i+"@test.com")
					.build();
			
			memberList.add(vo);
		}
		logger.info("=> foreach Insert: "+memberList);
		// 일단보류
		//model.addAttribute("members",memberDAO.setForEachInsert(memberList));

		return "redirect:/member/list";

	}
	

}
