package cmd.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmd.service.MyListService;

@Controller
@RequestMapping("/myList")
public class MyListController {
	
	@Resource(name="myList.MyListService")
	private MyListService myListService;
	
	//myroom 이동
	@RequestMapping("/move_myroom.do")
	public ModelAndView move_myroom(@RequestParam Map<String, Object> map){
    	Map<String, Object> result_list = null;
		//시작 페이지를 안가져온경우 check 해서 무조건 1페이지 가져오도록 하기
		if(map.get("page") == null || map.get("page") == ""){
			map.put("page", "1");
		}		
		map.put("rows", "5"); // 페이지당 몇개의 행을 보여줄 것인지
		map.put("pageCnt", "5"); // 페이지를 몇 페이지로 나눌 것인지		
		
		result_list = myListService.select_myroom(map);
		ModelAndView mav = new ModelAndView("myList/choise_list");
    	mav.addObject("list", result_list); // 결과값 리턴
    	return mav;
	}
	
	//장바구니 이동
	@RequestMapping("/move_basket.do")
	public ModelAndView move_basket(@RequestParam Map<String, Object> map){
		Map<String, Object> result_list = null;
		//시작 페이지를 안가져온경우 check 해서 무조건 1페이지 가져오도록 하기
		if(map.get("page") == null || map.get("page") == ""){
			map.put("page", "1");
		}		
		map.put("rows", "5"); // 페이지당 몇개의 행을 보여줄 것인지
		map.put("pageCnt", "5"); // 페이지를 몇 페이지로 나눌 것인지		
		
		result_list = myListService.select_basket(map);
		ModelAndView mav = new ModelAndView("myList/buy_list");
    	mav.addObject("list", result_list); // 결과값 리턴
    	return mav;
	}
	
	//마이룸 삭제
	@RequestMapping("/myroom_delete.do")
	public ModelAndView myroom_delete(@RequestParam Map<String, Object> map){
		myListService.delete_myroom(map);
		ModelAndView mav = new ModelAndView("redirect:/myList/move_myroom.do?member_no="+map.get("member_no"));
		return mav;
	}
	
}
