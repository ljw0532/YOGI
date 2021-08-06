package yogi.mypage;

import java.util.List;
import java.util.Map;

import yogi.members.MembersModel;

public interface MypageService {

	public List<Map<String, Object>> selectWriteHistory(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectMeetHistory(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectZzimHistory(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectPlacebookHistory(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectOneMember(Object object) throws Exception;

	public List<Map<String, Object>> selectReportHistory(Map<String, Object> map) throws Exception;


	
}
