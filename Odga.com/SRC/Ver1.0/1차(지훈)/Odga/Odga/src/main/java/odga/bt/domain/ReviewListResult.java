package odga.bt.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewListResult {
//	private String b_writer;
//	private String b_subject;
//	private String b_content;
//	private Date b_rdate;
//	private String b_catgo;
//	private int b_like;
	private int commentCount;	//���丶�� ��� ����

	private List<Review> reviewResult;	//���丮��Ʈ
	private int reviewCount;			//���丮��Ʈ ����
	
	private int countByFamily;	//�������� ����
	private int countByAlone;	//ȥ�ڿ��� ����
	private int countByCouple;	//Ŀ�ÿ��� ����
	private int countByFriend;	//�������� ����
	private int countByPackage;	//��Ű������ ����
	
	private String latelyReview;	//�ֱٸ��� 4�� ����Ʈ
	

	
}
