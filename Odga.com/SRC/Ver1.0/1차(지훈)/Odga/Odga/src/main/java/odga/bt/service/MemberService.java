package odga.bt.service;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import odga.bt.domain.ListResult;
import odga.bt.domain.Member;

public interface MemberService {
	
	public int checkId(String m_email, HttpServletResponse response) throws Exception;
	//회원가입
	public void joinS(Member member);
	//로그인 
	Member login(Member member, HttpServletResponse response, ServletContext servletContext) throws Exception;
	//로그아웃
	void logout(HttpServletResponse response, HttpSession session);
	
	//회원정보 수정
	Member update_member(Member member) throws Exception;
	
	// 이메일
	public void regist(Member member) throws Exception;
	public String userAuth(String authkey) throws Exception;

	// 이미지업로드
	boolean writeFile(MultipartFile file, String saveFileName);
	String saveStore(MultipartFile file);	
	
	// 회원리스트
	List<Member> m_listS();
}
