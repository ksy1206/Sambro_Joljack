package cmd.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cmd.service.CommunityService;
import helper.dao.CommonDAO;

@Service("community.CommunityService")
public class CommunityImpl implements CommunityService {
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;

	@Override
	public void insert_community(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		try {
			this.commonDao.insertData("community.insert_community", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> select_community(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<String, Object>();
		String countQueryId = "community.select_community_count"; // 전체 리스트 갯수 카운트
		String listQueryId = "community.select_community"; // 가져올 리스트
		
		
		try {
			rMap = this.commonDao.getPagingListData(countQueryId, listQueryId, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> select_community_details(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		try {
			rMap = (Map<String, Object>) this.commonDao.getReadData("community.select_details", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}

	@Override
	public void update_community(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.updateData("community.update_community", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete_community(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.deleteData("community.delete_community", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
