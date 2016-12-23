package sambro.service;

import java.util.Map;

import sambro.vo.MemberVO;

public interface MemberService {
	
	public Object login_check(Map<String, Object> map);
	
	public Object member_id_check(Map<String, Object> map);
	
	public void insert_member(MemberVO memberVo);
	
	

}
