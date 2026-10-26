package control.Member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Member.MemberDAO;
import Model.Member.MemberDTO;


@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 베이스에 연결하여 회원의 모든 정보를 리턴
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberDTO> aAll = mdao.getAllMember();
		
		//JSP로 데이터를 떠넘겨주어야 한다.
		request.setAttribute("m", aAll); // aAll을 JSP로 넘겨줌
	
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/MemberList.jsp");
		rd.forward(request, response);
	}

}
