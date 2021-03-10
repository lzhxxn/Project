package odga.bt.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import odga.bt.domain.Review;
import odga.bt.domain.Support;

public interface ReviewService {
	List<Review> reviewS();
	Review getReviewS(long b_id);
	List<Review> selectByWriterS(String b_writer);
	void insertS(Review review);
	void insertI(Support support);  //문의하기
	
	int countByCatgoS(String b_catgo);
	int countByFamilyS();
	

	String saveStore(MultipartFile file);
	boolean writeFile(MultipartFile file, String name);
	
	//문의게시판(관리자)
	List<Support> notificationsS();
	//문의게시판상세페이지(관리자)
	Support selectByTitle(String s_subject);
	List<Review> selectBestReviewS();
	List<Review> selectByReviewS(long m_id);
}
