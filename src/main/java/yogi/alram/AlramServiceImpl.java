package yogi.alram;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("alramService")
public class AlramServiceImpl implements AlramService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "alramDao")
	private AlramDao alramDao;

	@Override
	public void regAlram(int writer_id, String reg_id, int alram_index_no, int alram_contnum) throws Exception {
		alramDao.regAlram(writer_id, reg_id, alram_index_no, alram_contnum);
		
	}

	@Override
	public int alramExist(int id) throws Exception {
		return alramDao.alramExist(id);
	}

	@Override
	public List<Map<String, Object>> alramLoad(int id) throws Exception {
		return alramDao.alramLoad(id);
	}

	@Override
	public void readAlram(Map<String, Object> map) throws Exception {
		alramDao.readAlram(map);	
	}

	@Override
	public Map<String, Object> selectAlramOne(Map<String, Object> map) throws Exception {
		return alramDao.selectAlramOne(map);
	}
	
	
}
