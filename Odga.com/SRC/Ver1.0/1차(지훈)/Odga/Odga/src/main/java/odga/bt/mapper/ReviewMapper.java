package odga.bt.mapper;

import java.util.List;

import odga.bt.domain.Review;
import odga.bt.domain.Support;

public interface ReviewMapper {
	List<Review> review();
	Review getReview(long b_id);
	List<Review> selectByWriter(String b_writer);
	void insert(Review review);
	void insertS(Support support); //문의하기
	
	int countByCatgo(String catgo);
	int countByFamily();
	
	//문의하기 게시판(관리자)
	List<Support> notifications();
	//문의게시판 상세페이지(관리자)
	Support selectByTitle(String s_subject);
	List<Review> selectBestReview();
	List<Review> selectByReview(long m_id);
	
}
