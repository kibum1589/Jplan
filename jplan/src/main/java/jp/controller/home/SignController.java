package jp.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.bean.Member;
import jp.model.MemberDao;


@Controller
public class SignController {
	@Autowired
	private MemberDao memberDao;
	@RequestMapping("/sign")
	public String sign() {
		return "sign";
	}

	@RequestMapping(value = "/sign", method = RequestMethod.POST)
	public String sign(Member member) throws Exception {
		memberDao.sign(member);
		return "redirect:/";
	}
}
