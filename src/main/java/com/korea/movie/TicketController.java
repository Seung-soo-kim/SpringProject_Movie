package com.korea.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.SeatDAO;
import dao.TheaterDAO;
import dao.TicketDAO;
import vo.CheckVO;
import vo.DateVO;
import vo.SeatVO;
import vo.TheaterVO;
import vo.TicketVO;

@Controller
public class TicketController {
	
	@Autowired
	HttpServletRequest request;
	
	TicketDAO ticket_dao;
	TheaterDAO theater_dao;
	SeatDAO seat_dao;
	public TicketController( TheaterDAO theater_dao , TicketDAO ticket_dao, SeatDAO seat_dao) {
		this.theater_dao=theater_dao;
		this.ticket_dao = ticket_dao;
		this.seat_dao = seat_dao;
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
	public String ticketForm(HttpSession session , CheckVO vo) {
		 session = request.getSession();
		 session.setAttribute("vo", vo);
		return "WEB-INF/views/ticket/seat.jsp";
	}
	@RequestMapping("/ticketform2.do")
	public String ticketForm() {
		
		return "WEB-INF/views/ticket/seat.jsp";
	}
	@RequestMapping("/paymoney.do")
	public String payMoney(String[] seat) {
		
		
		
		return "WEB-INF/views/ticket/pay.jsp";
	}
	
	@RequestMapping("/saveTicket.do")
	@ResponseBody
	public String saveTicket(String[] seats ,TicketVO vo ,SeatVO so, int seat_count ) {
		int res=0;
		String seat="";
		for(int i = 0 ; i < seats.length ; i++) {
			so.setSeat(seats[i]);
			seat_dao.seatinsert(so);
			seat+=seats[i];
			if(i != seats.length -1) {
				seat+=",";
			}
		}
		vo.setSeat_count(seat_count);
		vo.setSeat(seat);
		res=ticket_dao.saveticket(vo);
		theater_dao.seatchange(seat_count, vo.getM_name() ,vo.getCity() , vo.getDistrict() ,vo.getDate_s() , vo.getTime());
		System.out.println(seat);
		return "";
		
	}
	
	@RequestMapping("/saveseat.do")
	public String saveSeat(HttpSession session) { 
		session.removeAttribute("vo");
		return "WEB-INF/views/ticket/test.jsp";
	}
	
	
	@RequestMapping("/fountseat.do")
	@ResponseBody
	public List<SeatVO> fountSeat(SeatVO vo){
		List<SeatVO> list = null;
		list = seat_dao.foundseat(vo);
		return list;
	}
}












