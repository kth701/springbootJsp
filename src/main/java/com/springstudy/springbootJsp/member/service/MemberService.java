package com.springstudy.springbootJsp.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springstudy.springbootJsp.member.dto.PageRequestDTO;
import com.springstudy.springbootJsp.member.dto.PageResponseDTO;
import com.springstudy.springbootJsp.member.mapper.MemberXmlSQLMapperInterface;
import com.springstudy.springbootJsp.member.vo.MemberVO;

@Service
public class MemberService {
	
	// DAO(database 처리하는 인터페이스 구현)
	@Autowired
	private MemberXmlSQLMapperInterface memberDAO;

	// 회원 목록 (페이지 기능 추가)
	public PageResponseDTO<MemberVO> getMemberList(PageRequestDTO pageRequestDTO){
		
		List<MemberVO> list = memberDAO.getMemberList(); // 레코드 전체 추출
		
		// 페이지 처리 기능을 추가
		int total = memberDAO.getCount(pageRequestDTO);
		
		return null;
	}
}
