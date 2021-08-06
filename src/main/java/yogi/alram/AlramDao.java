package yogi.alram;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import yogi.common.dao.AbstractDAO;

@Repository("alramDao")
public class AlramDao extends AbstractDAO{
		
	public void regAlram(int writer_id, String reg_id, int alram_index_no, int alram_contnum){
		Map map = new HashMap();
	/*	
		List<Map<String,Object>> alramCheck = (List<Map<String,Object>>) AlramCheck(alram_index_no, alram_contnum, writer_id);
		
		if(alramCheck.size() != 0){
			for (int i = 0; i < alramCheck.size(); i++) {
				System.out.println(alramCheck.get(i));
			}
			System.out.println("AlramDao:alramCheck"+alramCheck);
			String dual_id = alramCheck.get(0).get("REG_ID").toString();
			
			String regex = ",";
			Pattern pattern = Pattern.compile(regex);
			int cnt = 0;

			Matcher matcher = pattern.matcher(dual_id);
			
			while(matcher.find()){
				cnt++;
			}
			cnt = cnt+1;
			System.out.println("cnt"+cnt);
			if(cnt == 1){
				dual_id = dual_id+","+reg_id;
			}else if(cnt == 2){
				dual_id = dual_id+","+reg_id + "...";
			}
			alramCheck.get(0).put("REG_ID",dual_id);
			System.out.println("AlramDao:alramCheck"+alramCheck.get(0));
			update("alram.updateRegIdAlram", alramCheck.get(0));
			
		}else{*/	
			map.put("alram_index_no", alram_index_no);
			map.put("alram_contnum", alram_contnum);
			map.put("alram_id", writer_id);
			map.put("reg_id", reg_id);
			
			insert("alram.regAlram", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> AlramCheck(int alram_index_no, int alram_contnum, int alram_id){	
		Map map = new HashMap();
		map.put("alram_index_no", alram_index_no);
		map.put("alram_contnum", alram_contnum);
		map.put("alram_id", alram_id);
		
		return (List<Map<String,Object>>) selectList("alram.alramCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public int alramExist(int id){
		List<Map<String, Object>> alramExist = (List<Map<String,Object>>) selectList("alram.alramLoad", id);
		
		return alramExist.size();
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> alramLoad(int id){
		return (List<Map<String, Object>>) selectList("alram.alramLoad", id);
	}
	
	public void readAlram(Map<String, Object>map){
		update("alram.readAlram", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAlramOne(Map<String, Object>map){
		return (Map<String, Object>) selectOne("alram.selectAlramOne", map);
	}
}
