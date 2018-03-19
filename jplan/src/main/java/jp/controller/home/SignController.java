package jp.controller.home;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jp.bean.Member;
import jp.model.MemberDao;


@Controller
public class SignController {
	@Autowired
	private MemberDao memberDao;
	@RequestMapping(value="sign",method=RequestMethod.GET)
	public String sign() {
		return "sign";
	}
	
	@RequestMapping(value="sign",method=RequestMethod.POST)
	public String register(Member member) throws Exception {
		boolean result = memberDao.sign(member);
		
		if(result) return "home";  //가입 성공했을때
		else return "sign"; // 가입 실패했을떄
	}
	
	@RequestMapping(value="signcheck",method=RequestMethod.POST)
	public void sign(String email, HttpServletResponse res) throws Exception{
		Logger log = LoggerFactory.getLogger(this.getClass());
		log.info("들어옴");
		//int result1 = memberDao.check(email);
		boolean result = memberDao.check(email);
		PrintWriter writer = res.getWriter();
		
		if(result) {
			writer.write("1");//불가능
		}else {
			writer.write("0");//가능
		}
			writer.close();
	}
}