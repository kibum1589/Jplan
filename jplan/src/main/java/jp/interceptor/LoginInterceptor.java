package jp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		try {
			//login 세션값이 널일경우
			String login = (String) request.getSession().getAttribute("email");
			if(login == null ){
					//로그인페이지로 redirect
					response.sendRedirect(request.getContextPath()+"/login");	
					return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//널이 아니면 정상적으로 컨트롤러 호출
		return super.preHandle(request, response, handler);
	}
}


