package com.kh.spring.exception.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.exception.AuthenticationException;
import com.kh.spring.exception.InvalidArgumentsException;
import com.kh.spring.exception.TooLargeValueException;
import com.kh.spring.exception.UserIdNotFoundByAdminException;
import com.kh.spring.exception.UserIdNotFoundException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class ExceptionHandlingController {
	
	private ModelAndView createErrorResponse(RuntimeException e) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage()).setViewName("include/error_page");
		log.info("발생예외 : {}", e);
		return mv;
	}
	
	@ExceptionHandler(AuthenticationException.class)
	protected ModelAndView authenticationError(AuthenticationException e) {
		return createErrorResponse(e);
	}
	@ExceptionHandler(UserIdNotFoundException.class)
	protected ModelAndView idNotFoundError(UserIdNotFoundException e) {
		return createErrorResponse(e);
	}
	@ExceptionHandler(TooLargeValueException.class)
	protected ModelAndView largeValueError(TooLargeValueException e) {
		return createErrorResponse(e);
	}
	
	@ExceptionHandler(InvalidArgumentsException.class)
	protected ModelAndView invaildArgumentError(InvalidArgumentsException e) {
		return createErrorResponse(e);
	}
	
	@ResponseBody
	@ExceptionHandler(UserIdNotFoundByAdminException.class)
	public ResponseEntity<Map<String, Object>> handleNotFound(UserIdNotFoundByAdminException e) {
	    Map<String, Object> body = new HashMap<>();
	    body.put("message", e.getMessage());
	    return ResponseEntity.status(HttpStatus.NOT_FOUND).body(body);
	}
	

}
