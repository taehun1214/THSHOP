package com.online.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.online.shop.domain.BuyerVO;

//login-post 콘트롤러 메소드 실행 전/후에 동작할 인터셉터
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	// 콘트롤러 메소드 수행 후, View가 완성되기 전에 호출되는 메소드
	// -> View(JSP)에 전달할 데이터, 세션 속성 등을 설정할 수 있음
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("Logininterceptor postHandle() 호출...");
		// 로그인 정보를 세션에 저장하기 위해서 미리정의
		HttpSession session = request.getSession();
		Object result = session.getAttribute("login_result");
		if(result!=null){
		if ((boolean)result!=false){
			logger.info("새로운 로그인 성공");
			Object dest = session.getAttribute("dest");
			if (dest != null) {
				logger.info("dest 있음");
				response.sendRedirect((String) dest);
			} else {
				logger.info("dest 없음");
				// 저장된 요청 주소가 없는 경우에는 홈페이지로 이동
				response.sendRedirect("/shop/buyer/main"); // 메인페이지로 리다이렉트	
			}

		} else {
			
		}
		
		}
	} // end postHandle()
	
} // end class loginInterceptor
