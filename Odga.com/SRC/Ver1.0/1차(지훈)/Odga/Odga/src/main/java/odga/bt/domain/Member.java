package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String m_id;
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_phone;
	private String m_gender;
	private Date m_birth;
	private Date m_rdate;
	private String m_fname;
	private String m_ofname;
	private long m_verify;
	private String m_about;
	
	//이메일 인증키
	private String Authkey;
	
	
}