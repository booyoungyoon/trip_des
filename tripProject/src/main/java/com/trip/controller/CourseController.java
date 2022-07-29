package com.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trip.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/course/*")
public class CourseController {
	private UserMapper mapper;
	
	@RequestMapping("page.do")
	public String list(Model model) {
		return "course/coursePage";
	}
	
}