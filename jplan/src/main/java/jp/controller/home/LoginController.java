package jp.controller.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Member;
import jp.model.BlockDao;
import jp.model.MemberDao;

@Controller
public class LoginController {
	
	private Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BlockDao blockDao;
	
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
				String blockmsg = blockDao.check(member_info.getNo());
				
				//세션에 로그인 성공
				if(blockmsg==null) {
					session.setAttribute("email", member_info.getEmail());
					session.setAttribute("name", member_info.getName());
					session.setAttribute("no", member_info.getNo());
					session.setAttribute("power", member_info.getPower());
					log.debug("login했을떄 no = {}",member_info.getNo());
					log.debug("login했을떄 power = {}",member_info.getPower());
					ModelAndView mv = new ModelAndView();
					mv.setViewName("login");
					mv.addObject("msg", "success");
					return mv;
				}
				
				// 제제당함
				else {
					ModelAndView mv = new ModelAndView();
					mv.setViewName("login");
	        		mv.addObject("blockmsg", blockmsg);
					return mv;
				}
				
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

