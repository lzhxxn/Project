package odga.bt.mapper;

import java.util.List;

import odga.bt.domain.Touritems;
import odga.bt.domain.TouritemsVo;


public interface TouritemsMapper {
	List<Touritems> selectPerPage(TouritemsVo touritemsVo);
	List<Touritems> selectByCatgo(TouritemsVo touritemsVo);
	
	long selectCount();
	long selectCountByCatgo(TouritemsVo touritemsVo);  
	
	Touritems selectByTitle(String title);

}
