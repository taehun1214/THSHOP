package com.online.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.service.ProductService;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
@RequestMapping(value="/seller")
public class ProductController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductController.class);
	
	@Autowired 
	ProductService productService;
	
	@RequestMapping(value="pRegister", method=RequestMethod.GET)
	public String pRegisterGET() {
		return "seller/sudo_product_register";
	} // end registerGET()
	
	@RequestMapping(value="pRegister", method=RequestMethod.POST)
	public String pRegisterPOST(ProductVO pVo, String[] o_title, String[] o_cont, int[] o_stock, 
			String[] i_img, String[] i_cont) {
		
		// 서비스 객체를 사용해서 DB insert
		
		// 상품 정보 insert
		logger.info("p_name: " + pVo.getP_name());
		
		int pResult = productService.createProduct(pVo);
		
		// 상품의 상품번호 받아오기
		int pno = productService.readProductNo(pVo.getS_id());
		logger.info("p_no: " + pno);
		
		// 옵션 정보 insert
		logger.info("o_title: " + o_title);
		
		for (int i = 0; i < o_title.length; i++) {
			
			OptionVO oVo = new OptionVO();
			
			oVo.setO_title(o_title[i]);
			oVo.setO_cont(o_cont[i]);
			oVo.setO_stock(o_stock[i]);
			oVo.setP_name(pVo.getP_name());
			oVo.setS_id(pVo.getS_id());
			oVo.setP_no(pno);
			
			int oResult = productService.createOption(oVo);
		}
		
		// 이미지 정보 insert
		logger.info("i_img: " + i_img);
		
		for (int i = 0; i < i_img.length; i++) {
			ImageVO iVo = new ImageVO();
			iVo.setI_img(i_img[i]);
			iVo.setI_cont(i_cont[i]);
			iVo.setP_name(pVo.getP_name());
			iVo.setS_id(pVo.getS_id());
			iVo.setP_no(pno);
			
			int iResult = productService.createImage(iVo);
		}
		
		return "redirect:sellerHome?s_id=" + pVo.getS_id();
		
	} // end registerPOST()
	
	@RequestMapping(value="pUpdate", method=RequestMethod.GET)
	public String pUpdateGET(int p_no, Model model) {
		logger.info("pUpdateGET() 호출: p_no = " + p_no);
		
		// 해당 상품 번호로 상품 상세 정보 검색
		ProductVO pVo = productService.readProductByPno(p_no);
		List<OptionVO> optionList = productService.readOptionByPno(p_no);
		List<ImageVO> imageList = productService.readImageByPno(p_no);
		int imgListSize = imageList.size();
		
		logger.info("이미지 리스트 사이즈: " + imgListSize);
		
		// DB에서 검색한 내용을 Model 객체에 attribute로 추가
		model.addAttribute("productVO", pVo);
		model.addAttribute("optionList", optionList);
		model.addAttribute("imageList", imageList);
		model.addAttribute("imgListSize", imgListSize);
		
		return "seller/sudo_product_update";
	}
	
	@RequestMapping(value="pUpdate", method=RequestMethod.POST)
	public String pUpdatePOST(ProductVO pVo, int p_no, String[] o_title, String[] o_cont, int[] o_stock, 
			String[] i_img, String[] i_cont) {
		logger.info("pUpdatePOST() 호출: p_no = " + p_no);
		
		int pUpdateResult = productService.updateProductByPno(pVo);
		
		int oDelete = productService.deleteOptionByPno(p_no);
		int iDelete = productService.deleteImageByPno(p_no);
		
		for (int i = 0; i < o_title.length; i++) {
			
			OptionVO oVo = new OptionVO();
			
			oVo.setO_title(o_title[i]);
			oVo.setO_cont(o_cont[i]);
			oVo.setO_stock(o_stock[i]);
			oVo.setP_name(pVo.getP_name());
			oVo.setS_id(pVo.getS_id());
			oVo.setP_no(p_no);
			
			int oResult = productService.createOption(oVo);
		}
		
		for (int i = 0; i < i_img.length; i++) {
			ImageVO iVo = new ImageVO();
			iVo.setI_img(i_img[i]);
			iVo.setI_cont(i_cont[i]);
			iVo.setP_name(pVo.getP_name());
			iVo.setS_id(pVo.getS_id());
			iVo.setP_no(p_no);
			
			int iResult = productService.createImage(iVo);
		}	
		
		return "redirect:sellerHome?s_id=" + pVo.getS_id();
	}
	
	@RequestMapping(value="pDelete", method=RequestMethod.POST)
	public String pDelete(int p_no, RedirectAttributes attr, HttpServletRequest request) {
		logger.info("pDelete() 호출 : p_no = " + p_no);
			
			int oResult = productService.deleteOptionByPno(p_no);
			int iResult = productService.deleteImageByPno(p_no);
			int pResult = productService.deleteProductByPno(p_no);
			
			HttpSession session = request.getSession();
			
			Object id = session.getAttribute("s_login_id");
			String s_id = (String) id;
		
//		if (oResult == 1 && iResult == 1 && pResult == 1) {
//			attr.addFlashAttribute("delete_result", "success");
//		} else {
//			attr.addFlashAttribute("delete_result", "fail");
//		}
		attr.addFlashAttribute("p_no", p_no);
		
		return "redirect:sellerHome?s_id=" +s_id;
	}

} // end class ProductController 
