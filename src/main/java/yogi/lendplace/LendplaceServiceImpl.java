package yogi.lendplace;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("lendplaceService")
public class LendplaceServiceImpl implements LendplaceService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="lendplaceDAO")
	private LendplaceDAO lendplaceDAO;
	
	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		
		if(map.get("searchAddr") == null || StringUtils.isBlank(map.get("searchAddr").toString())){
			map.remove("searchAddr");
		}
		if(map.get("min_pay") == null || StringUtils.isBlank(map.get("min_pay").toString())){
			map.remove("min_pay");
		}
		if(map.get("max_pay") == null || StringUtils.isBlank(map.get("max_pay").toString())){
			map.remove("max_pay");
		}
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
		}
		if(map.get("l_sdate") == null || StringUtils.isBlank(map.get("l_sdate").toString())){
			map.remove("l_sdate");
		}
		if(map.get("l_edate") == null || StringUtils.isBlank(map.get("l_edate").toString())){
			map.remove("l_edate");
		}
		
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception {
		
		return lendplaceDAO.selectLendplaceDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> dateCheck(Map<String, Object> map) throws Exception {
		
		return lendplaceDAO.dateCheck(map);
	}

	@Override
	public void insertPlacebook(Map<String, Object> map) throws Exception {
		lendplaceDAO.insertPlacebook(map);
	}

	@Override
	public void upCountUdate(Map<String, Object> map) throws Exception {
		lendplaceDAO.upCountUdate(map);
	}

	@Override
	public void updateLendplace(Map<String, Object> map) throws Exception {
		lendplaceDAO.updateLendplace(map);
	}

	@Override
	public void insertReview(Map<String, Object> map) throws Exception {
		lendplaceDAO.insertReview(map);
	}
	
	@Override
	public void updateReview(Map<String, Object> map) throws Exception {
		lendplaceDAO.updateReview(map);
	}
	
	@Override
	public List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectReview(map);
	}
	
	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		lendplaceDAO.deleteReview(map);
		
	}

	@Override
	public void updateReviewOrder(Map<String, Object> map) throws Exception {
		lendplaceDAO.updateReviewOrder(map);
	}


	@Override
	public Map<String, Object> selectReviewChild(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectReviewChild(map);
	}

	@Override
	public void updateDeleteFlag(Map<String, Object> map) throws Exception {
		lendplaceDAO.updateDeleteFlag(map);
	}

	@Override
	public void deleteGroupReview(Map<String, Object> map) throws Exception {
		lendplaceDAO.deleteGroupReview(map);
	}

	@Override
	public Map<String, Object> selectDeletedParent(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectDeletedParent(map);
	}

	@Override
	public Map<String, Object> selectParent(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectParent(map);
	}

	@Override
	public List<Map<String, Object>> checkReview(Map<String, Object> map) throws Exception {
		return lendplaceDAO.checkReview(map);
	}
	
	public void updateplusGrade(Map<String, Object> map) throws Exception{
		lendplaceDAO.updateplusGrade(map);
	}
	
	public void updateminusGrade(Map<String, Object> map) throws Exception{
		lendplaceDAO.updateminusGrade(map);
	}
}
