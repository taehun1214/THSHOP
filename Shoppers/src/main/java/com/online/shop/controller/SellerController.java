package com.online.shop.controller;


import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.persistence.QnADAO;
import com.online.shop.persistence.RevDAO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.ProductService;
import com.online.shop.service.SellerService;
import com.online.shop.utility.EncryptUtil;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
@RequestMapping(value="/seller")
public class SellerController {

	private static final Logger logger = 
			LoggerFactory.getLogger(SellerController.class);
	
	@Autowired 
	ProductService productService;
	
	@Autowired
	SellerService sellerService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	BuyerService buyerService;
	
	@Autowired
	private QnADAO dao;
	
	@Autowired
	private RevDAO daoR;
	
	@RequestMapping(value="/sellerHome", method=RequestMethod.GET) // 맵핑 판매자 홈으로 바꾸고 나중에 쿼리 스트링 넘겨서 각각의 판매자 홈으로 넘어가게 해줘야함
	public String sellerHome(Model model, String s_id, HttpServletRequest request) {
		
		// 로그인한 판매자의 세션 정보 받아오기
		HttpSession session = request.getSession();
	    Object id = session.getAttribute("s_login_id");
		
		String s_login_id = (String) id;
		
		SellerVO sellerInfo = sellerService.readSellerInfo(s_id);
		
		// 전체 상품 리스트
		List<ProductVO> productList = sellerService.readProductBySid(s_id);
		
		int length = productList.size();
		int numOfPage = length / 8;
		if (length % 8 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 8;
		
		
		logger.info("productList size: " + productList.size());
		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);

		// 판매자 정보를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("sellerInfo", sellerInfo);
		
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
		

		return "/seller/sudo_seller_home";
		
	} // end sellerHome() -> 판매자 홈에서 상품 리스트를 보여주는 역할
	
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	
	// TEST 
	
	@RequestMapping(value="/sellerHome2", method=RequestMethod.GET) // 맵핑 판매자 홈으로 바꾸고 나중에 쿼리 스트링 넘겨서 각각의 판매자 홈으로 넘어가게 해줘야함
	public String sellerHome2(Model model, String s_id, HttpServletRequest request) {
		
		
		SellerVO sellerInfo = sellerService.readSellerInfo(s_id);
		
		// 전체 상품 리스트
		List<ProductVO> productList = sellerService.readProductBySid(s_id);
		
		int length = productList.size();
		int numOfPage = length / 8;
		if (length % 8 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 8;
		
		// --------------------------------------------------------------------
		// Q&A, Review code
		// TODO : mapper 만들기 
		
		List<QnaVO> list = dao.selecthome_selectQna(s_id);

		List<QnaRVO> listR = new ArrayList<>();
		for(QnaVO volist : list) {
			if(volist.getQna_reply() == 1) {
			QnaRVO rvo = dao.selectQnaR(volist);
			listR.add(rvo);
			}
		}
		
		List<ReviewVO>list1 = daoR.selecthome_selectRev(s_id);
		
																		logger.info("**************1");
		List<ReviewRVO> list2 = new ArrayList<>();
																		logger.info("**************2");
		for(ReviewVO volist : list1) {
																		logger.info("**************3");
			if(volist.getRev_reply() == 1) {
																		logger.info("**************4");
			ReviewRVO vo1 = daoR.selectRevReply(volist.getRev_no());
																		logger.info("**************5");
			list2.add(vo1);
																		logger.info("**************6");
			}
		}
		logger.info("**************7");
		model.addAttribute("listQnA", list);
		model.addAttribute("listQnAR", listR);
				
		logger.info("**************");
		model.addAttribute("listRev", list1);
		model.addAttribute("listReply", list2);
		
		// --------------------------------------------------------------------
				
		
		logger.info("productList size: " + productList.size());
		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);

		// 판매자 정보를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("sellerInfo", sellerInfo);
		
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
		

		return "/seller/sudo_seller_home2";
		
	} // end sellerHome() -> 판매자 홈에서 상품 리스트를 보여주는 역할
	
	
	
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String product(Model model, String p_cate1, String p_cate2) {
		logger.info("main 컨트롤러 실행");
		
		logger.info("p_cate1=" + p_cate1);
		if (p_cate1 != null && p_cate2 == null) {
		
		// 카테고리 1로 상품 받아오기
		List<ProductVO> productListByPcate = sellerService.readAllProductByPcate1(p_cate1);
		
		int length = productListByPcate.size();
		int numOfPage = length / 9;
		if (length % 9 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 9;
		
		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productListByPcate", productListByPcate);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
//		logger.info(productList.get(0).getP_name()); 
		
		}
		
		logger.info("p_cate2=" + p_cate2);
		if (p_cate1 == null && p_cate2 != null) {
		
		// 카테고리 2로 상품 받아오기
		List<ProductVO> productListByPcate = sellerService.readAllProductByPcate2(p_cate2);
		
		int length = productListByPcate.size();
		int numOfPage = length / 9;
		if (length % 9 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 9;
		
		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productListByPcate", productListByPcate);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
//		logger.info(productList.get(0).getP_name());
		
		}

		return "common/sudo_products";

	} // end product
	
	/*----------------------------------------------------------------------------*/
	
	@RequestMapping(value="pDetail", method=RequestMethod.GET)
	public String productDetail(int p_no, String s_id, String p_name, Integer page, QnaVO vo, Model model, HttpServletRequest request) {
		
		ProductVO pVo = sellerService.readItemByPno(p_no); // 상품 번호에 의한 각 상품의 전체
		// 정보 받아오기
		List<OptionVO> optionList = sellerService.readOpByPno(p_no); // 옵션 정보를
		// 받아오기
		List<ImageVO> imageList = sellerService.readImgByPno(p_no); // 이미지 정보를
		// 받아오기
		List<ProductVO> cateCheck = productService.selectCate2(pVo.getP_cate2()); // 카테고리가
		// 연관된
		// 작품
		// 리스트

		// 판매자 정보 받아오기
		s_id = pVo.getS_id();
		SellerVO sVo = sellerService.readSellerInfo(s_id);

		int length = cateCheck.size();
		int numOfPage = length / 3;
		if (length % 3 > 0) {
			numOfPage++; // 나머지가 있으면 올림
		}
		int remainder = length % 3;

		model.addAttribute("productVO", pVo); // 전체 정보를 Model 객체에 넣어서 View(jsp)에
		// 전달
		model.addAttribute("optionList", optionList); // 받아온 옵션 정보를 Model 객체에
		// 넣어서 View(jsp)에 전달
		model.addAttribute("imageList", imageList); // 받아온 이미지 정보를 Model 객체에 넣어서
		// View(jsp)에 전달

		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		// model.addAttribute("productList", productList);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		model.addAttribute("relativeList", cateCheck); // 카테고리 검색해서 연관상품 보여주기
		model.addAttribute("sVo", sVo);

		
		//System.out.println("qnrController");
		// 페이지 criteria 생성자 만들기
		PageCriteria c = new PageCriteria();
		if (page != null){
			c.setPage(page);
		}
		
		List<QnaVO> list = dao.selectQna(p_no);

		List<QnaRVO> listR = new ArrayList<>();
		for(QnaVO volist : list) {
			if(volist.getQna_reply() == 1) {
			QnaRVO rvo = dao.selectQnaR(volist);
			listR.add(rvo);
			}
		}
		
		List<ReviewVO>list1 = daoR.selectRev(p_no);
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
		
		// 카테고리 검색해서 연관상품 보여주기
		List<ProductVO> relativelist = productService.selectCate2(pVo.getP_cate2());
		model.addAttribute("relativeList", relativelist);
		
		return "/seller/sudo_product_detail";
		
	} // end productDetail() -> 판매자 홈에서 상품 번호를 참조해 상품 상세 페이지로 넘겨주는 역할 

	
	@RequestMapping(value="logoPop", method=RequestMethod.GET)
	public void logoPopGet() {
		
	}
	
	@RequestMapping(value="logoPop", method=RequestMethod.POST)
	public void logoPopPost(@RequestBody SellerVO sVo, String s_id, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Object id = session.getAttribute("s_login_id");
		s_id = (String) id;
		logger.info("infoPop 로고 s_id........"+s_id + "/"+sVo.getS_logo());
		// 서비스 객체를 사용하여 로고 이미지 update
		int LUpResult = sellerService.updateLogo(sVo, s_id);
		//logger.info("결과: " + LUpResult);
		//int LUpResult = 1;
		if(LUpResult == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
			
	}
	
	@RequestMapping(value="infoPop", method=RequestMethod.GET)
	public void infoPopGet() {
		
	}
	
	@RequestMapping(value="infoPop", method=RequestMethod.POST)
	public void infoPopPost(@RequestBody SellerVO sVo, String s_id, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
	    Object id = session.getAttribute("s_login_id");
		s_id = (String) id;
		logger.info("infoPop 로고 s_id........"+s_id+"//"+sVo.getS_info());
		
		// 서비스 객체를 사용하여 판매자 정보 update
		//int IUpResult = 1;
		int IUpResult = sellerService.updateInfo(sVo, s_id);
		logger.info("결과: " + IUpResult);
		if(IUpResult == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
	}

	/*----------------------------------------------------------------------------*/
	
	// mypage 호출
	@RequestMapping(value="sellermypage", method=RequestMethod.GET)
	public void SellerMypage(){
		
	}
	
	@RequestMapping(value="sellermypage_order", method=RequestMethod.GET)
	public void SellerMypageOrder(){
		
	}
	
	@RequestMapping(value="sellermypage_complete", method=RequestMethod.GET)
	public void SellerMypageComplete(){
		
	}
	
	@RequestMapping(value="sellermypage_product", method=RequestMethod.GET)
	public void SellerMypageProductAcc(){
		
	}

	//seller개인정보수정
	@RequestMapping(value="sellermypage_updateinfo", method=RequestMethod.GET)
	public void sellerMypageUpdateInfo(String s_id, Model model){
		System.out.println("판매자: "+ s_id);
		SellerVO vo = sellerService.readSellerInfo(s_id);
		model.addAttribute("sellerInfo", vo);
	}
	
	//판매자 마이페이지 정보수정 기존비밀번호 일치 확인
	@RequestMapping(value = "s_checkpw", method = RequestMethod.POST)
	public void s_checkpw(@RequestBody SellerVO vo, HttpServletResponse response) throws IOException {

		logger.info("checkpw 실행");
		logger.info("userpw: " + vo.getS_pw()+ "//id: " +vo.getS_id());
		vo.setS_pw(EncryptUtil.getEncryptMD5(vo.getS_pw()));
		if(sellerService.isValidUser(vo.getS_id(), vo.getS_pw())) {
			response.getWriter().print(1);
		} else {
			response.getWriter().print(0);
		}

	}
	
	
	//판매자 개인정보수정
	@RequestMapping(value="sellermypage_updateinfo", method=RequestMethod.POST)
	public void sellerMypageUpdateInfoPost(@RequestBody SellerVO vo, HttpServletResponse response) throws IOException{
		System.out.println("vo: " +vo.getS_id()+"/"+vo.getS_pw()+"/"+vo.getS_email());
		vo.setS_pw(EncryptUtil.getEncryptMD5(vo.getS_pw()));
		int result = sellerService.updateSellerInfo(vo);
		System.out.println("결과:"+result);
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}
	}	
	
	
	//판매자회원탈퇴페이지
	@RequestMapping(value="sellermypage_drop", method = RequestMethod.GET)
	public void sellerDrop(String s_id, Model model){
		
		System.out.println("판매자아이디: "+ s_id);
		SellerVO vo = sellerService.readCheckID(s_id);
		model.addAttribute("sellerInfo", vo);
	}
	
	
	//판매자회원탈퇴
	@RequestMapping(value="sellermypage_drop_commit", method = RequestMethod.PUT)
	public void sellerDropcommit(@RequestBody SellerVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("구매자아이디: "+ vo.getS_id());
		int result = sellerService.deleteSeller(vo.getS_id());
		//int result = 1;
		if(result  == 1) {
		HttpSession session = request.getSession();
		session.invalidate();
		response.getWriter().print(1);
		logger.info("세션 비우기 성공!");
		} else {
			response.getWriter().print(0);
			logger.info("세션 비우기 실패!");
		}
	}
	
	//판매자 아이디 찾기
	@RequestMapping(value="findID", method = RequestMethod.GET)
	public void findsellerID(){

	}
	
	//판매자 비밀번호 찾기
	@RequestMapping(value="findpw", method = RequestMethod.GET)
	public void findsellerPW(){

	}
	
	// ** 판매자 아이디찾기 이메일 인증
	// 이메일 인증번호 발송
	@RequestMapping(value = "checkemailforid", method = RequestMethod.POST)
	public void checkEmail(@RequestBody SellerVO vo, HttpServletResponse response) throws IOException {
		logger.info("email: " + vo.getS_email()+"/name: " +vo.getS_name());
		
		//System.out.println(buyerService.findId(vo)+"/"+buyerService.findId(vo).isEmpty());
		// true면 db에서 일치하는 정보가 없을때임
		SellerVO result = sellerService.findId(vo);
		//System.out.println("email: " + result.getS_email()+"/name: " +result.getS_name());
		//buyerService.findId(vo).equals("")
		
		if(result == null) {
			response.getWriter().print(0);
		} else{
			// @ converted to %40 in HTTPPost request
			String convert_email = URLDecoder.decode(vo.getS_email(), "UTF-8");

			// 필요없는 문자열을 제거
			String b_email = convert_email.substring(0, convert_email.length() - 1);

			// 4자리 인증번호 생성
			// 1. 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)
			// 2. 다섯자리가 넘어가면 1000을 빼준다.
			int code = (int) (Math.random() * 10000 + 1000);
			if (code > 10000) {
				code = code - 1000;
			}

			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(b_email); // 받는 이메일 등록

			logger.info("메일 주소 : " + b_email);

			message.setSubject("쇼핑몰 인증번호"); // 이메일 제목
			message.setText("본인인증번호는 [ " + code + " ] 입니다. 정확히 입력해주세요"); // 이메일 내용

			logger.info("보낸 코드 : " + code);
			mailSender.send(message); // 이메일 전송

			response.getWriter().print(code);

		};

	}
	
	// ** 판매자 이메일 인증 비밀번호 찾기
		// 이메일 인증번호 발송
		@RequestMapping(value = "checkemailforpw", method = RequestMethod.POST)
		public void checkEmailforPW(@RequestBody SellerVO vo, HttpServletResponse response) throws IOException {
			logger.info("email: " + vo.getS_email()+"/name: " +vo.getS_id());
			System.out.println("email: " + vo.getS_email()+"/name: " +vo.getS_id());
			//System.out.println(buyerService.findId(vo)+"/"+buyerService.findId(vo).isEmpty());
			// true면 db에서 일치하는 정보가 없을때임
			SellerVO result = sellerService.findPw(vo);
			//buyerService.findId(vo).equals("")
			if(result == null) {
				response.getWriter().print(0);
			} else{
				// @ converted to %40 in HTTPPost request
				String convert_email = URLDecoder.decode(vo.getS_email(), "UTF-8");

				// 필요없는 문자열을 제거
				String b_email = convert_email.substring(0, convert_email.length() - 1);

					// 4자리 인증번호 생성
					// 1. 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)
					// 2. 다섯자리가 넘어가면 1000을 빼준다.
				int code = (int) (Math.random() * 10000 + 1000);
				if (code > 10000) {
					code = code - 1000;
				}
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(b_email); // 받는 이메일 등록

				logger.info("메일 주소 : " + b_email);

				message.setSubject("쇼핑몰 인증번호"); // 이메일 제목
				message.setText("본인인증번호는 [ " + code + " ] 입니다. 정확히 입력해주세요"); // 이메일 내용

				logger.info("보낸 코드 : " + code);
				mailSender.send(message); // 이메일 전송

				response.getWriter().print(code);

			};

		}
	
	@RequestMapping(value="findidforlogin")
	public void findlogin(SellerVO vo, Model model) {
		System.out.println("findidlogin" +vo.getS_name()+"/"+vo.getS_email());
		SellerVO vo1 = sellerService.findId(vo);
		//System.out.println("after: "+vo1.getB_id()+"/"+vo1.getB_birth());
		model.addAttribute("s_id", vo1.getS_id());
		model.addAttribute("s_birth", vo1.getS_birth());
	}
	
	//pw재설정하는 페이지로 이동
	@RequestMapping(value="findpwforupdate")
	public void findpwupdate(SellerVO vo, Model model) {
		System.out.println("findpwupdate" +vo.getS_id()+"/"+vo.getS_email());
		SellerVO vo1 = sellerService.findPw(vo);
		System.out.println("after: "+vo1.getS_id()+"/"+vo1.getS_birth());
		model.addAttribute("vo", vo1);
		
	}
	
	@RequestMapping(value="findpwforupdate", method=RequestMethod.POST)
	public void findpwupdatePOST(@RequestBody SellerVO vo, HttpServletResponse response) throws IOException {
		System.out.println("findpwupdatePOST/ " +vo.getS_id()+"/"+vo.getS_pw());
		int result = sellerService.updatePw(vo);
		//System.out.println("after: "+vo1.getB_id()+"/"+vo1.getB_birth());
		if(result == 1) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(0);
		}				
	}
	// 판매자 로그인 했을때 검색 
		@RequestMapping(value="search_form", method=RequestMethod.POST)
		public String search_form(String searching, Model model){
			logger.info("검색어 : "+searching);
			String p_name = searching;
			logger.info("search_form 컨트롤러 실행");
			List<ProductVO> productListByPcate = productService.selectSearch(p_name);
			logger.info("검색 리스트");
			int length = productListByPcate.size();
			int numOfPage = length / 9;
			if (length % 9 > 0) {
				numOfPage++; // 나머지가 있으면 올림
			}
			int remainder = length % 9;
			model.addAttribute("productListByPcate", productListByPcate);
			model.addAttribute("numOfPage", numOfPage);
			model.addAttribute("remainder", remainder);
			logger.info("length : " + length);
			logger.info("numOfPage : " + numOfPage);
			logger.info("remainder : " + remainder);
			return "common/sudo_products";
		}

	
} // end class SellerController
