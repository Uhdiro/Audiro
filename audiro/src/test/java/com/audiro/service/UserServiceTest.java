package com.audiro.service;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations= { "file:src/main/webapp/WEB-INF/application-context.xml" }
)

public class UserServiceTest {
	
	@Autowired
	private UserService userService;
	
//	@Test
	public void testCheckId() {
		boolean result = userService.checkId("id1");
		Assertions.assertEquals(false, result);
		log.debug("result is false");
		
		result = userService.checkId("id100");
		Assertions.assertEquals(true, result);
		log.debug("result is true");
	}
	
	@Test
	public void testCheckNickname() {
		boolean result = userService.checkNickname("nick1");
		Assertions.assertEquals(false, result);
		log.debug("result is false");
		
		result = userService.checkNickname("nick100");
		Assertions.assertEquals(true, result);
		log.debug("result is true");
	}
}
