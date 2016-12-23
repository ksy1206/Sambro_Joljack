package cmd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmd.service.MemberService;
import cmd.vo.MemberVO;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="member.MemberService")
	private MemberService memberService;
	
	//로그인 호출
	@RequestMapping("/move_login.do")
	public ModelAndView move_login(){
		ModelAndView mav = new ModelAndView("member/login");
		return mav;
	}
	
	//회원가입 호출
	@RequestMapping("/move_join.do")
	public ModelAndView move_join(){
		ModelAndView mav = new ModelAndView("member/join");
		return mav;
	}
	
	//회원가입
	@RequestMapping("/insert_member.do")
	public ModelAndView insert_member(@RequestParam Map<String, Object> map){
		memberService.insert_member(map);
		ModelAndView mav = new ModelAndView("member/login");
		return mav;
	}
	
	//로그인
	@RequestMapping("/member_check.do")
    public ModelAndView user_login(HttpServletRequest req, HttpServletResponse res,@RequestParam Map<String, Object> map){
    	MemberVO memberVo = null;
    	memberVo = (MemberVO) memberService.check_login(map);
    	Map<String, Object> rMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
    	
    	if(memberVo.getCheck() != "no"){
    		HttpSession session = req.getSession(true);
    		
    		
    		rMap.put("memberInfo", memberVo);
    		session.setAttribute("sessionData", rMap);
    		session.setAttribute("member_no", memberVo.getMember_no());
    		session.setAttribute("member_id", memberVo.getMember_id());
    		mav.addObject("member_no", memberVo.getMember_no());
    		mav.addObject("member_id", memberVo.getMember_id());
    	}    	
    	
		mav.setViewName("jsonView");
		mav.addObject("check", memberVo.getCheck());
    	
    	return mav;
    }
	
	// 아이디 찾기
	@RequestMapping("/find_member_id.do")
	public ModelAndView find_member_id(@RequestParam Map<String, Object> map){
		MemberVO memberVo = null;
		memberVo = (MemberVO) memberService.find_id(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("member_id", memberVo.getMember_id());
		mav.addObject("check", memberVo.getCheck());
		return mav;
	}
	
	//비밀번호 찾기
	@RequestMapping("/find_member_pwd.do")
	public ModelAndView find_member_pwd(@RequestParam Map<String, Object> map){
		MemberVO memberVo = null;
		memberVo = (MemberVO) memberService.find_pwd(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("member_pwd", memberVo.getMember_pwd());
		mav.addObject("check", memberVo.getCheck());
		return mav;
	}
	
	
	//로그아웃
	@RequestMapping("/move_logout.do")
	public void move_logout(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView output = new ModelAndView();

		try {
			HttpSession session = req.getSession(true);
			Map<String, Object> sessionData = (Map<String, Object>) session.getAttribute("sessionData");

			if (sessionData != null) {
				session.removeAttribute("sessionData");
				session.invalidate();
				session = req.getSession(true);		
			}

			String cp = req.getContextPath();
			res.sendRedirect(cp + "/cmd/main.do");
		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		// return output;
	}
}
