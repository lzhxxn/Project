package odga.bt.mapper;

import java.util.List;

import odga.bt.domain.Member;


public interface MemberMapper {
	
	public int checkId(String m_email) throws Exception;
	public void joinS(Member member) throws Exception;
	public Member loginS(String m_email);
	public boolean update_member(Member member);
	
	
	//이메일관련
	public boolean emailAuthIns(Member member) throws Exception; //이메일 인증키 저장
	public String emailAuthChk(String authkey) throws Exception; //이메일 인증키 대조
	public boolean emailAuthDel(String authkey) throws Exception; //이메일 인증키 삭제

	//회원리스트
	List<Member> list();
}
