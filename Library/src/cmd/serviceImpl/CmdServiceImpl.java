package cmd.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import cmd.service.CmdService;
import cmd.vo.MemberVO;
import cmd.vo.SitVO;
import helper.dao.CommonDAO;




@Service("cmdService")
public class CmdServiceImpl implements CmdService
{
	private final static Log logger = LogFactory.getLog(CmdServiceImpl.class);
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;

	@Override
	public void insert_member(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.insertData("cmd.insert_member", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

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

	@Override
	public List<Object> sit_check(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.select_sit_check", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Object select_sit_id(Map<String, Object> map) {
		// TODO Auto-generated method stub
		SitVO sitVo = null;
		
		try {
			sitVo = (SitVO) this.commonDao.getReadData("cmd.select_sit_id", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sitVo;
	}
	
	@Override
	public void update_sit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		String currentDate = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss").format(new java.util.Date());
		map.put("insertDate", currentDate);
		try {
			this.commonDao.updateData("cmd.update_sit", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete_sit(Map<String, Object> map) {
		// TODO Auto-generated method stub		
		try {
			this.commonDao.updateData("cmd.delete_sit", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Object> book_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.select_book_list", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void book_return(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.updateData("cmd.book_return", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void book_rental(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.updateData("cmd.book_rental", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void insert_sit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String currentDate = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss").format(new java.util.Date());
		map.put("insertDate", currentDate);
		try {
			this.commonDao.updateData("cmd.insert_sit", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}//end class

