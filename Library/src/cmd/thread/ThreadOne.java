package cmd.thread;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import cmd.service.CmdService;
import cmd.vo.SitVO;

public class ThreadOne extends Thread{
	
	@Resource(name = "cmdService")
	private CmdService cmdService;
	
	private String re_sit_id;

	public ThreadOne(String sit_id) {
		// TODO Auto-generated constructor stub
		re_sit_id = sit_id;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			System.out.println("스레드 시작");
			Thread.sleep(5000);
			System.out.println("슬립 종료");
			
			test();
			

		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void test(){

		Map<String, Object> map = new HashMap<>();
		map.put("sit_id", re_sit_id);
		
		SitVO sitVo = null;
		sitVo = (SitVO) cmdService.select_sit_id(map);
		
		if(sitVo.getUse_yn().equals("ing")){
			cmdService.delete_sit(map);
		}
		
		System.out.println("스레드 종료");
	}
	
}
