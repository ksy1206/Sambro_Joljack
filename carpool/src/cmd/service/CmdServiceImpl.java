package cmd.service;

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

import cmd.vo.CmdVO;
import helper.dao.CommonDAO;
import net.sf.json.JSONObject;




@Service("cmdService")
public class CmdServiceImpl implements CmdService
{
	private final static Log logger = LogFactory.getLog(CmdServiceImpl.class);
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;


	@Override
	public String insertMember_join(Map<String, Object> pMap) throws Exception {
	
	    int chk = 0; 
	    String member_chk = "";
		try {
			
			//회원등록
			chk =  this.commonDao.insertData("cmd.insertMember_join", pMap);
			
			
		} catch (Exception e) {
			
			logger.debug(e.toString());
			throw e;
		}
		
		if(chk==0){
			member_chk = "0";
		}else{
			member_chk = "1";
		}

		return member_chk;
	
	}
	
	@Override
    public CmdVO getMemberInfo( Map<String, Object> pMap ) {
		CmdVO vo = null;
    	
        try {
			vo = (CmdVO)this.commonDao.getReadData("cmd.getMemberInfo", pMap);
		} catch (Exception e) {
			logger.debug(e.toString());
		}
        
        return vo;
    }



	@Override
	public List<Object> get_carpool_list(Map<String, Object> pMap) {
		
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.get_carpool_list", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insert_carpool(Map<String, Object> pMap) {
		
		int result = 0;
		
		try {
			this.commonDao.deleteData("cmd.delete_carpool_all",pMap);
			result = this.commonDao.insertData("cmd.insert_carpool",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int delete_carpool(Map<String, Object> pMap) {
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.delete_carpool",pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int update_carpool(Map<String, Object> pMap) {
		
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.update_carpool",pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public Object get_article(Map<String, Object> pMap) {
	
		CmdVO vo = null;
		
		try {
			vo = (CmdVO) this.commonDao.getReadData("cmd.get_carpool_list", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	@Override
	public void insert_channel(Map<String, Object> pMap) throws Exception {
	
	    
		try {
			
			//채널 등록
			 this.commonDao.insertData("cmd.insert_channel", pMap);
			
			
		} catch (Exception e) {
			
			logger.debug(e.toString());
			throw e;
		}

	
	}
	
	@Override
	public String get_channel() {
	
		String channel_no = "";
		try {
			channel_no = (String) this.commonDao.getReadData("cmd.get_channel");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return channel_no;
	}


}//end class

