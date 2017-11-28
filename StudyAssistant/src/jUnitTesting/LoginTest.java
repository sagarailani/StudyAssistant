package jUnitTesting;

import static org.junit.Assert.*;

import org.junit.Test;
import com.beans.UserBean;
import com.dao.Authentication;


public class LoginTest {

	@Test
	public void testLogin() {
		UserBean user = new UserBean("sagar.ailani","hello");
		
		int result = Authentication.login(user);
		assertEquals(1,result);
	}

}
