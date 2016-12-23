package cmd.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmd.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Resource(name="community.CommunityService")
	private CommunityService communityService;
	
	//메인 페이지 이동, DB 커뮤니티 리스트 가져오기
    @RequestMapping("/main.do")
    public ModelAndView community_main(@RequestParam Map<String, Object> map){
    	Map<String, Object> result_list = null;
		//시작 페이지를 안가져온경우 check 해서 무조건 1페이지 가져오도록 하기
		if(map.get("page") == null || map.get("page") == ""){
			map.put("page", "1");
		}		
		map.put("rows", "10"); // 페이지당 몇개의 행을 보여줄 것인지
		map.put("pageCnt", "5"); // 페이지를 몇 페이지로 나눌 것인지		
		
		result_list = communityService.select_community(map);
		
    	ModelAndView mav = new ModelAndView("community/main");
    	mav.addObject("list", result_list); // 결과값 리턴
    	System.out.println(result_list);
    	return mav;    	
    }
    
    //글쓰기 페이지 이동
    @RequestMapping("/move_write.do")
    public String move_write(){    	
    	return "community/write";    	
    }
    
    //글 DB 등록 insert_community
	@RequestMapping("/insert_community.do")
	public ModelAndView insert_community(@RequestParam Map<String, Object> map){
		communityService.insert_community(map);
		ModelAndView mav = new ModelAndView("redirect:/community/main.do");
		return mav;
	}
	
	//상세 페이지 보기 move_details
	@RequestMapping("/move_details.do")
	public ModelAndView move_details(@RequestParam Map<String, Object> map){
		Map<String, Object> result = null;
		result = communityService.select_community_details(map);
		ModelAndView mav = new ModelAndView("community/details");
		mav.addObject("data", result);
		return mav;
	}
	
	// 글 DB 수정 update_community
	@RequestMapping("/update_community.do")
	public ModelAndView update_community(@RequestParam Map<String, Object> map){
		communityService.update_community(map);
		ModelAndView mav = new ModelAndView("redirect:/community/move_details.do?community_no="+map.get("community_no"));
		return mav;
	}
	
	// 글 삭제 delete_community
	@RequestMapping("/delete_community.do")
	public ModelAndView delete_community(@RequestParam Map<String, Object> map){
		communityService.delete_community(map);
		ModelAndView mav = new ModelAndView("redirect:/community/main.do");
		return mav;
	}
}
