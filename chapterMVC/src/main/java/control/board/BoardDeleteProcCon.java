package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.board.BoardDAO;


@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자로 부터 넘어온 데이터 3개만 받는다.
		int num = Integer.parseInt(request.getParameter("num"));
        String userPw = request.getParameter("userPw");
        String dbPw = request.getParameter("dbPw");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if(userPw != null && userPw.equals(dbPw)) {
            // 비밀번호가 일치하는 경우 소프트 삭제 실행
            BoardDAO bdao = new BoardDAO();
            bdao.deleteBoard(num); // chkDel = 1로 업데이트 됨
            
            // F5 새로고침 중복 방지를 위한 sendRedirect 적용
            response.sendRedirect("BoardListCon.do");

        } else {
            // 비밀번호가 틀린 경우 alert 창 띄우고 이전 페이지로 이동
            out.println("<script>");
            out.println("alert('비밀번호가 일치하지 않습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.flush();
        }
	}

}
