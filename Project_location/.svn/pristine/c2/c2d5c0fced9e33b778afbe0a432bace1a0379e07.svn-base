package sambro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sambro.service.MainService;
import sambro.service.MemberService;
import sambro.service.WebService;
import sambro.vo.MemberVO;

@Controller
@RequestMapping(value="/web")
public class WebController {
	
	@Resource(name="web.WebService")
	private WebService webService;
	@Resource(name="member.MemberService")
	private MemberService memberService;
	@Resource(name="main.MainService")
	private MainService mainService;
	
	//메인 페이지 이동
	@RequestMapping(value="/login.do")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView("web/login");
		return mav;
	}
	
	//로그인 아이디 & 비밀번호 체크
	@SuppressWarnings("unused")
	@RequestMapping(value="/login_check.do")
	public ModelAndView login_check(@RequestParam Map<String, Object> map, HttpServletRequest req, HttpServletResponse res){
		String check = null;
		MemberVO memberVo = null;
		Map<String, Object> rMap = new HashMap<String, Object>();
		memberVo = (MemberVO) memberService.login_check(map);
		
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
	
	//메인 페이지 이동
	@RequestMapping(value="/main.do")
	public ModelAndView mainWeb(){
		ModelAndView mav = new ModelAndView("web/main");
		return mav;
	}
	
	//관리자 업체등록
	@RequestMapping(value="/company_add.do")
	public ModelAndView company_add(){
		ModelAndView mav = new ModelAndView("web/company_add");
		return mav;
	}
	
	//관리자 업체 수정 삭제
	@RequestMapping(value="/company_modify_delete.do")
	public ModelAndView company_modify_delete(@RequestParam Map<String, Object> map){
		List<Object> companyList = null;
		companyList = webService.selectAll_list(map);
		ModelAndView mav = new ModelAndView("web/company_modify_delete");
		mav.addObject("companyList", companyList);
		mav.addObject("search_c_name", map.get("search_c_name"));
		return mav;
	}
	
	//관리자 위험지역 등록
	@RequestMapping(value="/dangerArea_add.do")
	public ModelAndView dangerArea_add(){
		ModelAndView mav = new ModelAndView("web/dangerArea_add");
		return mav;
	}
	
	//관리자 위험지역 삭제
	@RequestMapping(value="/dangerArea_delete.do")
	public ModelAndView dangerArea_delete(@RequestParam Map<String, Object> map){
		List<Object> resultList = webService.select_AllDangerAreaList(map);
		ModelAndView mav = new ModelAndView("web/dangerArea_delete");
		mav.addObject("dangerArea_list", resultList);
		return mav;
	}
	
	//업체 등록
	@RequestMapping(value="/addCompany_form.do")
	public ModelAndView addCompany_form(@RequestParam Map<String, Object> map){
		mainService.insertCompanny(map);
		ModelAndView mav = new ModelAndView("web/company_add");
		mav.addObject("return_value", "addOk");
		return mav;
	}
	
	//업체 수정
	@RequestMapping(value="/modifyCompany_form.do")
	public ModelAndView modifyCompany_form(@RequestParam Map<String, Object> map){
		mainService.updateCompany(map);
		ModelAndView mav = new ModelAndView("redirect:/web/company_modify_delete.do");
		return mav;
	}
	
	//업체 삭제
	@RequestMapping(value="/companyDelete.do")
	public ModelAndView companyDelete(@RequestParam Map<String, Object> map){
		mainService.deleteCompany(map);
		ModelAndView mav = new ModelAndView("redirect:/web/company_modify_delete.do");
		return mav;
	}
	
	//위험지역 등록
	@RequestMapping(value="/addDangerArea.do")
	public ModelAndView addDangerArea(@RequestParam Map<String, Object> map){
		mainService.insertDangerArea(map);
		ModelAndView mav = new ModelAndView("web/dangerArea_add");
		mav.addObject("return_value", "addOk");
		return mav;
	}
	
	//위험지역 삭제
	@RequestMapping(value="/dangerArea_deleteDb.do")
	public ModelAndView dangerArea_deleteDb(@RequestParam Map<String, Object> map){
		mainService.deleteDangerArea(map);
		ModelAndView mav = new ModelAndView("redirect:/web/dangerArea_delete.do");
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
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
			res.sendRedirect(cp + "/web/login.do");
		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		// return output;
	}
	
}
