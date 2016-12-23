package cmd.serviceImpl;

import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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

	@Override
	public Object check_login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVo = new MemberVO();
		MemberVO memberVo2 = new MemberVO();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("cmd.login_check", map);
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
	public void savePhone_code(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.updateData("cmd.update_phone_code", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object auto_login_check(Map<String, Object> map) {
		// TODO Auto-generated method stub
		MemberVO memberVo = null;
		Map<String, Object> result = new HashMap<>();
		
		try {
			memberVo = (MemberVO) this.commonDao.getReadData("cmd.auto_login_check", map);
			
			if(memberVo == null){
				result.put("login_check", "false");
			} else {

				result.put("login_check", memberVo.getLogin_check());
				result.put("check_grade", memberVo.getCheck_grade());
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void add_attend(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		try {
			String currentDate = new SimpleDateFormat("yy.MM.dd").format(new java.util.Date());
			map.put("insertDate", currentDate);
			
			this.commonDao.insertData("cmd.insert_attend", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Object> attend_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.select_attend_list", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insert_question(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.updateData("cmd.add_question", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String select_attend_reason(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String reason = null;
		
		try {
			reason = (String) this.commonDao.getReadData("cmd.select_attend_reason", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return reason;
	}

	@Override
	public void attend_reason_update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.updateData("cmd.attend_reason_update", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Object attend_count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<>();
		
		try {
			rMap = (Map<String, Object>) this.commonDao.getReadData("cmd.attend_count", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}
	
	@Override
	public Object attend_class_count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<>();
		
		try {
			rMap = (Map<String, Object>) this.commonDao.getReadData("cmd.attend_class_count", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}

	@Override
	public void deletePhoneKey(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		try {
			this.commonDao.deleteData("cmd.delete_phoneKey", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}//end class

