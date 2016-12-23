package cmd.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cmd.service.MyListService;
import helper.dao.CommonDAO;

@Service("myList.MyListService")
public class MyListServiceImpl implements MyListService{

	@Resource(name="commonDao")
	private CommonDAO commonDao;

	@Override
	public Map<String, Object> select_myroom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<String, Object>();
		String countQueryId = "myList.select_myroom_count"; // 전체 리스트 갯수 카운트
		String listQueryId = "myList.select_myroom"; // 가져올 리스트
		
		
		try {
			rMap = this.commonDao.getPagingListData(countQueryId, listQueryId, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}

	@Override
	public void delete_myroom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.deleteData("myList.delete_myroom", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public Map<String, Object> select_basket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> rMap = new HashMap<String, Object>();
		String countQueryId = "myList.select_basket_count"; // 전체 리스트 갯수 카운트
		String listQueryId = "myList.select_basket"; // 가져올 리스트
		
		
		try {
			rMap = this.commonDao.getPagingListData(countQueryId, listQueryId, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rMap;
	}

	@Override
	public void delete_basket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			this.commonDao.deleteData("myList.delete_basket", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
