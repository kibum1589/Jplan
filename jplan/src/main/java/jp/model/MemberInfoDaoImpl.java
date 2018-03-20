package jp.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import jp.bean.Member;

@Controller
@Repository("MemberInfoDao")
public class MemberInfoDaoImpl {
		
		private Logger log = LoggerFactory.getLogger(getClass());
		
		private JdbcTemplate jdbcTemplate;
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/memberinfo");
		mv.addObject("member");
		return mv;
	}
}
