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
