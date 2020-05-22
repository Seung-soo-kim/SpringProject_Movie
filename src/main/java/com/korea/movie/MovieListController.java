package com.korea.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieListController {

	@RequestMapping(value= {"/"})
	public String test() {
		return "WEB-INF/views/ticket/ticket_main.jsp";
	}
	
}
