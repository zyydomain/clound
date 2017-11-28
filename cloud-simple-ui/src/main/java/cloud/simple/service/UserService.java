/*
 * Copyright 2012-2020 the original author or authors.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * @author lzhoumail@126.com/zhouli
 * Git http://git.oschina.net/zhou666/spring-cloud-7simple
 */
package cloud.simple.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

import cloud.simple.model.User;

@Service
public class UserService {
	@Autowired
	RestTemplate restTemplate;

	final String SERVICE_NAME = "cloud-simple-service";

	/**
	 * 断路器的基本作用就是@HystrixCommand注解的方法失败后，系统将自动切换到fallbackMethod方法执行。断路器Hystrix具备回退机制、请求缓存和请求打包以及监控和配置等功能，
	 * 在这里我们只是使用了它的核心功能：回退机制，使用该功能允许你快速失败并迅速恢复或者回退并优雅降级
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@HystrixCommand(fallbackMethod = "fallbackSearchAll")
	public List<User> readUserInfo() {
		List<User> list = restTemplate.getForObject("http://" + SERVICE_NAME + "/user", List.class);
		return list;
	}

	@SuppressWarnings("unused")
	private List<User> fallbackSearchAll() {
		System.out.println("HystrixCommand fallbackMethod handle!");
		List<User> ls = new ArrayList<User>();
		User user = new User();
		user.setUsername("TestHystrixCommand");
		ls.add(user);
		return ls;
	}
}
