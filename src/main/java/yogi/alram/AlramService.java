package yogi.alram;

import java.util.List;
import java.util.Map;

public interface AlramService {
	
	int alramExist(int id) throws Exception;
	
	List<Map<String, Object>> alramLoad(int id) throws Exception;
	
	void readAlram(Map<String, Object>map) throws Exception;
	
	Map<String,Object> selectAlramOne(Map<String, Object>map) throws Exception;

	void regAlram(int writer_id, String reg_id, int alram_index_no, int alram_contnum) throws Exception;
}
