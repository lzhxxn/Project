package odga.bt.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import odga.bt.domain.ListResult;
import odga.bt.domain.Member;
import odga.bt.domain.Review;
import odga.bt.service.MemberService;
import odga.bt.service.ReviewService;
import odga.bt.service.TouritemsService;

@Controller
/* @RequestMapping(value = "/member/*") */
public class MemberController {
	@Autowired
	private MemberService service;
    @Autowired
    private ReviewService rservice;
    @Resource
    private TouritemsService tservice;

	
	/*@GetMapping("login.do")
	public String Join() {		
		//service.Join(member);		
		return "login";
	}*/
	@PostMapping("/join.do")
	public String joinS(@RequestParam(value = "file", required = false) MultipartFile file, Member member) {
		String m_fname = file.getName();
		String m_ofname = file.getOriginalFilename();
		long m_filesize = file.getSize();
		//System.out.println("m_fname: " + m_fname);
		//System.out.println("m_ofname: " + m_ofname);
		//System.out.println("m_filesize: " + m_filesize);
		member.setM_fname(m_ofname);
		member.setM_ofname(m_fname);
		service.joinS(member);
		service.saveStore(file);
		
		System.out.println("email: " + member.getM_email());
		System.out.println("nick: " + member.getM_name());
		System.out.println("pwd: " + member.getM_pwd());
		System.out.println("phone: " + member.getM_phone());
		System.out.println("gender: " + member.getM_gender());
		System.out.println("birth: " + member.getM_birth());
		System.out.println("m_fname: " + member.getM_fname());
		System.out.println("m_ofname: " + member.getM_ofname());
		System.out.println("m_verify: " + member.getM_verify());
		System.out.println("m_verify: " + member.getM_about());
		System.out.println("#service: " + service);
		
		/*
		 * if(m_ofname == null && m_ofname.length() == 0){ m_fname = null; m_ofname =
		 * null; m_filesize = -1; member.setM_fname(m_fname);
		 * member.setM_ofname(m_ofname); member.setM_filesize(m_filesize); }else{
		 * m_ofname = m_ofname.trim(); member.setM_fname(m_fname);
		 * member.setM_ofname(m_fname); member.setM_filesize(m_filesize);
		 * service.joinS(member); } service.saveStore(file);
		 */
		return "redirect:index.do";
	}
	/*
	@RequestMapping(value = "checkId.jy", method = { RequestMethod.POST, RequestMethod.GET})
	public void checkId(@RequestParam(required=false) String m_email, HttpServletResponse response) throws Exception {
		service.checkId(m_email, response);
	}
	*/
	
	/*
	@RequestMapping(value = "checkId.jy", method = RequestMethod.POST )
	@ResponseBody
	public String checkId(@ModelAttribute Member member) throws Exception {
		
		System.out.println("■■■■■■TEST 시작 ■■■■■■■");
		System.out.println("--VO : " + member.toString());
		System.out.println("email : " + member.getM_email());
		System.out.println("gender : " + member.getM_gender());
		System.out.println("id : " + member.getM_id());
		System.out.println("nick : " + member.getM_nick());
		System.out.println("phone : " + member.getM_phone());
		System.out.println("pwd : " + member.getM_pwd());
		System.out.println("birth : " + member.getM_birth());
		System.out.println("rdate : " + member.getM_rdate());
		System.out.println("■■■■■■TEST 종료 ■■■■■■■");
		
		String inputEmail = member.getM_email();
		
		
		int test = service.checkId(inputEmail);
		
		
		return Integer.toString(test); 
		
	}
	*/
	
	@RequestMapping(value = "checkId.jy", method = RequestMethod.POST)
	public @ResponseBody int checkId(@RequestParam String m_email, HttpServletResponse response) throws Exception {
		//System.out.println("★★★★★★★★★★★★★" + m_email);
		int checkid = service.checkId(m_email, response);
		return checkid;
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/member.do", method = RequestMethod.POST)
	private String update_member(@ModelAttribute Member member, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		if(session.getAttribute("member") == null) {
			return "redirect:../login.do";
		}
		session.setAttribute("member", service.update_member(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:member.do";
		}
	
	@RequestMapping("/member_review.do")
	   public ModelAndView member_review(@RequestParam long m_id, HttpServletRequest request) {
		   HttpSession session = request.getSession();
			System.out.println("#m_id: " + m_id);
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
					
				List<Review> review = rservice.selectByReviewS(m_id);
				ListResult listResult = tservice.getTouritemsListResult(cp, ps, rangeSize);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member_review");
			    mv.addObject("review", review);
				mv.addObject("listResult", listResult);
				System.out.println("#review: " + review);
				return mv;

	   }
		
}

