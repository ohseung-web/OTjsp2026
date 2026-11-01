<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 회원등록, 메시지 체크 변수
	boolean msgChk = false;
	
	// insert.jsp 폼에서 가져온 정보 꺼내오기
	String registMonth = request.getParameter("registMonth");
	String cName = request.getParameter("cName");
	String cNo = request.getParameter("cNo");
	String classArea = request.getParameter("classArea");
	String teacherCode = request.getParameter("teacherCode");
	String tuition = request.getParameter("tuition");
	
	try{
		con = Util.getConnection();
		// sql문 작성
		String sql = "insert into TBL_CLASS_202201 values(?,?,?,?,?)";
		// 쿼리실행
		pstmt = con.prepareStatement(sql);
		// 물음표에 대입
		pstmt.setString(1, registMonth);
		pstmt.setString(2, cNo);
		pstmt.setString(3, classArea);
		pstmt.setString(4, tuition);
		pstmt.setString(5, teacherCode);
		
		// 1이면 실행 / 0 이면 실패
		// 0보다 크면 true
		msgChk = pstmt.executeUpdate() > 0;
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}catch(Exception e){e.printStackTrace();}
	}
%>
<script>
	// true이면 회원등록 성공 / false면 회원실패 안내
	<% if(msgChk){%>
			alert("수강신청이 정상적으로 완료되었습니다!");
			location.href="index.jsp";
	<% }else { %>
			alert("수강신청이 실패하였습니다.");
			history.go(-1);
	<% } %>
</script>
