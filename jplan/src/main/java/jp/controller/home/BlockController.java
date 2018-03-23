package jp.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.model.BlockDao;

@Controller
public class BlockController {
	
	@Autowired
	private BlockDao blockDao;

	@RequestMapping("/admin/member_block_list")
	public String memberblocklist(Model model) throws Exception {
		model.addAttribute("memberblocklist", blockDao.memberBlockList());
		return "admin/member_block_list";
	}
	
}
