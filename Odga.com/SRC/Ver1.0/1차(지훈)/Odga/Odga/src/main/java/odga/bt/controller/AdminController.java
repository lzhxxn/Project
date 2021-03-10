package odga.bt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import odga.bt.domain.ListResult;
import odga.bt.domain.ListVo;
import odga.bt.domain.Member;
import odga.bt.service.MemberService;
import odga.bt.service.TouritemsService;


@Controller
public class AdminController {
	
	   @Autowired
	   private MemberService service;
	   @Resource
	   private TouritemsService tservice;

	//관리자페이지
	   @RequestMapping("/dashboard.do") //통계 선호도
	   public ModelAndView dashboard(HttpServletRequest request) {
		   HttpSession session = request.getSession();
			String cpStr = request.getParameter("cp");
			String psStr = request.getParameter("ps");
			//(1) cp 
					int cp = 1;
					if(cpStr == null) {
						Object cpObj = session.getAttribute("cp");
						if(cpObj != null) {
							cp = (Integer)cpObj;
						}
					}else {
						cpStr = cpStr.trim();
						cp = Integer.parseInt(cpStr);
					}
					session.setAttribute("cp", cp);
					
					//(2) ps 
					int ps = 10;
					if(psStr == null) {
						Object psObj = session.getAttribute("ps");
						if(psObj != null) {
							ps = (Integer)psObj;
						}
					}else {
						psStr = psStr.trim();
						int psParam = Integer.parseInt(psStr);
						
						Object psObj = session.getAttribute("ps");
						if(psObj != null) {
							int psSession = (Integer)psObj;
							if(psSession != psParam) {
								cp = 1;
								session.setAttribute("cp", cp);
							}
						}else {
							if(ps != psParam) {
								cp = 1;
								session.setAttribute("cp", cp);
							}
						}
						
						ps = psParam;
					}
					session.setAttribute("ps", ps);
					
				int rangeSize = 10;
					
				//Touritems touritems = service.selectByTitleS(title);
				ListResult listResult = tservice.getTouritemsListResult(cp, ps, rangeSize);
			
				ListVo vo = new ListVo();
				//vo.setTouritems(touritems);
				vo.setListResult(listResult);
				ModelAndView mv = new ModelAndView("dashboard", "ListVo", vo);
				return mv;
	 } 
	// 회원리스트
	@RequestMapping("/tables.do")
	public ModelAndView m_listing() {
		List<Member> m_list = service.m_listS();
		ModelAndView mv = new ModelAndView("tables", "m_list", m_list);
		
		return mv;	
	}
   @RequestMapping("/map.do") //주소
   public String map() {
      return "map"; 
   }

   @RequestMapping("/user.do") //관리자정보
   public String user() {
      return "user"; 
   }
}
