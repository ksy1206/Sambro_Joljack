package cmd.service;

import java.util.List;
import java.util.Map;

import cmd.vo.CmdVO;

public interface CmdService {
	
	//회원 가입
	public void insert_member(Map<String, Object> map);
	
	//아이디 중복 체크
	public Object member_id_check(Map<String, Object> map);
	
	//로그인 체크
	public Object login_check(Map<String, Object> map);
	
    //자리 체크
	public List<Object> sit_check(Map<String, Object> map);
	
	//sit_id로  Use_yn 체크하기
	public Object select_sit_id(Map<String, Object> map);
	
	//sit_id 로 자리 예약하기
	public void update_sit(Map<String, Object> map);
	
	//sit_id 로 자리 반납하기
	public void delete_sit(Map<String, Object> map);
	
	//sit_id 로 자리 사용하기
	public void insert_sit(Map<String, Object> map);
	
	//책 리스트 불러오기 
	public List<Object> book_list(Map<String, Object> map);
	
	//board_no 로 자리 반납하기
	public void book_return(Map<String, Object> map);
	
	//board_no 로 도서 대여하기
	public void book_rental(Map<String, Object> map);
}


