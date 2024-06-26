package com.audiro.repository;

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
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)

public class UserDaoTest {

	@Autowired
	private UserDao userDao;
	
	@Test
	public void testSelectById() {
		User user = userDao.selectById("id1");
		Assertions.assertNotNull(user);
		log.debug(user.toString());
		
		user = userDao.selectById("id100");
		Assertions.assertNull(user);
		log.debug("user is null");
	}
}
