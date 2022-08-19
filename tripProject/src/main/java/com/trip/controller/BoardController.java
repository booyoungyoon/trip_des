package com.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trip.domain.Criteria;
import com.trip.domain.PageDTO;
import com.trip.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
	
	private BoardService service;
	
	@RequestMapping("page.do")
	public String list(Criteria cri, Model model) {
		log.info("list---------------------");
		int total = service.getTotal(cri);
		log.info("total count : " + total);
		model.addAttribute("list", service.getList(cri));
		log.info("test------------------------------" + service.getList(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		return "board/board";
	}

}
