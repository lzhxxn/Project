package odga.bt.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import odga.bt.emailutill.MailHandler;
import odga.bt.emailutill.TempKey;
import odga.bt.mapper.MemberMapper;
import odga.bt.filesetting.Path;

import odga.bt.domain.Member;

@Log4j
@Service


@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Autowired
	public MemberMapper memberMapper;
	@Autowired
	HttpSession session;
	
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public void joinS(Member member) {
		System.out.println("#MemberServiceImpl joinS() member: " + member);
		try {
			memberMapper.joinS(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 이메일 중복검사 AJAX 
	@Override
	public int checkId(String m_email, HttpServletResponse response) throws Exception {
		int i = memberMapper.checkId(m_email);

		System.out.println("아이디 있음");
		return i;

		//PrintWriter out = response.getWriter();
		//out.println(memberMapper.checkId(m_email));
		/*
		 * log.info("#> checkId : "+i); out.close();
		 */
		
	}	
	/*
	@Override
	public int checkId(String m_email) throws Exception {
		System.out.println("진입1");
		int testt = 0;  
		
		// 업무처리
		try {
			System.out.println("진입2");
			
			memberMapper.checkId(m_email);
			
			testt = memberMapper.checkId(m_email);
			System.out.println("진입3 : "+ testt);
		}catch (Exception e){
			e.printStackTrace();
		}

	
		return testt;
	
	}
	*/
	@Override
	public Member login(Member member, HttpServletResponse response, ServletContext servletContext) throws Exception {
		System.out.println("############로그인 서비스#############");
		response.setContentType("text/html;charset=utf-8");
		//String check = member.getM_email();
		//log.info("##check"+check);
		if(memberMapper.checkId(member.getM_email()) == 0) {
			System.out.println("<script>");
			System.out.println("alert('등록된 이메일이 없습니다.');");
			System.out.println("history.go(-1);");
			System.out.println("</script>");
			return null;
		} else {
			System.out.println("************");
			String pwd = member.getM_pwd();
			System.out.println(pwd);
			Member member1 = memberMapper.loginS(member.getM_email());
			System.out.println(member1.getM_email());
			System.out.println(member1.getM_gender());
			System.out.println(member1.getM_name());
			System.out.println(member1.getM_phone());
			System.out.println(member1.getM_verify());
			return member1;
			
		}//log.info("##member"+member);
	}

	@Override
	public void logout(HttpServletResponse response, HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 완료");
		//logout(session);

	}
	
	@Override
	public Member update_member(Member member) throws Exception {
		log.info("#>member:" + member);
		memberMapper.update_member(member);
		return memberMapper.loginS(member.getM_email());
	}
	
/*---------------------------------------------
 *  이메일 관련 메서드 시작
 *--------------------------------------------*/
	
   public void regist(Member member) throws Exception {
        String key = new TempKey().generateKey(30);  // 인증키 생성
        member.setAuthkey(key);
        System.out.println("key : " + key);
        
        
        System.out.println("보내기전 값들");
        System.out.println("보내기전 값들====" + member.toString());
        // 이메일 보내기전에 인증키값을 테이블에 저장
        memberMapper.emailAuthIns(member);
        
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("서비스 이메일 인증");
        sendMail.setText(
                new StringBuffer()
                .append("<h1>메일인증</h1>")
                .append("<h1>TEST 이민용</h1>")
                //.append("<a href='http://localhost:8080/emailConfirm?authKey=")
                .append("<h1>아래의 인증키를 입력하세요</h1>")
                .append(key)
                //.append("' target='_blank'>이메일 인증 확인</a>")
                .toString());
        //deathcobra00@naver.com
        sendMail.setFrom("thecolorpoetic@gmail.com", "오디가 프로젝트");
        sendMail.setTo(member.getM_email());
        sendMail.send();
    }
 
    //이메일 인증 키 검증
    public String userAuth(String authkey) throws Exception {
    	
    	String resultVal = "";
    	
        Member member = new Member();

        if(member!=null){
            try{
            	
            	System.out.println("보내기전 값들 ==" + authkey);
            	
            	String dv = memberMapper.emailAuthChk(authkey);
            	System.out.println("결과 = " + dv);
            	
            	if ( dv != null ) {
            		memberMapper.emailAuthDel(authkey);
            		resultVal = "yes";
            	}else {
            		System.out.println("삭제안됨");
            		resultVal = "no";
            	}
            	
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resultVal;
    }

/*---------------------------------------------
 *  이메일 관련 메서드 끝
 *--------------------------------------------*/
    @Override
	public String saveStore(MultipartFile file) {
		String ofname = file.getOriginalFilename();
		System.out.println("#ofname: " + ofname);
		int idx = ofname.lastIndexOf(".");    // 인덱스를 찾아온다. 0 1        abc.jpg
		String ofheader = ofname.substring(0, idx); // 0이상 idx파일미만.    abc.jpg
		String ext = ofname.substring(idx);
		//long ms = System.currentTimeMillis();    //1970.1.1 0시부터 밀리세컨드단위 1000분의 1초로 현재시간까지 가져온다. 다른 파일과 겹치지않게 도와준다.
		StringBuilder sb = new StringBuilder(); // abc _ 123456.jpg
		sb.append(ofheader);
		//sb.append("_");
		//sb.append(ms);
		sb.append(ext);
		String saveFileName = sb.toString();    // String result = "abc_123456.jpg"
		
		long fsize = file.getSize();
		log.info("#ofname: " + ofname + ", saveFileName: "+ saveFileName +", fsize : "+ fsize);
		
		boolean flag = writeFile(file, saveFileName);
		if(flag) {
			log.info("#업로드 성공");
		}else {
			log.info("#업로드 실패");
		}
		return Path.FILE_STORE + saveFileName;
	}

	@Override
	public boolean writeFile(MultipartFile file, String saveFileName) {
		File rDir = new File(Path.FILE_STORE);
		if(!rDir.exists()) rDir.mkdirs();
		
		FileOutputStream fos = null;
		try {
		byte data[] = file.getBytes();
		fos = new FileOutputStream(Path.FILE_STORE+saveFileName);
		fos.write(data);
		fos.flush();
		
		return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {}
		}
		
	}
	
	//회원리스트
	@Override
	public List<Member> m_listS() {
		return memberMapper.list();
	}

}
