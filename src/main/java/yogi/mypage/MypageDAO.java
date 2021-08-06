package yogi.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;
import yogi.members.MembersModel;

@Repository("mypageDAO")
public class MypageDAO extends AbstractDAO{

	public List<Map<String, Object>> selectWriteHistory(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.writeHistory", map);
	}

	public List<Map<String, Object>> selectMeetHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("mypage.meetHistory", map);	}

	public List<Map<String, Object>> selectZzimHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("mypage.zzimHistory", map);	}

	public List<Map<String, Object>> selectPlacebookHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("mypage.placebookHistory", map);	}
	
	public Map<String, Object> selectOneMember(Object object) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("mypage.selectOneMember", object);
		}

	public List<Map<String, Object>> selectReportHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("mypage.reportHistory", map);
	}

	
}

