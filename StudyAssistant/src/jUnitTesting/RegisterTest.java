package jUnitTesting;


import static org.junit.Assert.*;

import org.junit.Test;
import com.beans.UserBean;
import com.dao.Authentication;

public class RegisterTest {

	@Test
	public void testRegister() {
		UserBean user = new UserBean("Abc","abcd.dedf","abc@somaiya.edu","passkey123");
				
		int result = Authentication.register(user);
		assertEquals(1,result);
		
	}

}
