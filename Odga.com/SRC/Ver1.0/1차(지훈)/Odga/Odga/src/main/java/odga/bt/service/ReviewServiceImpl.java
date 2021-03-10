package odga.bt.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import odga.bt.domain.Review;
import odga.bt.domain.Support;
import odga.bt.filesetting.Path;
import odga.bt.mapper.ReviewMapper;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<Review> reviewS() {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info("ReviewServiceImpl reviewS(): " + reviewMapper.review());
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return reviewMapper.review();
	}
	
	@Override
	public Review getReviewS(long b_id) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info("ReviewServiceImpl getReviewS(long b_id): " + reviewMapper.getReview(b_id));
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return reviewMapper.getReview(b_id);
	}
	
	@Override
	public List<Review> selectByWriterS(String b_writer){
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info("ReviewServiceImpl selectByWriterS(String b_writer): " + reviewMapper.selectByWriter(b_writer));
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		return reviewMapper.selectByWriter(b_writer);
	}

	@Override
	public void insertS(Review review) {
		reviewMapper.insert(review);
	}
	
	//문의하기
	@Override
	public void insertI(Support support) {
		reviewMapper.insertS(support);
	}
	
	@Override
	public int countByCatgoS(String b_catgo) {
		return reviewMapper.countByCatgo(b_catgo);
	}
	
	@Override
	public int countByFamilyS() {
		return reviewMapper.countByFamily();
	}
	
	@Override
	public String saveStore(MultipartFile file) {
		String ofname = file.getOriginalFilename();
		System.out.println("#ofname: " + ofname);
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String name = sb.toString();
		
		long fsize = file.getSize();
		log.info("#ofname: " + ofname + ", name: " + name + ", fsize: "+fsize);
		
		boolean flag = writeFile(file, name);
		if(flag) {
			log.info("#############################���ε� ����#############################");
		}else {
			log.info("#############################���ε� ����#############################");
		}
		return name;
	}

	@Override
	public boolean writeFile(MultipartFile file, String name) {
		File rDir = new File(Path.FILE_REVIEW);
		if(!rDir.exists()) rDir.mkdirs();
		
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(Path.FILE_REVIEW+name);
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

	@Override
	public List<Support> notificationsS() {
		return reviewMapper.notifications(); 
		
	}

	@Override
	public Support selectByTitle(String s_subject) {
		return reviewMapper.selectByTitle(s_subject);
	}

	@Override
	public List<Review> selectBestReviewS() {
		return reviewMapper.selectBestReview();
	}

	@Override
	public List<Review> selectByReviewS(long m_id) {
		return reviewMapper.selectByReview(m_id);
	}
}
