package com.online.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.online.shop.domain.CartVO;
import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.persistence.QnADAO;
import com.online.shop.persistence.RevDAO;
import com.online.shop.service.CartService;

@Controller
@RequestMapping(value="/seller")
public class QnRController {

	@Autowired
	private QnADAO dao;
	
	@Autowired
	private RevDAO daoR;
	
	@Autowired
	private CartService cartservice;
	//최초화면에서 qna와 review 리스트를 가져와 화면에 출력
/*	@RequestMapping(value="qnr", method=RequestMethod.GET)
	public void qaMain(Integer page, QnaVO vo, Model model) {
		
		//System.out.println("qnrController");
		// 페이지 criteria 생성자 만들기
		PageCriteria c = new PageCriteria();
		if (page != null){
			c.setPage(page);
		}
		
		List<QnaVO> list = dao.selectQna(c);

		List<QnaRVO> listR = new ArrayList<>();
		for(QnaVO volist : list) {
			if(volist.getQna_reply() == 1) {
			QnaRVO rvo = dao.selectQnaR(volist);
			listR.add(rvo);
			}
		}

		
		List<ReviewVO>list1 = daoR.selectRev(c);
		List<ReviewRVO> list2 = new ArrayList<>();
		for(ReviewVO volist : list1) {
			if(volist.getRev_reply() == 1) {
			ReviewRVO vo1 = daoR.selectRevReply(volist.getRev_no());
			list2.add(vo1);
			
			}
		}
		
		model.addAttribute("listQnA", list);
		model.addAttribute("listQnAR", listR);
				
		model.addAttribute("listRev", list1);
		model.addAttribute("listReply", list2);
		
		// 페이지 메이커 생성
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(dao.getNumOfRecordsQna());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}*/
	
/*	//구매자가 qna를 등록하기위한 페이지 띄움
	@RequestMapping(value="insertQnA", method=RequestMethod.GET)
	public void insertQnA(int p_no, String b_id, Model model) {
		System.out.println("insertQnA GET/"+b_id);
		model.addAttribute("p_no", p_no);
		model.addAttribute("b_id", b_id);
	}
	
	//구매자가 qna를 작성하고 등록버튼을 클릭했을때 처리
	@RequestMapping(value="insertQnA", method=RequestMethod.POST)
	public void insertQnAPOST(@RequestBody QnaVO vo,  HttpServletResponse response) throws IOException {
		System.out.println("insert qna Post");
		//System.out.println("vo:"+ vo.getB_email() + "/"+vo.getQna_cont());
		
		int result = dao.insertQnA(vo);

		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
	}*/
	
	//qna에 판매자가 답글을 등록하는 과정
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public void insertReplyPost(@RequestBody QnaRVO vo, HttpServletResponse response) throws IOException {
		int result=0;
		System.out.println("/////"+vo.getP_no()+"//"+vo.getQna_r_cont()+"//"+vo.getQna_no());
		if(!(vo.getQna_r_cont().equals(""))) {
			result = dao.insertQnAR(vo);
			System.out.println("result cont:"+result);
			
			if(result == 1) {
				response.getWriter().print(1);
			}else {
				response.getWriter().print(0);
			}
			
		} else{
			response.getWriter().print(0);
		}
		
	}
	
	//qna 답글을 수정하는 과정
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public void updateReplyPOST(@RequestBody QnaRVO vo, HttpServletResponse response) throws IOException {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.updateQnAR(vo);
		//System.out.println("result: " +result);
		
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}

	}
	
	//qna 답글을 삭제하는 과정
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public void deleteReplyPOST(@RequestBody QnaRVO vo, HttpServletResponse response) throws IOException {
		//ystem.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.deleteQnAR(vo);
		//System.out.println("result: " +result);
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}

	}
	
/*	//구매자가 후기를 등록하기위한 페이지
	@RequestMapping(value="insertReview", method=RequestMethod.GET)
	public void insertReview(int p_no, String b_id, Model model) {
		System.out.println("vovovovovovvovovo");
		CartVO vo = new CartVO();
		vo.setB_id(b_id);
		vo.setP_no(p_no);
		List<CartVO> list = cartservice.selectCartBuyer(vo);
		model.addAttribute("p_no", p_no);
		model.addAttribute("b_id", b_id);
		model.addAttribute("cartlist", list);
		
	}
	
	//구매자가 후기를 등록하기위한 페이지
	@RequestMapping(value="insertReview", method=RequestMethod.PUT)
	public void insertReviewPut(@RequestBody CartVO vo, HttpServletResponse response) throws IOException {
		//System.out.println("vo: "+ vo.getB_id()+"vo: " +vo.getP_no());
		
		//int result =1;
		List<CartVO> list = cartservice.selectCartBuyer(vo);
		
		if(list.size() > 0) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}	
		
	}
	
	//구매자가 후기를 작성하고 저장하는 과정
	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	public void insertReviewPOST(@RequestBody ReviewVO vo, HttpServletResponse response) throws IOException {
		//System.out.println("vo: "+ vo.getRev_score());
		//System.out.println("vo: " + vo.getRev_cont());
		int result = daoR.insertRev(vo);
		//System.out.println("insert 결과: "+result);
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}		
	}*/
	
	//구매자가 작성한 후기에 판매자가 답글 등록
	@RequestMapping(value="insertrevReply", method=RequestMethod.POST)
	public void insertReplyPost(@RequestBody ReviewRVO vo, HttpServletResponse response) throws IOException {
		//System.out.println("vo: "+ vo.getRev_r_cont()+"/"+vo.getRev_no());

		int result=0;
		
		if(!(vo.getRev_r_cont().equals(""))) {
			result = daoR.insertRevReply(vo);
			if(result == 1) {
				response.getWriter().print(1);
			}else {
				response.getWriter().print(0);
			}	
		} else{
			response.getWriter().print(0);
		}


	}
	
	//구매자가 등록한 후기에 답글을 수정하는 과정
	@RequestMapping(value="updaterevReply", method=RequestMethod.POST)
	public void updateReplyPOST(@RequestBody ReviewRVO vo, HttpServletResponse response) throws IOException {
		//System.out.println("vo: "+ vo.getRev_r_cont()+"/"+vo.getRev_no());
		int result = daoR.updateRevReply(vo);
		
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
	}
	
	//구매자가 등록한 후기에 답글을 삭제하는 과정
	@RequestMapping(value="deleterevReply", method=RequestMethod.POST)
	public void deleteReplyPOST(@RequestBody ReviewRVO vo, HttpServletResponse response) throws IOException {
		//System.out.println("deleterevReply//" + vo.getS_id()+"//"+vo.getRev_r_cont()+"//"+vo.getRev_r_no());
		int result = daoR.deleteRevReply(vo);
		
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
	}
}
