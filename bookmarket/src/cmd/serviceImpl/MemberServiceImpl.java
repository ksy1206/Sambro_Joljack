package cmd.serviceImpl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cmd.service.MemberService;
import cmd.vo.MemberVO;
import helper.dao.CommonDAO;

@Service("member.MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;

	@Override
	public void insert_member(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.insertData("member.insert_member", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public Object check_login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVo = new MemberVO();
		MemberVO memberVo2 = new MemberVO();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("member.login_check", map);
			System.out.println("memberVo="+memberVo);
			
			if(memberVo == null){
				memberVo2.setCheck("no");
				memberVo = memberVo2;
			} else {				
				memberVo.setCheck("yes");
				
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVo;
	}

	@Override
	public Object find_id(Map<String, Object> map) {
		// TODO Auto-generated method stub		
		MemberVO memberVo = new MemberVO();
		MemberVO memberVo2 = new MemberVO();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("member.find_id", map);
			System.out.println("memberVo="+memberVo);
			
			if(memberVo == null){
				memberVo2.setCheck("no");
				memberVo = memberVo2;
			} else {				
				memberVo.setCheck("yes");
				
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVo;
	}

	@Override
	public Object find_pwd(Map<String, Object> map) {
		// TODO Auto-generated method stub		
		MemberVO memberVo = new MemberVO();
		MemberVO memberVo2 = new MemberVO();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("member.find_pwd", map);
			System.out.println("memberVo="+memberVo);
			
			if(memberVo == null){
				memberVo2.setCheck("no");
				memberVo = memberVo2;
			} else {				
				memberVo.setCheck("yes");
				
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVo;
	}

}
