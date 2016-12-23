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
import helper.util.FileUtil;


@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController
{
    private final static Log logger = LogFactory.getLog(CmdController.class);
   
    @Resource(name = "cmdService")
	private CmdService cmdService;

    //메인 페이지 호출
	@RequestMapping(value="/main.do")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
		List<Object> list = null;
		
		list = cmdService.getMainList(pMap);
		
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("list", list);
		mav.addObject("dataCnt", list.size());

		return mav;
		
		
	}
   
    //커뮤니티 페이지 호출
    @RequestMapping("/get_community.do")
    public String get_community(){      	    
    	return "main/community";
    	
    }
    
    
    //대학교재 페이지 호출
    @RequestMapping("/get_book.do")
    public String get_book(){      	    
    	return "main/univ_book";
    	
    }
    //메세지 페이지 호출
    @RequestMapping("/get_msg.do")
    public String get_msg(){      	    
    	return "main/msg";
    	
    }
    
    //학습용품 페이지 호출
    @RequestMapping("/get_supply.do")
    public String get_supply(){      	    
    	return "main/study_supply";
    	
    }
 	
    
    //대학교재 리스트 보여주기
	@RequestMapping(value="/get_univ_book.do")
	public ModelAndView get_univ_book(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
		Map<String, Object> rMap = null;
		
		//페이징 처리
		String pageNum = pMap.get("pageNum").toString();		
		pMap.put("page", pageNum);
		pMap.put("rows", "5"); // 페이지당 몇개의 행을 보여줄 것인지
		pMap.put("pageCnt", "5"); // 페이지를 몇 페이지로 나눌 것인지	
		
		String category_no = pMap.get("category_no").toString();
		String category_sub_no = pMap.get("category_sub_no").toString();
		String order = pMap.get("order").toString();
		rMap = cmdService.get_univ_book(pMap);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", rMap);
		mav.addObject("category_no", category_no);
		mav.addObject("category_sub_no", category_sub_no);
		mav.addObject("order", order);
		mav.addObject("dataCnt", rMap.size());
		mav.addObject("dataCnt2", "0");
		if(!category_no.equals("0")){
			List<Object> category_sub_list = this.cmdService.get_category_sub_list(pMap);
			mav.addObject("category_sub_list", category_sub_list);
			mav.addObject("dataCnt2", category_sub_list.size());
		}
		mav.setViewName("jsonView");

		return mav;
		
		
	}
	
 	
	//학습용품 리스트 가져오기
	@RequestMapping(value="/get_study_supply.do")
	public ModelAndView get_study_supply(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
		Map<String, Object> rMap = null;
		
		//페이징 처리
		String pageNum = pMap.get("pageNum").toString();		
		pMap.put("page", pageNum);
		pMap.put("rows", "5"); // 페이지당 몇개의 행을 보여줄 것인지
		pMap.put("pageCnt", "5"); // 페이지를 몇 페이지로 나눌 것인지	
				
				
				
		String category_no = pMap.get("category_no").toString();
		String category_sub_no = pMap.get("category_sub_no").toString();
		String order = pMap.get("order").toString();
		rMap = cmdService.get_study_supply(pMap);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", rMap);
		mav.addObject("category_no", category_no);
		mav.addObject("category_sub_no", category_sub_no);
		mav.addObject("order", order);
		mav.addObject("dataCnt", rMap.size());
		mav.addObject("dataCnt2", "0");
		if(!category_no.equals("0")){
			List<Object> category_sub_list = this.cmdService.get_category_sub_list(pMap);
			mav.addObject("category_sub_list", category_sub_list);
			mav.addObject("dataCnt2", category_sub_list.size());
		}
		mav.setViewName("jsonView");

		return mav;
		
		
	}
    
	//카테고리 상세 리스트 가져오기
	@RequestMapping(value = "/get_category_sub.do")
	public ModelAndView get_category_sub(HttpServletRequest req, HttpServletResponse res,
			@RequestParam Map<String, Object> pMap) throws Exception {

		ModelAndView output = new ModelAndView();
		Map<String, Object> rMap = new HashMap<String, Object>();

		try {
			List<Object> category_sub_list = this.cmdService.get_category_sub_list(pMap);
			rMap.put("category_sub_list", category_sub_list);

		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		output.addAllObjects(rMap);
		output.setViewName("jsonView");

		return output;

	}
	
	//이미지 파일저장
	@RequestMapping("/saveCompanyFile.do")
	public ModelAndView saveCompanyFile(HttpServletRequest req, HttpServletResponse res,
			@RequestParam Map<String, Object> pMap) throws Exception {

		ModelAndView output = new ModelAndView();
		Map<String, Object> rMap = new HashMap<String, Object>();
		int result = 0;

		try {

			HttpSession sesson = req.getSession();
			String doc_root = sesson.getServletContext().getRealPath("/upload");

			String fileDestPath = "";
			String member_id = pMap.get("member_id").toString();
			fileDestPath = doc_root + File.separator + "img" + File.separator + member_id;

			int file_cnt = Integer.parseInt(pMap.get("file_cnt").toString());

			String[] file_stat_arr = new String[1];

			if (file_cnt != 1) {
				file_stat_arr = null;
				file_stat_arr = pMap.get("file_stat").toString().split(",");
			} else {

				file_stat_arr[0] = pMap.get("file_stat").toString();
			}

			for (int i = 0; i < file_cnt; i++) {

				String fileUploadPath = (String) pMap.get("fileUploadPath");
				String orgName = (String) pMap.get("fileNewName");
				String destination = (String) pMap.get("destination");

				System.out.println(" * 임시 파일 경로 : " + destination);
	
				if (!orgName.equals("") && !fileUploadPath.equals("")) {
					String temp_file_ext = orgName.substring(orgName.lastIndexOf(".") + 1);
					String temp_total_path = destination;
					Calendar calendar = Calendar.getInstance();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
					String today = dateFormat.format(calendar.getTime());
					String newName = member_id + today + "(" + i + ")." + temp_file_ext;
					// System.gc();
					FileUtil.moveFile(temp_total_path, fileDestPath, newName);

					System.out.println(" * 새로 저장된 파일 경로 : " + fileDestPath);
					System.out.println(" * 새로 저장된 파일 이름 : " + newName);

					rMap.put("fileUploadPath", fileDestPath);
					rMap.put("fileNewName", newName);
				}
			}

		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		rMap.put("resultCode", result);

		output.addAllObjects(rMap);
		output.setViewName("jsonView");

		return output;
	}
	
	
	//제품등록
 	@RequestMapping(value = "/insert_product.do")
 	public ModelAndView insert_product(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		int result = 0;
 		
 		try {
 			
 			result = this.cmdService.insert_product(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}
 		String result_code = "0";
 		if(result == 1){
 			result_code = "1";
 		}
 		rMap.put("result_code", result_code);

 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
 	
 	
 	
 	//찜하기 등록
 	@RequestMapping(value = "/insert_choise.do")
 	public ModelAndView insert_choise(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		int result = 0;
 		
 		try {
 			
 			result = this.cmdService.insert_choise(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}
 		String result_code = "0";
 		if(result == 1){
 			result_code = "1";
 		}
 		rMap.put("result_code", result_code);

 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
 	
 	//장바구니 등록
 	@RequestMapping(value = "/insert_pocket.do")
 	public ModelAndView insert_pocket(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		int result = 0;
 		
 		try {
 			
 			result = this.cmdService.insert_pocket(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}
 		String result_code = "0";
 		if(result == 1){
 			result_code = "1";
 		}
 		rMap.put("result_code", result_code);

 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
 	
 	
 	//제품삭제
 	@RequestMapping(value = "/delete_product.do")
 	public ModelAndView delete_product(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		int result = 0;
 		
 		try {
 			
 			result = this.cmdService.delete_product(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}
 		String result_code = "0";
 		if(result == 1){
 			result_code = "1";
 		}
 		rMap.put("result_code", result_code);

 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
 	
 	
	
	//쪽지보내기
 	@RequestMapping(value = "/send_msg.do")
 	public ModelAndView send_msg(HttpServletRequest req, HttpServletResponse res,
 			@RequestParam Map<String, Object> pMap) throws Exception {
 		
 		ModelAndView output = new ModelAndView();
 		Map<String, Object> rMap = new HashMap<String, Object>();
 		int result = 0;
 		
 		try {
 			
 			result = this.cmdService.send_msg(pMap);
 			
 		} catch (Exception e) {
 			throw new Exception(e.toString());
 		}
 		String result_code = "0";
 		if(result == 1){
 			result_code = "1";
 		}
 		rMap.put("result_code", result_code);

 		output.addAllObjects(rMap);
 		output.setViewName("jsonView");

 		return output;

 	}
 	
	//msg list 가져오기
	@RequestMapping(value = "/getMsgList.do")
	public ModelAndView getMsgList(HttpServletRequest req, HttpServletResponse res,
			@RequestParam Map<String, Object> pMap) throws Exception {

		ModelAndView output = new ModelAndView();
		Map<String, Object> rMap = new HashMap<String, Object>();

		try {
			List<Object> rList = this.cmdService.getMsgList(pMap);
			rMap.put("list", rList);

		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		output.addAllObjects(rMap);
		output.setViewName("jsonView");

		return output;

	}
	
	//msg list 가져오기
	@RequestMapping(value = "/get_msg_list.do")
	public ModelAndView get_msg_list(HttpServletRequest req, HttpServletResponse res,
			@RequestParam Map<String, Object> pMap) throws Exception {

		ModelAndView output = new ModelAndView();
		Map<String, Object> rMap = new HashMap<String, Object>();

		try {
			List<Object> rList = this.cmdService.get_msg_list(pMap);
			rMap.put("list", rList);

		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		output.addAllObjects(rMap);
		output.setViewName("jsonView");

		return output;

	}
	

    
 	
  
}

