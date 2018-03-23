package jp.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlockController {

	@RequestMapping("/admin/member_block_list")
	public String memberblocklist() {
		return "admin/member_block_list";
	}
	
}
