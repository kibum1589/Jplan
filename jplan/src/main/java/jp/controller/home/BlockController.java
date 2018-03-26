package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.bean.Block;
import jp.bean.PageCalculator;
import jp.bean.Plan;
import jp.model.BlockDao;

@Controller
public class BlockController {
	
	@Autowired
	private BlockDao blockDao;
	
	//제제 회원 리스트 보기
	@RequestMapping("/admin/member_block_list")
	public String memberblocklist(Model model, HttpServletRequest request) throws Exception {
		//PageCalculator를 이용하여 페이징 계산을 간편하게 처리
    	PageCalculator pc = new PageCalculator(request);
    	
   	 	int count;
		if(pc.isSearchMode())
			count = blockDao.getCount(pc.getSort(), pc.getKeyword());
		else
			count = blockDao.getCount();
		
		pc.setCount(count);
		pc.calculate();
	 	
		List<Block> list;
		if(pc.isSearchMode()){
			list = blockDao.find(pc.getSort(), pc.getKeyword(), pc.getSno(), pc.getEno()); 
		}
		else{
			list = blockDao.memberBlockList(pc.getSno(), pc.getEno()); 
		}
		
		model.addAttribute("pc", pc);
		model.addAttribute("memberblock", count);
		model.addAttribute("memberblocklist", list);
		return "admin/member_block_list";
	}
	
}
