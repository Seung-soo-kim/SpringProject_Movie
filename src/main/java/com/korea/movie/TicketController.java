package com.korea.movie;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.TheaterDAO;
import dao.TicketDAO;
import vo.DateVO;
import vo.TheaterVO;

@Controller
public class TicketController {
	
	//TicketDAO ticket_dao;
	TheaterDAO theater_dao;
	
	public TicketController( TheaterDAO theater_dao) {
		this.theater_dao=theater_dao;
	}
	
	
	@RequestMapping(value= {"/"})
	public String test() {
		return "WEB-INF/views/ticket/test.jsp";
	}
	
	@RequestMapping("/citylist.do")
	@ResponseBody
	public List<TheaterVO> citylist(String m_name){
	
		List<TheaterVO> list= null;
		
		list=theater_dao.selectCity(m_name);

		return list;
	}
	 
	@RequestMapping("/districtlist.do")
	@ResponseBody
	public List<TheaterVO> districtlist(String m_name , String city){
	
		List<TheaterVO> list= null;
		
		list=theater_dao.selectDistrict(m_name ,city);

		return list;
	}
	
	@RequestMapping("/datelist.do")
	@ResponseBody
	public List<DateVO> datelist(String m_name , String city , String district){
	
		List<DateVO> list= null;
		
		list=theater_dao.selectDate(m_name ,city,district);

		return list;
	}
}












