package cmd.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmd.service.CmdService;
import cmd.vo.CmdVO;



@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController
{
    private final static Log logger = LogFactory.getLog(CmdController.class);
   
	@Resource(name = "cmdService")
	private CmdService cmdService;
	
	//메인페이지 호출
    @RequestMapping("/main.do")
    public String main(){      	    
    	return "main/main";
    	
    }
    
    //회원가입페이지 호출
    @RequestMapping("/join.do")
    public String join(){      	    
    	return "main/join";
    }

    @RequestMapping("webSocket.do")
    public String testView(){
        return "main/test";
    }
	//도움받기 화면
	@RequestMapping(value="/walk_user.do")
	public String walk_user(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
		return "main/walk_user";

	}
	//도움주기 화면
	@RequestMapping(value="/car_user.do")
	public ModelAndView board(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {

		List<Object> list = null;
		

		//반경 계산
		double getRadius = Double.parseDouble("10000");
		list = cmdService.get_carpool_list(pMap);
		Iterator<Object> it = list.iterator();
		List<CmdVO> rList = new ArrayList<CmdVO>();
		CmdVO cvo = new CmdVO();
		while (it.hasNext()) {
			cvo = (CmdVO) it.next();
			
			double resultDis = calDistance(pMap.get("latitude").toString(), pMap.get("longitude").toString(), cvo.getLatitude(), cvo.getLongitude());
			
			if (resultDis < getRadius) {
				String distance = Double.toString(Math.round((resultDis/1000)*100d) / 100d);
				cvo.setDistance(distance + " Km");
				rList.add(cvo);
			}
		}
		Collections.sort(rList, new Comparator<CmdVO>() {
			
	        @Override
	        public int compare(CmdVO  ojb1, CmdVO  ojb2) {

	            return  ojb1.getDistance().compareTo(ojb2.getDistance());
	        }
	        
	    });
		

		
		ModelAndView mav = new ModelAndView("main/car_user");
		mav.addObject("carpool_list", rList);
		mav.addObject("select_list", rList);
		mav.addObject("dataCnt", list.size());
		
		return mav;

	}


    
    
 // 회원가입
 	@RequestMapping(value = "/insertMember_join.do")
 	public ModelAndView insertMember_join(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		String member_join_chk = null;
 		
 		try {
 			
 			member_join_chk = this.cmdService.insertMember_join(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}

 		rMap.put("member_join_chk", member_join_chk);
 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
    
	// 로그인
	@RequestMapping(value = "/doMember_login.do")
	public ModelAndView doMember_login(HttpServletRequest req, HttpServletResponse res,
			@RequestParam Map<String, Object> pMap) throws Exception {

		ModelAndView output = new ModelAndView();
		Map<String, Object> rMap = new HashMap<String, Object>();
		int resultCode = 0;
		String resultMsg = "";
		try {
		
			CmdVO vo = this.cmdService.getMemberInfo(pMap);
		
			if (vo == null) {
				
				resultMsg = "ID 또는 비밀번호가 틀렸습니다.";
				resultCode = 0;
			} else{
			
				resultMsg = "로그인";
				resultCode = 1;
				HttpSession session = req.getSession(true);
				
				String member_id = vo.getMember_id();
				String car_yn = vo.getCar_yn();
				
			
				rMap.put("member_id", member_id);
				rMap.put("car_yn", car_yn);
				rMap.put("hp", vo.getHp());
				rMap.put("member_no", vo.getMember_no());
				
				session.setAttribute("sessionData", rMap);
				
				session.setAttribute("member_id", member_id);
				session.setAttribute("car_yn", car_yn);
			}
	
			rMap.put("resultCode", resultCode);
			rMap.put("resultMsg", resultMsg);

		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		output.addAllObjects(rMap);
		output.setViewName("jsonView");

		return output;

	}
	
	
	 // 도움받기등록
 	@RequestMapping(value = "/insert_carpool.do")
 	public ModelAndView insert_carpool(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		int result = 0;
 		
 		try {
 			
 			result = this.cmdService.insert_carpool(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}

 		rMap.put("result", result);
 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
 	
 	
 	//상세보기
 		@RequestMapping(value="/get_article.do")
 		public ModelAndView get_article(HttpServletRequest req, HttpServletResponse res,
 	 			@RequestParam Map<String, Object> pMap){
 			ModelAndView mav = new ModelAndView("main/article");
 			List<Object> list = null;
 			CmdVO vo = null;
 			vo = (CmdVO)cmdService.get_article(pMap);
 			mav.addObject("article", vo);
 			

 			return mav;
 			
 			
 		}
 		
 		
 		
 		//내 위치 거리 구하기
 		public double calDistance(String strLat1, String strLon1, String strLat2, String strLon2){  
 			
 			double lat1 = Double.parseDouble(strLat1);
 			double lon1 = Double.parseDouble(strLon1);
 			double lat2 = Double.parseDouble(strLat2);
 			double lon2 = Double.parseDouble(strLon2);
 		    
 		    double theta, dist;  
 		    theta = lon1 - lon2;  
 		    dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))   
 		          * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));  
 		    dist = Math.acos(dist);  
 		    dist = rad2deg(dist);  
 		      
 		    dist = dist * 60 * 1.1515;   
 		    dist = dist * 1.609344;    // 단위 mile 에서 km 변환.  
 		    dist = dist * 1000.0;      // 단위  km 에서 m 로 변환  
 		  
 		    return dist;  
 		    
 		}  
 		  
 		    // 주어진 도(degree) 값을 라디언으로 변환  
 		private double deg2rad(double deg){  
 		    return (double)(deg * Math.PI / (double)180d);  
 		}  
 		  
 		    // 주어진 라디언(radian) 값을 도(degree) 값으로 변환  
 		private double rad2deg(double rad){  
 		    return (double)(rad * (double)180d / Math.PI);  
 		} 
 		
 		
 	

}

