package cmd.service;

import java.util.List;
import java.util.Map;

import cmd.vo.CmdVO;

public interface CmdService {
	
	public String insertMember_join(Map<String, Object> pMap) throws Exception;
    public CmdVO getMemberInfo( Map<String, Object> pMap );

    public List<Object> get_carpool_list(Map<String, Object> pMap);
	
	public int insert_carpool(Map<String, Object> pMap);
	public int delete_carpool(Map<String, Object> pMap);
	public int update_carpool(Map<String, Object> pMap);

	public Object get_article(Map<String, Object> pMap);
	
	public void insert_channel(Map<String, Object> pMap) throws Exception;
	public String get_channel();
}


