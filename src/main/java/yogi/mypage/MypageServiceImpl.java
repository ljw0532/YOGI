package yogi.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import yogi.members.MembersModel;
import yogi.mypage.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mypageDAO")
	private MypageDAO mypageDAO;

	@Override
	public List<Map<String, Object>> selectWriteHistory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectWriteHistory(map);
	}

	@Override
	public List<Map<String, Object>> selectMeetHistory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectMeetHistory(map);	}

	@Override
	public List<Map<String, Object>> selectZzimHistory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectZzimHistory(map);	}

	@Override
	public List<Map<String, Object>> selectPlacebookHistory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectPlacebookHistory(map);	
		}

	@Override
	public Map<String, Object> selectOneMember(Object object) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectOneMember(object);
	}
	
	@Override
	public List<Map<String, Object>> selectReportHistory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectReportHistory(map);	
	}

	



	
}
