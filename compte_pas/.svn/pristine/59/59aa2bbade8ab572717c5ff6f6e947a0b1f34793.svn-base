package cmd.service;

import java.util.List;
import java.util.Map;

import cmd.vo.CmdVO;
import cmd.vo.MemberVO;

public interface CmdService {
	
	//회원가입
	public void insert_member(MemberVO memberVo);
    //이메일 중복 체크
	public Object member_id_check(Map<String, Object> map);
	//로그인 체크
	public Object login_check(Map<String, Object> map);
	//데이터 저장
	public void save_data(Map<String, Object> map);
	//데이터 리스트 불러오기 
	public List<Object> select_list(Map<String, Object> pMap);
	//랭킹 리스트 불러오기 
	public List<Object> getLanking(Map<String, Object> pMap);
	
}


