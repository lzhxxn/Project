package odga.bt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import odga.bt.domain.Review;
import odga.bt.domain.Support;
import odga.bt.service.ReviewService;

@Log4j
@Controller
@RequestMapping("")
public class ReviewController {
	@Autowired
	private ReviewService service;

	@GetMapping("write")
	public String write() {	//���� �ۼ� ������
		return "review/write"; 
	}
	@PostMapping("write")
	public String write(Review review, MultipartFile file) {	//���� �ۼ� ������

		String name = file.getName();
		
		review.setB_img(service.saveStore(file));
		
		
		service.insertS(review);
		
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+name+"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		
		return "redirect:review"; 
		
	}
	@RequestMapping("/support.do")
    public String support(Support support) {
	   return "support";
	}
	@PostMapping("/support.do")
	public String supportS(Support support) {
		service.insertI(support);
		return "redirect:index.do";
	}
	@GetMapping("/notifications.do")
	public ModelAndView notifications() {
		List<Support> notifications = service.notificationsS();
		ModelAndView mv = new ModelAndView("notifications", "notifications", notifications);
		return mv;
	}
	
	@GetMapping("/content.do")
	public ModelAndView content(String s_subject) {
		System.out.println("#subject: " + s_subject);
		Support support = service.selectByTitle(s_subject);
		ModelAndView mv = new ModelAndView("content", "support", support);
		return mv;
	}
	
	@GetMapping("review")
	public ModelAndView review(HttpServletRequest request) {	//��ǻ ������ ������
		
		List<Review> review = service.reviewS();
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("review/review");
		mv.addObject("review", review);
		
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info("MAV review(): " + review);
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		return mv;
	}
	
//	@GetMapping("selectByWriter")
//	public ModelAndView selectByWriter(String b_writer) {	//��ǻ ������ ������
//		List<Review> selectByWriter = service.selectByWriterS(b_writer);
//		
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		log.info("MAV review(): " + selectByWriter);
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		
//		return new ModelAndView("redirect:review/review", "review", selectByWriter);
//	}
	
//	@GetMapping("review")
//	public ModelAndView reviewF() { //���� �� ����Ȯ��
//		List<Review> review = service.reviewS();
//		
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		log.info("MAV review(): " + review);
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		
//		return "review";
//	}
	
//	@GetMapping("/review_details")
//	public String review_detailsF() {
//		return "review/review_detailsF"; 
//	}   
	@GetMapping("/review_details")
	public ModelAndView review_details(long b_id) {
		return new ModelAndView("review/review_details", "review", service.getReviewS(b_id));
	}   
}
