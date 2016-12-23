package cmd.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cmd.service.NoticeService;
import helper.dao.CommonDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name="commonDao")
	private CommonDAO commonDao;

	@Override
	public List<Object> noticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("notice.select_notice_list", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Object> push_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("notice.push_list", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insert_notice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		try {
			this.commonDao.insertData("notice.insert_notice", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Object select_notice_no(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<>();
		
		try {
			rMap = (Map<String, Object>) this.commonDao.getReadData("notice.select_notice_no", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}
}
