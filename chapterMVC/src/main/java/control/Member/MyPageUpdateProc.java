package control.Member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Member.MemberDAO;
import Model.Member.MemberDTO;

/*
 * MyPage 화면에서 [수정하기] 버튼을 누르면 실행되는 서블릿
 * 역할 : 폼에서 넘어온 값을 받아서 DB의 회원정보를 수정한다.
 */

// 이 서블릿을 "MyPageUpdate.do" 주소로 호출할 수 있게 등록 (MyPage.jsp 의 form action 과 같아야 함)
@WebServlet("/MyPageUpdate.do")
public class MyPageUpdateProc extends HttpServlet {

	// GET 방식 요청 : 주소창에 직접 입력하거나 링크로 들어온 경우
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정은 POST 로만 처리 (주소창 직접 접근 시 MyPage 로 이동)
		response.sendRedirect("MyPage.do");
	}

	// POST 방식 요청 : MyPage.jsp 의 <form method="post"> 로 들어온 경우
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response); // 실제 처리는 reqPro 메소드에서 한다.
	}

	// 실제 회원정보 수정 처리를 하는 메소드
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 한글이 깨지지 않도록 요청 데이터의 인코딩을 UTF-8 로 설정 (getParameter 호출 전에 해야 함)
		request.setCharacterEncoding("utf-8");

		// 1. 로그인 확인
		// getSession(false) : 세션이 이미 있으면 가져오고, 없으면 새로 만들지 않고 null 을 리턴
		HttpSession session = request.getSession(false);

		// 세션이 없으면 null, 있으면 로그인할 때 저장해 둔 "id" 값을 꺼낸다. (Object 타입이라 String 으로 형변환)
		String loginId = (session == null) ? null : (String) session.getAttribute("id");

		// 로그인하지 않은 사용자라면 로그인 화면으로 보내고 처리를 끝낸다.
		if (loginId == null) {
			response.sendRedirect("index.jsp?section=login/loginForm.jsp");
			return; // 아래 코드가 실행되지 않도록 메소드 종료
		}

		// DB 작업을 담당하는 DAO 객체 생성
		MemberDAO mdao = new MemberDAO();

		// 2. 현재 저장된 정보 조회 (id 는 폼 값이 아니라 세션 값을 사용 → 남의 정보 수정 방지)
		// 폼에서 넘어온 id 를 믿으면 악의적으로 다른 사람 id 로 바꿔서 보낼 수 있기 때문에
		// 로그인할 때 서버가 저장해 둔 세션의 id 를 사용한다.
		MemberDTO old = mdao.getOneMember(loginId);

		// DB 에 해당 회원이 없으면(탈퇴 등) 메인 화면으로 보낸다.
		if (old == null) {
			response.sendRedirect("index.jsp");
			return;
		}

		// 3. 비밀번호 : 비워두면 기존 비밀번호 유지, 입력하면 확인 후 변경
		String pass = request.getParameter("pass");       // 새 비밀번호
		String passchk = request.getParameter("passchk"); // 새 비밀번호 확인
		String newPass = old.getPass();                   // 기본값은 기존 비밀번호(변경 안 하는 경우)

		// 새 비밀번호를 입력한 경우에만 변경 절차를 진행한다.
		if (pass != null && !pass.isEmpty()) {
			// 비밀번호와 확인이 다르면 수정하지 않고 에러 표시용 파라미터(result=passfail)와 함께 MyPage 로 돌려보낸다.
			if (!pass.equals(passchk)) {
				response.sendRedirect("MyPage.do?result=passfail");
				return;
			}
			newPass = pass; // 두 값이 같으면 새 비밀번호로 교체
		}

		// 4. 취미 (체크박스 : 하나도 선택 안 하면 null)
		// 체크박스는 여러 개를 동시에 선택할 수 있으므로 getParameterValues 로 배열로 받는다.
		String[] arr = request.getParameterValues("hobby");
		String oneHobby = ""; // 선택한 취미를 하나의 문자열로 합칠 변수

		// 아무것도 선택하지 않으면 arr 가 null 이므로, null 인지 먼저 검사해야 오류가 나지 않는다.
		if (arr != null) {
			for (String hob : arr) {
				oneHobby += hob + " "; // 예) "캠핑 등산 " 형태로 이어 붙인다.
			}
		}

		// 5. 수정할 정보 저장
		// 화면에서 받은 값들을 MemberDTO 객체 하나에 담는다.
		MemberDTO mdto = new MemberDTO();
		mdto.setId(loginId);                                // where 조건에 쓸 아이디 (세션 값)
		mdto.setPass(newPass);                              // 변경한 비밀번호 또는 기존 비밀번호
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setHobby(oneHobby);
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));

		// DAO 의 updateMember 를 호출하여 DB 에 수정 내용을 반영한다. (update 쿼리 실행)
		mdao.updateMember(mdto);

		// 6. PRG 패턴 : redirect 로 MyPage 다시 조회
		// forward 가 아니라 redirect 를 쓰면, 수정 후 새로고침(F5)을 해도 수정 요청이 다시 전송되지 않는다.
		// result=ok 는 MyPage.jsp 에서 "수정되었습니다" 알림을 띄우는 신호로 사용한다.
		response.sendRedirect("MyPage.do?result=ok");
	}
}