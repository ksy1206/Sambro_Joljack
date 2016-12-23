package cmd.serviceImpl;

import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import cmd.service.CmdService;
import cmd.vo.CmdVO;
import cmd.vo.MemberVO;
import helper.dao.CommonDAO;
import net.sf.json.JSONObject;




@Service("cmdService")
public class CmdServiceImpl implements CmdService
{
	private final static Log logger = LogFactory.getLog(CmdServiceImpl.class);
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;

	//회원가입
	@Override
	public void insert_member(MemberVO memberVo) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.insertData("cmd.insert_member", memberVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//이메일 중복 체크
	@Override
	public Object member_id_check(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVo = null;
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("cmd.member_id_check", map);
			
			if(memberVo == null){
				rMap.put("member_id_check", "yes");
			} else {
				rMap.put("member_id_check", "no");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}

	//로그인 체크
	@Override
	public Object login_check(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVO = null;
		
		try {
			memberVO = (MemberVO) this.commonDao.getReadData("cmd.login_check", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVO;
	}

	//데이터 저장
	@Override
	public void save_data(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.insertData("cmd.insert_date", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//데이터 리스트 불러오기
	@Override
	public List<Object> select_list(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.select_list", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	//랭킹 리스트 불러오기
	@Override
	public List<Object> getLanking(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.getLanking", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


	
	
	
	
	


}//end class

