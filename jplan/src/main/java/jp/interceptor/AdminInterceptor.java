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
		log.debug("admin인터셉터={}",adminFlag);
		String admin_power = (String) request.getSession().getAttribute("power");
		try {
			System.out.println("if시작전");
			//관리자 의 이름이 admin인 경우
			System.out.println("권한"+admin_power);
			//if(request.getSession().getAttribute("name").equals("admin")){
			if(admin_power.equals("a")){
				adminFlag = true;
					System.out.println("admin인터셉터 들오옴");
					//response.sendRedirect(request.getContextPath()+"/admin/memberlist");
			}else {
					//로그인페이지로 redirect
				adminFlag = false;
				System.out.println("admin 미인증!");
					response.sendRedirect(request.getContextPath()+"/login");	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//널이 아니면 정상적으로 컨트롤러 호출
		return super.preHandle(request, response, handler);
	}
}
