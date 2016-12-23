package cmd.service;

import java.util.List;
import java.util.Map;

import cmd.vo.CmdVO;

public interface CmdService {
	
	public Object check_login(Map<String, Object> map);
	
	public void savePhone_code(Map<String, Object> map);	
	
	public Object auto_login_check(Map<String, Object> map);
	
	public void add_attend(Map<String, Object> map);
	
	public List<Object> attend_list(Map<String, Object> map);
	
	public void insert_question(Map<String, Object> map);
	
	public String select_attend_reason(Map<String, Object> map);
	
	public void attend_reason_update(Map<String, Object> map);	
	
	public Object attend_count(Map<String, Object> map);
	
	public Object attend_class_count(Map<String, Object> map);
	
	public void deletePhoneKey(Map<String, Object> map);
	
}


