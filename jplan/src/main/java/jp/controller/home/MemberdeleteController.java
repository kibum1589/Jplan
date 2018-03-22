package jp.controller.home;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import jp.model.MemberDeleteDao;

public class MemberdeleteController  implements Controller{
	
	@RequestMapping("/admin/memberdelete")
	public String memberdelete() {
		return "admin/memberdelete";
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

/*	private MemberDeleteDao MemberDeleteDao;
	public void setMemberDao(MemberDeleteDao MemberDeleteDao) {
		this.MemberDeleteDao = MemberDeleteDao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			ModelAndView mv = new ModelAndView("/WEB-INF/view/admin/memberdelete.jsp");
			return mv;
		}
		else if(request.getMethod().equalsIgnoreCase("post")) {
			//exit_pro.jsp와 비슷한 절차를 거침
			//[1] 파라미터 수신
			String deleteEmail = request.getParameter("email");
			String pw = request.getParameter("pw");
			
			String Email = (String)request.getSession().getAttribute("accept");
			
			//[2] 로그인 검사 후 deleteEmail 회원 삭제
			if(MemberDeleteDao.login(Email, pw)){
				MemberDeleteDao.exit(deleteEmail);
			}
			
			//[3] 리스트 페이지로 되돌아가기
			ModelAndView mv = new ModelAndView("redirect:home");
			return mv;
		}
		
		throw new Exception("처리 불가");*/
	//}

}