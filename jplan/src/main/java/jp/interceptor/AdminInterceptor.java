package jp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	private Logger log = LoggerFactory.getLogger(AdminInterceptor.class);

@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
	System.out.println("admin인터셉터 들어가기 전");
		boolean adminFlag = false;
		System.out.println("adminFlag"+ adminFlag);
		log.debug("{}",adminFlag);
		try {
			System.out.println("if시작전");
			//관리자 의 이름이 admin인 경우
			String admin_power = (String) request.getSession().getAttribute("power");
			System.out.println("권한"+admin_power);
			//if(request.getSession().getAttribute("name").equals("admin")){
			if(admin_power.equals("a")){
					System.out.println("admin인터셉터 들오옴");
					//response.sendRedirect(request.getContextPath()+"/admin/memberlist");
					adminFlag = true;
			}else {
					//로그인페이지로 redirect
				System.out.println("admin 미인증!");
					response.sendRedirect(request.getContextPath()+"/login");	
					adminFlag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//널이 아니면 정상적으로 컨트롤러 호출
		return super.preHandle(request, response, handler);
	}
}
