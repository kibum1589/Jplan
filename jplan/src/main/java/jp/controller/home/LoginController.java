package jp.controller.home;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Member;
import jp.model.MemberDao;

@Controller
public class LoginController {
	
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logincheck")
    public ModelAndView logincheck(Member member ,HttpSession session) throws Exception {
    		System.out.println("pw");
			boolean result = memberDao.loginDAO(member);
			
			if(result){
				Member member_info = memberDao.infom(member);
				
				//세션에 로그인 성공
				session.setAttribute("email", member_info.getEmail());
				session.setAttribute("name", member_info.getName());
				
				ModelAndView mv = new ModelAndView();
				mv.setViewName("login");
				mv.addObject("msg", "success");
				return mv;
			}
			else{
				ModelAndView mv = new ModelAndView();
				mv.setViewName("login");
        		mv.addObject("msg", "failure");
				return mv;
			}
			
    }  
    

	
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){
    	session.invalidate();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        mv.addObject("msg", "logout");
        return mv;
    }
}

