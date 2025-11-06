package com.kh.spring.exception;

public class UserIdNotFoundByAdminException extends RuntimeException {

	public UserIdNotFoundByAdminException(String msg) {
		super(msg);
	}
	
}
