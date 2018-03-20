package jp.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberListController {

	@RequestMapping("/admin/memberlist")
	public String memberlist() {
		return "admin/memberlist";
	}
}
