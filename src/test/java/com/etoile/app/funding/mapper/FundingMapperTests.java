package com.etoile.app.funding.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/mybatis-context.xml")

@Log4j
public class FundingMapperTests {
	
	//@Setter(onMethod_ @Autowired)
	private FundingMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.fundingList(vo).forEach(funding -> log.info(funding));
//	}
}
