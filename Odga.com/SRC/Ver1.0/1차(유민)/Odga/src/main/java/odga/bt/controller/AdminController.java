package odga.bt.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import odga.bt.domain.Admin;
import odga.bt.domain.Member;
import odga.bt.domain.Touritems;
import odga.bt.service.AdminService;
import odga.bt.vo.Chart;
import odga.bt.vo.GenderChart;

@Controller
@RequestMapping("/")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("dashboard.do")
    public ModelAndView chart() {
		List<Chart> areaC = service.areaChart();
		List<Member> memberC = service.memberChart();
		List<GenderChart> genderC = service.genderChart();
		Map<String, Object> statistic = service.getStatistics();
		List<Member> adminList = service.listAdmin();
		Touritems bestItem = service.bestTouritem();
		ModelAndView mv = new ModelAndView("dashboard","areaC",areaC);
		mv.addObject("memberC", memberC);
		mv.addObject("genderC", genderC);
		mv.addObject("statistic", statistic);
		mv.addObject("admin", adminList);
		mv.addObject("bestItem", bestItem);
		return mv;
    }
	// ȸ������Ʈ
	@RequestMapping("/memberList.do")
	public ModelAndView m_listing() {
		List<Member> m_list = service.m_listS();
		ModelAndView mv = new ModelAndView("member_list", "m_list", m_list);
			
			return mv;	
	}
   @RequestMapping("/map.do") //�ּ�
   public String map() {
      return "map"; 
   }

   @RequestMapping("/user.do") //����������
   public String user() {
      return "user"; 
   }
}
