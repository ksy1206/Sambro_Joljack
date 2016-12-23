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
import helper.dao.CommonDAO;
import net.sf.json.JSONObject;





@Service("cmdService")
public class CmdServiceImpl implements CmdService
{
	private final static Log logger = LogFactory.getLog(CmdServiceImpl.class);
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;


	@Override
	public List<Object> get_category_sub_list(Map<String, Object> pMap) {
		List<Object> rList = null;
    	
    	try {
			
    		rList = this.commonDao.getListData("cmd.get_category_sub_list", pMap);
		
		} catch (Exception e) {
			logger.debug(e.toString());
		}
    	
    	return rList;	
	}
	
	@Override
	public int insert_product(Map<String, Object> pMap) {
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.insert_product",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public Map<String, Object> get_univ_book(Map<String, Object> pMap) {
		
		Map<String, Object> rMap = null;
		
		try {
			rMap = this.commonDao.getPagingListData("cmd.univ_book_listCount", "cmd.get_univ_book", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}
	
	@Override
	public Map<String, Object> get_study_supply(Map<String, Object> pMap) {
		Map<String, Object> rMap = null;
		
		try {
			rMap = this.commonDao.getPagingListData("cmd.study_supply_listCount", "cmd.get_study_supply", pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}
	
	@Override
	public int insert_choise(Map<String, Object> pMap) {
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.insert_choise",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int insert_pocket(Map<String, Object> pMap) {
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.insert_pocket",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int delete_product(Map<String, Object> pMap) {
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.delete_product",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public List<Object> getMainList(Map<String, Object> pMap) {
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.getMainList", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	@Override
	public int send_msg(Map<String, Object> pMap) {
		int result = 0;
		
		try {
			result = this.commonDao.insertData("cmd.send_msg",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public List<Object> getMsgList(Map<String, Object> pMap) {
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.getMsgList", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Object> get_msg_list(Map<String, Object> pMap) {
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.get_msg_list", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}//end class

