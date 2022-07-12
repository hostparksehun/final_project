package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.QuestionDTO;
import kh.spring.service.QuestionService;


	
	@Controller
	@RequestMapping("/question/")
	public class QuestionController {
		
		@Autowired
		private QuestionService Qservice;
		
		
		@Autowired
		private HttpSession session;
		
		//----------------------게시판 목록 띄우기---------------------
		@RequestMapping("question_list")
		public String question(Model model) throws Exception {
			
			List<QuestionDTO> dto = Qservice.selectAll();
			model.addAttribute("qlist",dto);
			
			return "/question/question_list";
			
		}
		
		//---------------------- 작성페이지 이동 ---------------------
		@RequestMapping("question_write")
		public String question_write() {
			return "/question/question_write";
		}
		
		//---------------------- 작성---------------------
		@RequestMapping("question_insert")
		public String question_insert(QuestionDTO dto) throws Exception{
//			dto.setWriter((String)session.getAttribute("loginID"));
			Qservice.insert(dto);
			
			return "redirect:/question/question_list";
		}
		
		
		//---------------------- 상세페이지 이동 ---------------------
		@RequestMapping("question_detail")
		public String question_detail(int seq, Model model) throws Exception {
			
			Qservice.read(model, seq);
			
			return "/question/question_detail";
		}
		
		//---------------------삭제-----------------------
		
		@RequestMapping("question_delete")
		public String question_delete(int seq) throws Exception{
			
			Qservice.delete(seq);
			
			return "/question/question_list";
		}
		
		//----------------------수정---------------------
		
		@ResponseBody
		@RequestMapping("question_modify")
		public String question_modify(QuestionDTO dto) throws Exception {
			
			int result = Qservice.modify(dto);
			
			System.out.println();
			return "true";
			
//			if(result>0) {
//				return "true";
//			}else
//				return "false";
			
		}
		
		
		@ExceptionHandler //예외 공동 처리
		public String exceptionHandler(Exception e) {//NumberFormatException.class, SQLException.class
			e.printStackTrace();
			return "error";
		}
}