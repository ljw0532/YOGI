package yogi.lendplace;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("lendplaceDAO")
public class LendplaceDAO extends AbstractDAO{

//	장소목록 조회 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("lendplace.selectLendplaceList",map);
	}
	
//	장소상세페이지 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("lendplace.selectLendplaceDetail",map);
	}
	
//	날짜 중복체크
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dateCheck(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("lendplace.dateCheck",map);
	}

//	장소 내용 수정 
	public void updateLendplace(Map<String, Object> map) throws Exception{
		update("lendplace.updateLendplace",map);
	}
	
//  장소 신청
	public void insertPlacebook(Map<String, Object> map) throws Exception{
		insert("lendplace.insertPlacebook",map);
	}

//  장소 예약현황 증가
	public void upCountUdate(Map<String, Object> map) throws Exception{
		update("lendplace.upCountUdate",map);
	}
	
//	장소후기 확인
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> checkReview(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("lendplace.checkReview",map);
	}
	
//	장소후기 입력 
	public void insertReview(Map<String, Object> map) throws Exception{
		insert("lendplace.insertReview",map);
		update("lendplace.RATE",map);
	}
//	장소후기 삭제
	public void deleteReview(Map<String, Object> map) throws Exception{
		delete("lendplace.deleteReview",map);
		update("lendplace.RATE", map);
	}
	public void deleteGroupReview(Map<String, Object> map) throws Exception{
		delete("lendplace.deleteGroupReview",map);
	}
	
//  장소후기 수정
	public void updateReview(Map<String, Object> map) throws Exception{
		update("lendplace.updateReview",map);
	}

//	장소후기 출력
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("lendplace.selectReview",map);
	}

	public void updateReviewOrder(Map<String, Object> map) throws Exception{
		update("lendplace.updateReviewOrder",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReviewChild(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("lendplace.selectReviewChild",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDeletedParent(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("lendplace.selectDeletedParent",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectParent(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("lendplace.selectParent",map);
	}
	
	public void updateDeleteFlag(Map<String, Object> map) throws Exception{
		update("lendplace.updateDeleteFlag",map);
	}

	public void updateplusGrade(Map<String, Object> map) throws Exception{
		update("lendplace.plusGrade",map);
	}
	
	public void updateminusGrade(Map<String, Object> map) throws Exception{
		update("lendplace.minusGrade",map);
	}
}
