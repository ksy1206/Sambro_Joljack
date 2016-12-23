package cmd.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import cmd.fcm.App;
import cmd.service.NoticeService;


@Controller("noticeQR")
@RequestMapping("/noticeQR")
public class NoticeController
{
    private final static Log logger = LogFactory.getLog(NoticeController.class);
    
    @Resource(name="noticeService")
    private NoticeService noticeService;
   
    //메인 페이지 호출
    @RequestMapping("/main.do")
    public String main(){
    	return "notice/main";
    }
    
    //공지사항 리스트 불러오기
	@RequestMapping("/notice_list.do")
	public ModelAndView notice_list(@RequestParam Map<String, Object> pMap){
		List<Object> list = noticeService.noticeList(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	
	//push 보네기 
    @SuppressWarnings("unchecked")
	@RequestMapping("/push.do")
    public String push(@RequestParam Map<String, Object> pMap){
    	List<Object> list = noticeService.push_list(pMap);
    	
    	Iterator<Object> it = list.iterator();
    	while(it.hasNext()) {
    		Map<String, Object> pushMap = new HashMap<String, Object>();
    		pushMap = (Map<String, Object>) it.next();
    		if(pushMap != null){
        		String phone_code = (String) pushMap.get("phone_code");
        		App.postSingleGCM(phone_code, "공지사항이 등록되었습니다.");
    		}
    	}  	
    	
    	return "notice/fushtest";
    }
	
    //교수 메인 페이지 호출
    @RequestMapping("/pro_main.do")
    public String pro_main(){
    	return "professor/pro_notice";
    }
    
    //공지사항 입력 페이지 이동 
    @RequestMapping("/notice_write.do")
    public String notice_write(){
    	return "professor/notice_write";
    }
  
    
    //공지사항 DB 입력 
	@RequestMapping("/insert_notice.do")
	public ModelAndView insert_notice(@RequestParam Map<String, Object> pMap){
		noticeService.insert_notice(pMap);
		
		//푸시 보내기
    	List<Object> list = noticeService.push_list(pMap);
    	
    	Iterator<Object> it = list.iterator();
    	while(it.hasNext()) {
    		Map<String, Object> pushMap = new HashMap<String, Object>();
    		pushMap = (Map<String, Object>) it.next();
    		if(pushMap != null){
        		String phone_code = (String) pushMap.get("phone_code");
        		App.postSingleGCM(phone_code, "공지사항이 등록되었습니다.");
    		}
    	} 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	//공지사항 상세 페이지 이동 
	@RequestMapping("/notice_details.do")
	public ModelAndView notice_details(@RequestParam Map<String, Object> pMap){
		Map<String, Object> result = new HashMap<>();
		result = (Map<String, Object>) noticeService.select_notice_no(pMap);
		ModelAndView mav = new ModelAndView("notice/details");
		mav.addObject("notice", result);
		return mav;
	}
	
	//교수공지사항 상세 페이지 이동 
	@RequestMapping("/pro_notice_details.do")
	public ModelAndView pro_notice_details(@RequestParam Map<String, Object> pMap){
		Map<String, Object> result = new HashMap<>();
		result = (Map<String, Object>) noticeService.select_notice_no(pMap);
		ModelAndView mav = new ModelAndView("professor/details");
		mav.addObject("notice", result);
		return mav;
	}
	
}

