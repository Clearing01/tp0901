package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NovelDAO;
import vo.NovelVO;

public class NovelBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		
		vo.setNid(Integer.parseInt(request.getParameter("nid"))); // 소설 번호
		vo = dao.selectOne_N(vo); // 소설 상세 정보
		
		if(vo != null) {
			request.setAttribute("data", dao.selectOne_N(vo));
			forward=new ActionForward();
			forward.setPath("/novelBoard.jsp");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("novelSelectOne 오류");
		}
			
		return forward;
	}
}
