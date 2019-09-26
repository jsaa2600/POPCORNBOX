package com.popcornbox.myapp.rv.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.popcornbox.myapp.rv.dto.GobDTO;
import com.popcornbox.myapp.rv.dto.RvDTO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestRvDAOImplXML {

	private static final Logger logger = LoggerFactory.getLogger(TestRvDAOImplXML.class);
	
	@Inject
	@Qualifier("rvDAOImplXML")
	RvDAO rvDAO;
	
	// 리뷰 작성
	@Test
	//@Disabled
	void testWrite() {
		int count = 0;
		RvDTO rvDTO = new RvDTO();
		rvDTO.setRvid("Tester1");
		rvDTO.setRvnickname("Tester1");
		rvDTO.setRvtitle("제목1");
		rvDTO.setRvcontent("내용1");
		rvDTO.setRvpop(3.5);
		rvDTO.setRvmoviecd("20181195");
		
		count = rvDAO.write(rvDTO);
		
		logger.info(count + "건의 레코드 생성됨");
		assertEquals(1, count);
	}
	
	// 리뷰 수정
	@Test
	@Disabled
	void testModify() {
		int count = 0;
		RvDTO rvDTO = new RvDTO();
		rvDTO.setRvnum(2);
		rvDTO.setRvtitle("제목1(수정됨)");
		rvDTO.setRvcontent("내용1(수정됨)");
		rvDTO.setRvpop(4.5);
		
		count = rvDAO.modify(rvDTO);
		
		logger.info(count + "건의 레코드 수정됨");
		assertEquals(1, count);
	}
	
	// 리뷰 삭제
	@Test
	@Disabled
	void testDelete() {
		int count = 0;
		count = rvDAO.delete("2");
		
		logger.info(count + "건의 레코드 수정됨");
		assertEquals(1, count);
	}
	
	// 리뷰 좋아요 & 싫어요
	@Test
	@Disabled
	void testGoodOrBad() {
		int count = 0;
		GobDTO gobDTO = new GobDTO();
		gobDTO.setGobidfrom("Tester1");
		gobDTO.setGobidto("Tester1");
		gobDTO.setGobrvnum(1);
		gobDTO.setGobmoviecd("20181195");
		gobDTO.setGobstatus("good");
		
		count = rvDAO.goodOrBad(gobDTO);
		
		logger.info(count + "건의 레코드 수정됨");
		assertEquals(1, count);
	}
}
