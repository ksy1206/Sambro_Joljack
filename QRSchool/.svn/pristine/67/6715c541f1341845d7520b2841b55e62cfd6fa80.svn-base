package cmd.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
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
import cmd.vo.MemberVO;
import helper.util.FileUtil;


@Controller("cmdQR")
@RequestMapping("/cmdQR")
public class CmdController
{
    private final static Log logger = LogFactory.getLog(CmdController.class);
   
    @Resource(name = "cmdService")
	private CmdService cmdService;
    
    //시작 페이지 호출
    @RequestMapping("/loding.do")
    public String loding(){
    	return "main/lodingPage";
    }

    //메인 페이지 호출
    @RequestMapping("/main.do")
    public String main(){
    	return "main/main";
    }
    
    //로그인 페이지 호출
    @RequestMapping("/login.do")
    public String login(){      	    
    	return "main/login";    	
    }
    
    //버스 페이지 호출
    @RequestMapping("/bus.do")
    public String bus(){      	    
    	return "main/bus";    	
    }
    
    //교수 버스 페이지 호출
    @RequestMapping("/pro_bus.do")
    public String pro_bus(){      	    
    	return "professor/bus";
    }
    
    //로그인 check login_check
	@RequestMapping("/login_check.do")
    public ModelAndView user_login(HttpServletRequest req, HttpServletResponse res,@RequestParam Map<String, Object> map){
    	MemberVO memberVo = null;
    	memberVo = (MemberVO) cmdService.check_login(map);
    	Map<String, Object> rMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
    	
    	if(memberVo.getCheck() != "no"){
    		HttpSession session = req.getSession(true);    		
    		
    		rMap.put("memberInfo", memberVo);
    		session.setAttribute("sessionData", rMap);
    		session.setAttribute("member_no", memberVo.getMember_no());
    		session.setAttribute("member_id", memberVo.getMember_id());
    		session.setAttribute("class_code", memberVo.getClass_code());
    		mav.addObject("member_no", memberVo.getMember_no());
    		mav.addObject("member_id", memberVo.getMember_id());
    		mav.addObject("class_code", memberVo.getClass_code());
    		
			if(map.get("phone_code") != null || map.get("phone_code") != "" || map.get("phone_code") != "undefined"){
				cmdService.savePhone_code(map);
			}
			mav.addObject("check_grade", memberVo.getCheck_grade());
    	}    	
    	
		mav.setViewName("jsonView");
		mav.addObject("check", memberVo.getCheck());
    	
    	return mav;
    }
	
	// 자동 로그인 
	@RequestMapping("/Auto_login.do")
	public ModelAndView Auto_login(@RequestParam Map<String, Object> pMap){
		Map<String, Object> auto_check = new HashMap<>();
		auto_check = (Map<String, Object>) cmdService.auto_login_check(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("auto_check", auto_check);
		return mav;
	}
	
	//출석체크 리스트 화면
	@RequestMapping("/attend.do")
	public ModelAndView attend(@RequestParam Map<String, Object> pMap){
		
		ModelAndView mav = new ModelAndView("main/attend");
		mav.addObject("class_code", pMap.get("class_code"));
		return mav;
	}
	
	//출결 count 
	@RequestMapping("/attend_count.do")
	public ModelAndView attend_count(@RequestParam Map<String, Object> pMap){
		Map<String, Object> count = (Map<String, Object>) cmdService.attend_count(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("count", count);
		return mav;
	}
	
	//수업 count 
	@RequestMapping("/attend_class_count.do")
	public ModelAndView attend_class_count(@RequestParam Map<String, Object> pMap){
		Map<String, Object> count = (Map<String, Object>) cmdService.attend_class_count(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("count", count);
		return mav;
	}
	
	//출석체크 리스트 불러오기
	@RequestMapping("/attend_list.do")
	public ModelAndView attend_list(@RequestParam Map<String, Object> pMap){
		List<Object> list = cmdService.attend_list(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	
	//출석체크 입력 
	@RequestMapping("/save_attend.do")
	public ModelAndView save_attend(@RequestParam Map<String, Object> pMap){
		cmdService.add_attend(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("attend_data", pMap.get("attend"));
		return mav;
	}
	
	//이의신정 하기 
	@RequestMapping("/question_add.do")
	public ModelAndView question_add(@RequestParam Map<String, Object> pMap){
		cmdService.insert_question(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	//교수 메인 이동
    @RequestMapping("/pro_main.do")
    public ModelAndView pro_main(@RequestParam Map<String, Object> pMap){
    	
    	ModelAndView mav = new ModelAndView("professor/pro_main");
    	return mav;
    }
    
    //이의 신청 사유 불러오기 
    @RequestMapping("/select_attend_reason.do")
    public ModelAndView select_attend_reason(@RequestParam Map<String, Object> pMap){
    	String reason = null;
    	
    	reason = cmdService.select_attend_reason(pMap);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("jsonView");
    	mav.addObject("reason", reason);
    	return mav;
    }
    
    //이의 신청 업데이트  
    @RequestMapping("/attend_reason_update.do")
    public ModelAndView attend_reason_update(@RequestParam Map<String, Object> pMap){
    	
    	cmdService.attend_reason_update(pMap);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    //로그아웃 
    @RequestMapping("/logOut.do")
	public void move_logout(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView output = new ModelAndView();

		try {
			HttpSession session = req.getSession(true);
			Map<String, Object> sessionData = (Map<String, Object>) session.getAttribute("sessionData");
			Map<String, Object> pMap = new HashMap<>();
			String member_no = (String) session.getAttribute("member_no");
			pMap.put("member_no", member_no);
			cmdService.deletePhoneKey(pMap);
			
			if (sessionData != null) {
				session.removeAttribute("sessionData");
				session.removeAttribute("member_no");
				session.removeAttribute("member_id");
				session.invalidate();
				session = req.getSession(true);		
			}

			String cp = req.getContextPath();
			res.sendRedirect(cp + "/cmdQR/login.do");
		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		// return output;
	}
}
