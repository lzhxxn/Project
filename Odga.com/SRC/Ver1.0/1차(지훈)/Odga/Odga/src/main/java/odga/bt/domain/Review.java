package odga.bt.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private long b_id;			//�� id(SEQ)
	private String b_writer;	//�ۼ���
	private String b_subject; 	//�� ����
	private String b_content; 	//�� ����
	private String b_img;		//�����̹���
	private Date b_rdate; 		//�ۼ���
	private String b_catgo;		//ī�װ�
	private int b_like; 		//���ƿ��
	private int m_id; 			//ȸ��id
}
