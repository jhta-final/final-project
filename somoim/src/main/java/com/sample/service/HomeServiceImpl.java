package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.HomeDao;
import com.sample.dao.MoimDao;
import com.sample.dto.DetailViewMoimsDto;
import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimFavoriteMoim;

@Service
@Transactional
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao homeDao;
	@Autowired
	private MoimDao moimDao;

	// 전체 랜덤모임 조회
	@Override
	public List<MoimMainDto> getAllMoims() {
		return homeDao.randomMoims();
	}

	// 전체 회원 지역선호별 모임
	@Override
	public List<MoimMainDto> getlocationMoims(long locationNo) {
		if(locationNo == 0) {
			locationNo = (long)(Math.random()*25 +1);
		}
		return homeDao.locationMoims(locationNo);
		
	}

	// 좋아요순으로 모임 랜덤 표시
	@Override
	public List<MoimMainDto> getFavoliteMoims() {
		
		return homeDao.favoliteMoims();
	}

	// 메안카테고리 랜덤표시
	@Override
	public List<MoimMainDto> getMainCategoryMoims() {

		long mainCateNo = (long)(Math.random()*5 +1);

		return homeDao.mainCategoryMoims(mainCateNo);
	}

	// 가입한 모임 표시
	@Override
	public List<MoimMainDto> getjoinedMoim(String userId) {

		return homeDao.joinedMoim(userId);
	}

	@Override
	public List<MoimFollowDto> getfollowUsers(String userId) {
		
		return homeDao.followUsers(userId);
	}

	// 좋아요 기능 구현
	@Override
	public void increaseLikesMoim(long moimNo, String userId) {
		MoimMainDto savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		// 유저 즐겨찾기모임 추가
		MoimFavoriteMoim favoriteMoim = new MoimFavoriteMoim();
		favoriteMoim.setMoimNo(moimNo);
		favoriteMoim.setUserId(userId);
		
		MoimFavoriteMoim moimFavoriteMoim = homeDao.likesMoim(favoriteMoim);
		
		if(moimFavoriteMoim != null) {
			homeDao.deleteLikesMoim(moimFavoriteMoim);
		savedMoim.setLikes(savedMoim.getLikes() - 1);
		}else {
			homeDao.addLikesMoim(favoriteMoim);
			savedMoim.setLikes(savedMoim.getLikes() + 1);
			
		}
		moimDao.updateMoim(savedMoim);
	}

	@Override
	public List<MoimMainDto> getselectMoim(String userId) {
		
		return homeDao.selectMoim(userId);
	}

	@Override
	public List<DetailViewMoimsDto> detailViewMoims(long moimNo) {
		
		return homeDao.detailViewMoims(moimNo);
	}

}
