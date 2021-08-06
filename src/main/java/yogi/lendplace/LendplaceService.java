package yogi.lendplace;

import java.util.List;
import java.util.Map;

import yogi.config.CommandMap;


public interface LendplaceService {

	List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> checkReview(Map<String, Object> map) throws Exception;

	Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> dateCheck(Map<String, Object> map) throws Exception;
	
	void insertPlacebook(Map<String, Object> map) throws Exception;
	
	void upCountUdate(Map<String, Object> map) throws Exception;

	void updateLendplace(Map<String, Object> map) throws Exception;
	
	void insertReview(Map<String, Object> map) throws Exception;

	void updateReview(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception;

	void deleteReview(Map<String, Object> map) throws Exception;
	
	void deleteGroupReview(Map<String, Object> map) throws Exception;
	
	void updateReviewOrder(Map<String, Object> map) throws Exception;

	Map<String, Object> selectReviewChild(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectDeletedParent(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectParent(Map<String, Object> map) throws Exception;
	
	void updateDeleteFlag(Map<String, Object> map) throws Exception;
	
	void updateplusGrade (Map<String, Object> map) throws Exception;
	
	void updateminusGrade (Map<String, Object> map) throws Exception;
}