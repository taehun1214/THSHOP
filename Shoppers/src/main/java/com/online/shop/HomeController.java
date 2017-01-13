package com.online.shop;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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
import com.online.shop.persistence.QnADAO;
import com.online.shop.persistence.RevDAO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.ProductService;
import com.online.shop.service.SellerService;
import com.online.shop.utility.EncryptUtil;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*---------------------------------------------------------------------------------*/

	@Autowired
	ProductService productService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	BuyerService buyerService;

	@Autowired
	private QnADAO dao;

	@Autowired
	private RevDAO daoR;

	@Autowired
	SellerService sellerService;

	
	/*---------------------------------------------------------------------------------*/
// ** 비회원 메인 화면
	
	@RequestMapping(value="template_form", method=RequestMethod.GET)
	public void openTemplete(){
		
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home2(Locale locale, Model model, HttpServletRequest request) {

		logger.info("Welcome home! The client locale is {}.", locale);
		List<ProductVO> productList = sellerService.readAllProduct();

		int length = productList.size();
		int numOfPage = length / 4;
		if (length % 4 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 4;

		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
		/* logger.info(productList.get(0).getP_name()); */
		
		for(int i = 0; i<productList.size() ; i++ ) {
			logger.info("p_acc: " + productList.get(i).getP_acc());
		}

		return "common/sudo_index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {

		logger.info("Welcome home! The client locale is {}.", locale);
		List<ProductVO> productList = sellerService.readAllProduct();

		int length = productList.size();
		int numOfPage = length / 4;
		if (length % 4 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 4;

		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
		/* logger.info(productList.get(0).getP_name()); */
		
		for(int i = 0; i<productList.size() ; i++ ) {
			logger.info("p_acc: " + productList.get(i).getP_acc());
		}

		return "common/sudo_index";
	}

	
	/*---------------------------------------------------------------------------------*/
// ** 비회원 로그인 화면
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String openRegister() {
		return "common/sudo_loginSelect";
	}
	
	
	
	/*---------------------------------------------------------------------------------*/
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
// ** 구매자 메인 화면
	
	@RequestMapping(value = "buyer/main", method = RequestMethod.GET)
	public String mainHome(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		// 주문 중복시, 메인으로 올때 주문된 정보를 지움(orderInterceptor, orerdercontroller)
		session.removeAttribute("ordered");
		// 셀러로 회원가입시, 로그인된 상태로 메인으로 넘어옴
		session.getAttribute("s_login_id");
		logger.info("main 컨트롤러 실행");
		// 전체 상품 리스트
		List<ProductVO> productList = sellerService.readAllProduct();

		int length = productList.size();
		int numOfPage = length / 4;
		if (length % 4 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 4;

		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
		/* logger.info(productList.get(0).getP_name()); */

		return "common/sudo_index";

	} // end sellerHome() -> 판매자 홈에서 상품 리스트를 보여주는 역할

	
	/*---------------------------------------------------------------------------------*/
// ** 구매자 회원가입
	
	@RequestMapping(value = "buyer/register", method = RequestMethod.GET)
	public String mainRegister(Model model) {

		logger.info("register_buyer 실행");

		// return "sudo_checkout2";
		return "/buyer/register_buyer";
	}

	
// ** 구매자 회원가입 _아이디 중복체크

	@RequestMapping(value = "buyer/b_checkid", method = RequestMethod.POST)	// 구매자 login_register 아이디 중복체크 컨트롤러
	public void b_checkid(@RequestBody String userid, HttpServletResponse response) throws IOException {

		logger.info("checkid 실행");
		// logger.info("userid" + userid);

		// 필요없는 문자열을 제거
		String b_id = userid.substring(0, userid.length() - 1);
		logger.info("b_id : " + b_id);

		// DB에서 입력한 문자열 검색
		BuyerVO vo = buyerService.read(b_id);

		// DB에 있다면 중복...
		if (vo != null) {
			String selectedID = vo.getB_id();
			logger.info("[ " + selectedID + " ] 는 중복된 아이디 입니다...");
			response.getWriter().print(1);

		} else {
			logger.info("사용 가능한 아이디 입니다...^^");
		}
	}

// ** 구매자 회원가입 _이메일 인증

	// 이메일 인증번호 발송
	@RequestMapping(value = "buyer/checkemail", method = RequestMethod.POST)
	public void checkEmail(@RequestBody String email, HttpServletResponse response) throws IOException {
		logger.info("email: " + email);

		// @ converted to %40 in HTTPPost request
		String convert_email = URLDecoder.decode(email, "UTF-8");

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
		// model.addAttribute("code", code);

		response.getWriter().print(code);
		// return "email_result";
	}


// ** 구매자 회웝가입 _가입완료 버튼 클릭
	@RequestMapping(value = "buyer/b_register_result", method = RequestMethod.POST)
	public String b_register_result(BuyerVO vo, HttpServletRequest request) { // default
																				// 객체로
																				// 생성하고
																				// name
																				// 정보들을
																				// set
																				// 한다.
		vo.setB_pw(EncryptUtil.getEncryptMD5(vo.getB_pw()));
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		buyerService.insert(vo);
		logger.info("구매자 회원가입 성공! ");
		logger.info("회원 가입된 아이디 : " + vo.getB_id());

		HttpSession session = request.getSession();
		session.setAttribute("b_login_id", vo.getB_id());
		return "redirect:/buyer/main";
	}

	
// ** 구매자 로그인

	@RequestMapping(value = "buyer/login", method = RequestMethod.POST)
	public void login(String b_id, String b_pw, HttpServletRequest request, String query, Model model, HttpServletResponse response) throws IOException {
		logger.info("login 컨트롤러 실행");
		b_pw = EncryptUtil.getEncryptMD5(b_pw);
		logger.info("b_id : " + b_id + " , b_pw : " + b_pw);
		HttpSession session = request.getSession();
		if (buyerService.isValidUser(b_id, b_pw)) {
			logger.info("로그인 성공");
			model.addAttribute("login_result", buyerService.isValidUser(b_id, b_pw));
			
			session.setAttribute("b_login_id", b_id);
			session.removeAttribute("s_login_id");
			session.setAttribute("login_result", buyerService.isValidUser(b_id, b_pw));
			logger.info("세션 저장 성공! key:login_id, 값 : " + b_id);
			
			// login-post 요청을 보낸 주소를 저장
			logger.info("query: " + query);
			if (query != null && !query.equals("null")) {
				// 요청 파라미터 query에 값이 들어 있는 경우
				String dest = query.substring(4);
				logger.info("dest : " + dest);
				request.getSession().setAttribute("dest", dest);
			}

		} else {
			logger.info("로그인 실패");
			session.setAttribute("login_result", false);
			session.setAttribute("loginFail", "fail");
			response.sendRedirect("login");
			
		}
	}
	
	@RequestMapping(value = "buyer/login", method = RequestMethod.GET)
	public String loginOpen() {
		return "redirect:../login";
	}
	
	
	

// ** 구매자 로그아웃

	@RequestMapping(value = "buyer/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("login_id");
		session.invalidate();
		logger.info("세션 비우기 성공!");
		return "redirect:../"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}
	
	
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////                   Seller                    ///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	/*---------------------------------------------------------------------------------*/
// ** 판매자 메인 화면	

	@RequestMapping(value = "seller/main", method = RequestMethod.GET)
	public String sellerMainHome(Model model, HttpServletRequest request) {
		// 셀러로 회원가입시, 로그인된 상태로 메인으로 넘어옴

		HttpSession session = request.getSession();
		session.getAttribute("s_login_id");

		logger.info("main 컨트롤러 실행");
		// 전체 상품 리스트
		List<ProductVO> productList = sellerService.readAllProduct();

		int length = productList.size();
		int numOfPage = length / 4;
		if (length % 4 > 0) {
			numOfPage++; // 나머지가 있으면 올림
			// 뷰페이저로 한 페이지에 4개씩 출력 !
			// ex) (9/4 = 2.X )=> 3페이지 필요
		}
		int remainder = length % 4;

		// 전체 상품 리스트를 Model 객체에 넣어서 View(jsp)에 전달
		model.addAttribute("productList", productList);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("remainder", remainder);
		logger.info("length : " + length);
		logger.info("numOfPage : " + numOfPage);
		logger.info("remainder : " + remainder);
		/* logger.info(productList.get(0).getP_name()); */

		return "common/sudo_index";

	} // end sellerHome() -> 판매자 홈에서 상품 리스트를 보여주는 역할

	/*----------------------------------------------------------------------------*/

	/*
	 * // TODO : ProductController로 이동
	 * 
	 * @RequestMapping(value="pDetail2", method=RequestMethod.GET) public String
	 * product_Detail(int p_no, String s_id, String p_name, Model model) { // 상품
	 * 번호에 의한 각 상품의 전체 정보 받아오기 ProductVO pVo =
	 * sellerService.readItemByPno(p_no); // 전체 정보를 Model 객체에 넣어서 View(jsp)에 전달
	 * model.addAttribute("productVO", pVo);
	 * 
	 * // 옵션 정보를 받아오기 List<OptionVO> optionList =
	 * sellerService.readOpByPno(p_no); // 받아온 옵션 정보를 Model 객체에 넣어서 View(jsp)에
	 * 전달 model.addAttribute("optionList", optionList);
	 * 
	 * // 이미지 정보를 받아오기 List<ImageVO> imageList =
	 * sellerService.readImgByPno(p_no); // 받아온 이미지 정보를 Model 객체에 넣어서 View(jsp)에
	 * 전달 model.addAttribute("imageList", imageList);
	 * 
	 * return "UI/sudo_product_detail";
	 * 
	 * } // end productDetail() -> 판매자 홈에서 상품 번호를 참조해 상품 상세 페이지로 넘겨주는 역할
	 */
	/*----------------------------------------------------------------------------*/

	// 여기서부터 태훈이 코드.///////////////////////////////////////
	// ### 회원가입 메인
	@RequestMapping(value = "seller/register", method = RequestMethod.GET)
	public String sellerMainRegister(Model model) {

		logger.info("register_seller 실행");

		// return "sudo_checkout2";
		return "/seller/register_seller";
	}

	/*---------------------------------------------------------------------------------*/

	// 판매자 login_register 아이디 중복체크 컨트롤러
	@RequestMapping(value = "seller/s_checkid", method = RequestMethod.POST)
	public void s_checkid(@RequestBody String userid, HttpServletResponse response) throws IOException {

		logger.info("checkid 실행");
		// logger.info("userid : " + userid);

		// 필요없는 문자열을 제거
		String s_id = userid.substring(0, userid.length() - 1);

		logger.info("s_id : " + s_id);

		// DB에서 입력한 문자열 검색
		SellerVO vo = sellerService.readCheckID(s_id);

		// DB에 있다면 중복...
		if (vo != null) {
			String selectedID = vo.getS_id();
			logger.info("[ " + selectedID + " ] 는 중복된 아이디 입니다...");
			response.getWriter().print(1);
		} else {
			logger.info("사용 가능한 아이디 입니다...^^");
		}
	}

	/*---------------------------------------------------------------------------------*/

	// 이메일 인증번호 발송
	@RequestMapping(value = "seller/checkemail", method = RequestMethod.POST)
	public void sellerCheckEmail(@RequestBody String email, HttpServletResponse response) throws IOException {
		logger.info("email: " + email);

		// @ converted to %40 in HTTPPost request
		String convert_email = URLDecoder.decode(email, "UTF-8");

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
		// model.addAttribute("code", code);

		response.getWriter().print(code);
		// return "email_result";
	}

	/*---------------------------------------------------------------------------------*/

	// 판매자 가입완료 버튼 클릭
	@RequestMapping(value = "seller/s_register_result", method = RequestMethod.POST)
	public String s_register_result(SellerVO vo, HttpServletRequest request) {
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		vo.setS_pw(EncryptUtil.getEncryptMD5(vo.getS_pw()));
		logger.info("판매자 회원가입 버튼 호출 ");
		sellerService.createSeller(vo);
		logger.info("판매자 회원가입 성공! ");
		logger.info("구매자 회원가입 성공! ");
		logger.info("회원 가입된 아이디 : " + vo.getS_id());

		HttpSession session = request.getSession();
		session.setAttribute("s_login_id", vo.getS_id());
		return "redirect:/seller/main";
	}

	/*---------------------------------------------------------------------------------*/
	
	/////////////////////// 판매자 로그인 관려 처리

	@RequestMapping(value = "seller/login", method = RequestMethod.GET)
	public String openSellerRegister() {
		return "/sudo_loginSelect";
	}
	@RequestMapping(value="loginFail", method=RequestMethod.GET)
	public String openSellerLogin(){
		return "common/sudo_loginForSeller";
	}

	@RequestMapping(value = "seller/login", method = RequestMethod.POST)
	public String sellerloginResult(String s_id, String s_pw, HttpServletRequest request, String query) {
		logger.info("login 컨트롤러 실행");
		s_pw = EncryptUtil.getEncryptMD5(s_pw);
		logger.info("s_id : " + s_id + " , s_pw : " + s_pw);
		HttpSession session = request.getSession();
		if (sellerService.isValidUser(s_id, s_pw)) {
			logger.info("인증 성공! ACC 확인 중");
			if (sellerService.isAccConf(s_id, s_pw)){
				logger.info("ACC 확인 성공 ! 로그인 성공!");
				session.setAttribute("s_login_id", s_id);
				logger.info("세션 저장 성공! key:login_id, 값 : " + s_id);
				session.removeAttribute("b_login_id");
				logger.info("seller/main 으로 이동~");
				logger.info("로그인 결과를 세션에 저장합니다.. ");
				session.setAttribute("login_result", sellerService.isValidUser(s_id, s_pw));
				return "redirect:main";
			} else {
				logger.info("ACC 확인 실패");
				session.setAttribute("loginFail", "acc");
				logger.info("login 화면 다시 로드");
				return "redirect:../loginFail";
			}
		} else {
			logger.info("로그인 실패");
			session.setAttribute("loginFail", "fail");
			logger.info("login 화면 다시 로드");
			return "redirect:../loginFail";
		}
	}

	/*---------------------------------------------------------------------------------*/
	
	@RequestMapping(value = "seller/logout", method = RequestMethod.GET)
	public String sellerlogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		logger.info("세션 비우기 성공!");
		return "redirect:../"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}
	
	@RequestMapping(value = "admin/logout", method = RequestMethod.GET)
	public String adminlogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		logger.info("세션 비우기 성공!");
		return "redirect:../"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}
	///////////////////////////////////////////////////////////////////////////////////////// 비로그인
	///////////////////////////////////////////////////////////////////////////////////////// 공통

	/*
	 * @RequestMapping(value="pDetail", method=RequestMethod.GET) public String
	 * productDetail(int p_no, String s_id, String p_name, Integer page, QnaVO
	 * vo, Model model, HttpServletRequest request) { // 상품 번호에 의한 각 상품의 전체 정보
	 * 받아오기 ProductVO pVo = sellerService.readItemByPno(p_no); // 전체 정보를 Model
	 * 객체에 넣어서 View(jsp)에 전달 model.addAttribute("productVO", pVo);
	 * 
	 * // 옵션 정보를 받아오기 List<OptionVO> optionList =
	 * sellerService.readOpByPno(p_no); // 받아온 옵션 정보를 Model 객체에 넣어서 View(jsp)에
	 * 전달 model.addAttribute("optionList", optionList);
	 * 
	 * // 이미지 정보를 받아오기 List<ImageVO> imageList =
	 * sellerService.readImgByPno(p_no); // 받아온 이미지 정보를 Model 객체에 넣어서 View(jsp)에
	 * 전달 model.addAttribute("imageList", imageList);
	 * 
	 * s_id = pVo.getS_id(); SellerVO sVo = sellerService.readSellerInfo(s_id);
	 * // 판매자 정보를 Model 객체에 넣어서 View(jsp)에 전달 model.addAttribute("sVo", sVo);
	 * 
	 * //System.out.println("qnrController"); // 페이지 criteria 생성자 만들기
	 * PageCriteria c = new PageCriteria(); if (page != null){ c.setPage(page);
	 * }
	 * 
	 * List<QnaVO> list = dao.selectQna(p_no);
	 * 
	 * List<QnaRVO> listR = new ArrayList<>(); for(QnaVO volist : list) {
	 * if(volist.getQna_reply() == 1) { QnaRVO rvo = dao.selectQnaR(volist);
	 * listR.add(rvo); } }
	 * 
	 * List<ReviewVO>list1 = daoR.selectRev(p_no); List<ReviewRVO> list2 = new
	 * ArrayList<>(); for(ReviewVO volist : list1) { if(volist.getRev_reply() ==
	 * 1) { ReviewRVO vo1 = daoR.selectRevReply(volist.getRev_no());
	 * list2.add(vo1);
	 * 
	 * } }
	 * 
	 * model.addAttribute("listQnA", list); model.addAttribute("listQnAR",
	 * listR);
	 * 
	 * model.addAttribute("listRev", list1); model.addAttribute("listReply",
	 * list2);
	 * 
	 * // 페이지 메이커 생성 PageMaker maker = new PageMaker(); maker.setCrieria(c);
	 * maker.setTotalCount(dao.getNumOfRecordsQna()); maker.setPageData();
	 * model.addAttribute("pageMaker", maker);
	 * 
	 * // 카테고리 검색해서 연관상품 보여주기 List<ProductVO> relativelist =
	 * productService.selectCate2(pVo.getP_cate2());
	 * model.addAttribute("relativeList", relativelist); return
	 * "visitor/pDetail"; } // end productDetail() -> 판매자 홈에서 상품 번호를 참조해 상품 상세
	 * 페이지로 넘겨주는 역할
	 */

	/*-- 수용 --------------------------------------------------------------------------*/

	@RequestMapping(value = "pDetail", method = RequestMethod.GET)
	public String product_Detail(int p_no, String s_id, String p_name,QnaVO vo, Model model) {

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
		
		// --------------------------------------------------------------------
		// Q&A, Review code
		
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
		
		// --------------------------------------------------------------------
		
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

		return "common/sudo_product_detail";

	} // end productDetail() -> 판매자 홈에서 상품 번호를 참조해 상품 상세 페이지로 넘겨주는 역할

	/*-- 수용 --------------------------------------------------------------------------*/

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

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutt(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		logger.info("세션 비우기 성공!");
		return "redirect:/"; // requestMapping에 login으로 다시 돌아감.. 로그인페이지 열림
	}

	/*----------------------------------------------------------------------------*/
	
	// 맵핑 판매자 홈으로 바꾸고 나중에 쿼리 스트링 넘겨서 각각의 판매자 홈으로 넘어가게 해줘야함
	@RequestMapping(value = "sellerHome", method = RequestMethod.GET) 
	public String sellerHome(Model model, String s_id, HttpServletRequest request) {

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
		
		return "/common/sudo_seller_home";
	} // end sellerHome() -> 판매자 홈에서 상품 리스트를 보여주는 역할
	

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

} // end class HomeController
