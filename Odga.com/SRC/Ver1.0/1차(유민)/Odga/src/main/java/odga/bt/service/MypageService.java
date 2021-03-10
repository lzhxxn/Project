package odga.bt.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odga.bt.domain.Member;
import odga.bt.domain.Planner;
import odga.bt.domain.Review;
import odga.bt.vo.DetailVo;

public interface MypageService {
	//���� ���ƿ�
	List<Review> listMyLike(long m_id);
	//ȸ������ ����
	Member updateS(Member member) throws Exception;
	boolean leaveS(Member member, HttpSession session, HttpServletResponse response);
	//���� ����
	public List<Planner> myPlanS(long m_id);
	public DetailVo planDetails(long m_id, long p_id);
	//�����ı�
	List<Review> selectByReviewS(long m_id);
}
