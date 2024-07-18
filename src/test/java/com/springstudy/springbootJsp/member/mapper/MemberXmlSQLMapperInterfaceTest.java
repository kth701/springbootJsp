package com.springstudy.springbootJsp.member.mapper;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.RepetitionInfo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;
import org.springframework.transaction.annotation.Transactional;

import com.springstudy.springbootJsp.member.vo.MemberVO;

import lombok.extern.log4j.Log4j2;

//Test시 Transaction은 자동으로 rollback하므로 commit어노테이션을 적용
@Commit		
@SpringBootTest
@Log4j2
class MemberXmlSQLMapperInterfaceTest {
	
	@Autowired
	private MemberXmlSQLMapperInterface memberMapperXml;

	//@RepeatedTest어노테이션: db처리 여러번 반복 처리할 경우 적용(ㅍ)
	@Test
	@DisplayName("회원등록 테스트")
	@Transactional
	@RepeatedTest(value=5, name="{DisplayName}{currentRepetition}/{totalRepetition}")
	void testInsertMember(RepetitionInfo repetitionInfo) {
		
		log.info("java interface mapper와 xml db처리와 연결하는 테스트");
		int i = repetitionInfo.getCurrentRepetition();
		try {

			MemberVO vo = MemberVO.builder()
					.id("t"+i)
					.pwd("1234")
					.email("test"+i+"@gmail.com")
					.name("홍길동t"+i)
					.build();
			
			memberMapperXml.insertMember(vo);

			
		} catch (Exception e) {}
	}

}
