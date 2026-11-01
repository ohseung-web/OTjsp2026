package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.board.BoardDAO;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        // 폼에서 넘어온 데이터를 받아옴
        int num = Integer.parseInt(request.getParameter("num"));
        String userPw = request.getParameter("userPw");
        String dbPw = request.getParameter("dbPw");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // userPw와 dbPw값을 비교
        if(userPw.equals(dbPw)) { // 패스워드가 같다면 데이터 수정
         
        	BoardDAO bdao = new BoardDAO();
            bdao.updateBoard(num, subject, content);
            
            // F5 새로고침 중복 전송 방지를 위해 sendRedirect 사용
            response.sendRedirect("BoardListCon.do");

        } else { 
            // 비밀번호가 틀리다면 이전페이지로 이동 시킴
        	// 비밀번호가 틀리다면 alert 창을 띄우고 이전 페이지로 이동
            out.println("<script>");
            out.println("alert('비밀번호가 일치하지 않습니다.');");
            out.println("history.go(-1);"); // 이전 수정 페이지로 돌아감
            out.println("</script>");
            out.flush();
			
        }
    }
	

}
