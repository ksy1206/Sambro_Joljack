package cmd.controller;

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




@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController
{
    private final static Log logger = LogFactory.getLog(CmdController.class);
   
	@Resource(name = "cmdService")
	private CmdService cmdService;
    
	//로그인 페이지 호출
	@RequestMapping(value="/login.do")
	public ModelAndView login(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("main/login");
		return mav;
	}
	
	//회원가입 페이지 호출
	@RequestMapping(value="/move_join.do")
	public ModelAndView move_join(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("main/join");
		return mav;
	}
	
	//저장 페이지 호출
	@RequestMapping(value="/move_save.do")
	public ModelAndView move_save(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("main/save");
		return mav;
	}
	
	//메인페이지 호출
    @RequestMapping(value="/main.do")
    public ModelAndView main(){
    	ModelAndView mav = new ModelAndView("main/main");
    	return mav;	
    }
    
    //회원가입  insert_member
	@RequestMapping(value="/insert_member.do")
	public ModelAndView insert_member(MemberVO memberVo){
		System.out.println(memberVo.toString());
		cmdService.insert_member(memberVo);
		ModelAndView mav = new ModelAndView("main/login");
		return mav;
	}

	//회원가입 ID 중복 체크
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/member_id_check.do")
	public ModelAndView member_id_check(@RequestParam Map<String, Object> map){
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap = (Map<String, Object>) cmdService.member_id_check(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("check", rMap.get("member_id_check"));
		return mav;
	}
 	
	//로그인 check
	@RequestMapping(value="/login_check.do")
	public ModelAndView login_check(@RequestParam Map<String, Object> map, HttpServletRequest req, HttpServletResponse res){
		String check = null;
		MemberVO memberVo = null;
		Map<String, Object> rMap = new HashMap<String, Object>();
		memberVo = (MemberVO) cmdService.login_check(map);
		
		if(memberVo == null){
			check = "no";
		} else {
			check = "yes";
			rMap.put("memberInfo", memberVo);
			HttpSession session = req.getSession(true);
			session.setAttribute("sessionData", rMap);
			session.setAttribute("member_no", memberVo.getMember_no());
		}		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("check", check);
		return mav;
	}
	
	//DB 저장 
	@RequestMapping(value="/save_data.do")
	public ModelAndView save_data(@RequestParam Map<String, Object> map){
		cmdService.save_data(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	//데이터 리스트 불러오기 
	@RequestMapping(value="/select_list.do")
	public ModelAndView select_list(@RequestParam Map<String, Object> map){
		List<Object> list = null;
		list = cmdService.select_list(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", list);
		return mav;
	}
	
	//랭킹 리스트 불러오기 
	@RequestMapping(value="/getLanking.do")
	public ModelAndView getLanking(@RequestParam Map<String, Object> map){
		List<Object> list = null;
		list = cmdService.getLanking(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", list);
		return mav;
	}
	
 		
}

