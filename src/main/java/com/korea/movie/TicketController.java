package com.korea.movie;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.TheaterDAO;
import dao.TicketDAO;
import vo.DateVO;
import vo.TheaterVO;
import vo.TicketVO;

@Controller
public class TicketController {
	
	TicketDAO ticket_dao;
	TheaterDAO theater_dao;
	
	public TicketController( TheaterDAO theater_dao , TicketDAO ticket_dao) {
		this.theater_dao=theater_dao;
		this.ticket_dao = ticket_dao;
	}
	
	
	@RequestMapping("/")
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
	
	@RequestMapping("/timelist.do")
	@ResponseBody
	public List<TheaterVO> timelist(String m_name , String city , String district ,String date_s){
		
		List<TheaterVO> list=null;
		System.out.println();
		list=theater_dao.selectTime(m_name ,city,district,date_s);
		
		return list;
	}
	
	@RequestMapping("/ticketform.do")
	public String ticketForm() {
		return "WEB-INF/views/ticket/seat.jsp";
	}
	
	
	@RequestMapping("/paymoney.do")
	public String payMoney(String[] seat) {
		
		
		
		return "WEB-INF/views/ticket/pay.jsp";
	}
	
	@RequestMapping("/saveTicket.do")
	@ResponseBody
	public String saveTicket(String[] seats ,TicketVO vo) {
		int res=0;
		for(int i = 0 ; i < seats.length ; i++) {
			vo.setSeat(seats[i]);
			res=ticket_dao.saveticket(vo);
		}
		if(res==1) {
		return "성공";
		}else {
			return "실패";
		}
		
	}
}












