package jp.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jp.bean.Block;
import jp.bean.Member;
import jp.bean.PageCalculator;
import jp.model.MemberDao;
import jp.model.MemberEditDao;
import jp.model.MemberInfoDao;
import jp.model.AdminMemberListBlockDao;
import jp.model.BlockDao;

@Controller
public class AdminMemberListBlockController {
	@Autowired
	private BlockDao blockDao;

	@Autowired
	private AdminMemberListBlockDao adminMemberListBlockDao;

	// 자신의 정보를 띄어 주기 위해서
	@RequestMapping(value = "/admin/memberlist_block", method = RequestMethod.GET)
	public String memberlist_block(HttpSession session, int no,String email, Model model) {
		// 세션을 추가해서 이메일로 정보를 받아와서 세션에 등록된 이름을 추가해준다.
		/*
		 * String email=(String)session.getAttribute("email"); Member member=new
		 * Member(email); member=memberDao.infom(member);
		 * session.setAttribute("member",member);
		 */
		model.addAttribute("no", no);
		model.addAttribute("email", email);
		return "admin/memberlist_block";
	}
	@RequestMapping(value = "/admin/memberlist_block", method = RequestMethod.POST)
	public String admin_memberlist_block(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session,String email, int no) throws Exception {
		System.out.println("멤버제제 리스트 들어옴");
		Logger log = LoggerFactory.getLogger(this.getClass());
		log.debug("타입 리퀘스트={}", request);
		String type = request.getParameter("type");
		String reason = request.getParameter("reason");
		int dur = Integer.parseInt(request.getParameter("dur"));
		/* String mguest= */
		// 제제 회원의 정보를 파라미터 로 받아오는 코드 밑에는 편하게 생성하기 위해서 한번에 처리한다.
		Block block = new Block(type, reason, dur);
		/* Member member=adminMemberListBlockDao.powergetno(power); */
		/* int powerno=member.getNo(); */
		/* int mno=member.getNo(); */
		// member 에서 회원의 번호를 가지고 와서 등록 시키기 위해
		// int getmno = no;
		// System.out.println("getmno="+getmno);
		// Member member1=adminMemberListBlockDao.getmno(mno);
		// log.debug("제제를 가하는 넘버{}",member1.getNo());
		// 입력받은 정보를 디비에 넣어주기 위해서
		model.addAttribute("admin_memberlist_block", adminMemberListBlockDao.admin_memberlist_block(block, no, email));
		// 받아온 정보를 바로 띄워 주기 위해서
		PageCalculator pc = new PageCalculator(request);

		int count;
		if (pc.isSearchMode())
			count = blockDao.getCount(pc.getSort(), pc.getKeyword());
		else
			count = blockDao.getCount();

		pc.setCount(count);
		pc.calculate();

		List<Block> list;
		if (pc.isSearchMode()) {
			list = blockDao.find(pc.getSort(), pc.getKeyword(), pc.getSno(), pc.getEno());
		} else {
			list = blockDao.memberBlockList(pc.getSno(), pc.getEno());
		}

		model.addAttribute("pc", pc);
		model.addAttribute("memberblock", count);
		model.addAttribute("memberblocklist", list);
		log.debug("제제성공");
		return "admin/member_block_list";

	}
}
