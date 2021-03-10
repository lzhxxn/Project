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
	private int commentCount;	//¸®ºä¸¶´Ù ´ñ±Û °¹¼ö

	private List<Review> reviewResult;	//¸®ºä¸®½ºÆ®
	private int reviewCount;			//¸®ºä¸®½ºÆ® °¹¼ö
	
	private int countByFamily;	//°¡Á·¿©Çà °¹¼ö
	private int countByAlone;	//È¥ÀÚ¿©Çà °¹¼ö
	private int countByCouple;	//Ä¿ÇÃ¿©Çà °¹¼ö
	private int countByFriend;	//¿ìÁ¤¿©Çà °¹¼ö
	private int countByPackage;	//ÆÐÅ°Áö¿©Çà °¹¼ö
	
	private String latelyReview;	//ÃÖ±Ù¸®ºä 4°³ ¸®½ºÆ®
	

	
}
