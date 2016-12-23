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
import cmd.vo.SitVO;

import cmd.thread.*;


@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController
{
    private final static Log logger = LogFactory.getLog(CmdController.class);
   
	@Resource(name = "cmdService")
	private CmdService cmdService;
	
	//로그인 호출
    @RequestMapping("/login.do")
    public String login(){
    	return "main/login";	
    }
	
	//회원가입 호출
    @RequestMapping("/join.do")
    public String join(){      	  
    	return "main/join";	
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
    
    //회원 가입 DB 등록
    @RequestMapping("/insert_member.do")
    public ModelAndView insert_member(@RequestParam Map<String, Object> map){
    	cmdService.insert_member(map);
    	ModelAndView mav = new ModelAndView("main/login");
    	return mav;
    }
    
	//로그인 check
	@RequestMapping(value="/user_login.do")
	public ModelAndView user_login(@RequestParam Map<String, Object> map, HttpServletRequest req, HttpServletResponse res){
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
    
	//메인페이지 호출
    @RequestMapping("/main.do")
    public String main(){      	  
    	return "main/main";	
    }
    
	//자리 예약 메인 페이지 호출
    @RequestMapping("/move_sit.do")
    public String move_sit(){      	  
    	return "main/sit_main";	
    }
    
	//도서관 관리 메인 페이지 호출
    @RequestMapping("/move_book.do")
    public String move_book(){      	  
    	return "main/book_main";	
    }
    
    //도서관 자리 확인
	@RequestMapping(value="/sit_check.do")
	public ModelAndView sit_check(@RequestParam Map<String, Object> map){
		List<Object> list = null;
		list = cmdService.sit_check(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", list);
		return mav;
	}
	
	//도서관 자리 예약 정보 가져오기
	@RequestMapping(value="/reservation_sit.do")
	public ModelAndView reservation_sit(@RequestParam Map<String, Object> map){
		SitVO sitVo = null;
		sitVo = (SitVO) cmdService.select_sit_id(map);		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("sitVo", sitVo);
		return mav;
	}
	
	//도서관 자리 예약 
	@RequestMapping(value="/update_sit.do")
	public ModelAndView update_sit(@RequestParam Map<String, Object> map){
		cmdService.update_sit(map);		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	//도서관 자리 예약 카운트 
	@RequestMapping(value="/reservation_count.do")
	public ModelAndView reservation_count(@RequestParam Map<String, Object> map){	
		try {
			System.out.println("스래드 정지");
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("스래드 다시 시작");
		
		SitVO sitVo = null;
		sitVo = (SitVO) cmdService.select_sit_id(map);
		
		if(sitVo.getUse_yn().equals("ing")){
			cmdService.delete_sit(map);
		}
		
    	ModelAndView mav = new ModelAndView("main/sit_main");
		return mav;
	}
	
	//도서관 자리 사용하기
    @RequestMapping("/insert_sit.do")
    public ModelAndView insert_sit(@RequestParam Map<String, Object> map){
    	cmdService.insert_sit(map);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("jsonView");
    	return mav;
    }
    
	//도서관 자리 반납하기 
	@RequestMapping(value="/delete_sit.do")
	public ModelAndView delete_sit(@RequestParam Map<String, Object> map){
		cmdService.delete_sit(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	//도서 리스트 불러오기 
	@RequestMapping(value="/book_list.do")
	public ModelAndView book_list(@RequestParam Map<String, Object> map){
		List<Object> list = null;
		list = cmdService.book_list(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", list);
		return mav;
	}
	
	//도서 반납하기
	@RequestMapping(value="/book_return.do")
	public ModelAndView book_return(@RequestParam Map<String, Object> map){
		cmdService.book_return(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	//도서 대여하기 
	@RequestMapping(value="/book_rental.do")
	public ModelAndView book_rental(@RequestParam Map<String, Object> map){
		cmdService.book_rental(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
}

