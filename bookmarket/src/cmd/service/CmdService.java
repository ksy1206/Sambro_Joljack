package cmd.service;

import java.util.List;
import java.util.Map;

import cmd.vo.CmdVO;

public interface CmdService {
	
	 public List<Object> get_category_sub_list(Map<String, Object> pMap);
	 public int insert_product(Map<String, Object> pMap);
	 public Map<String, Object> get_univ_book(Map<String, Object> pMap); 
	 public Map<String, Object> get_study_supply(Map<String, Object> pMap); 
	 public int insert_choise(Map<String, Object> pMap);
	 public int insert_pocket(Map<String, Object> pMap);
	 public int delete_product(Map<String, Object> pMap);
	 public List<Object> getMainList(Map<String, Object> pMap);
	 public int send_msg(Map<String, Object> pMap);
	 public List<Object> getMsgList(Map<String, Object> pMap);
	 public List<Object> get_msg_list(Map<String, Object> pMap);
		
}


