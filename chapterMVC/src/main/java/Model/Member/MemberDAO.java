package Model.Member;

import java.sql.*;
import java.util.ArrayList;

import DBPKG.Util;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//회원 한사람에 대한 정보를 저장하는 메소드를 만든다.
	public void insertMember(MemberDTO mdto) {
		
		try {
			 con = Util.getConnection();
			 //쿼리준비
			 String sql ="insert into member values(?,?,?,?,?,?,?,?)";
			 //쿼리실행할 객체 선언
			 pstmt = con.prepareStatement(sql);
			 //?에 대입
			 pstmt.setString(1, mdto.getId());
			 pstmt.setString(2, mdto.getPass());
			 pstmt.setString(3, mdto.getEmail());
			 pstmt.setString(4, mdto.getTel());
			 pstmt.setString(5, mdto.getHobby());
			 pstmt.setString(6, mdto.getJob());
			 pstmt.setString(7, mdto.getAge());
			 pstmt.setString(8, mdto.getInfo());
			 
			 //쿼리실행
			 pstmt.executeUpdate();
			 
			 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
	}
	
	//------------------------------------------------
	//모든 회원의 정보를 리턴하는 메소드 작성
	public ArrayList<MemberDTO> getAllMember(){
		
		// 리턴타입 선언한다.
		ArrayList<MemberDTO> m = new ArrayList<MemberDTO>();
		
		try {
			 con = Util.getConnection();
			 //쿼리준비
			 String sql ="select * from member";
			 //쿼리실행할 객체 선언
			 pstmt = con.prepareStatement(sql);
			 
			 //쿼리실행
			 rs = pstmt.executeQuery();
             //반복문을 돌려서 회원정보를 저장한다.
			 while(rs.next()) {
				 MemberDTO mdto = new MemberDTO();
				 mdto.setId(rs.getString(1));
				 mdto.setPass(rs.getString(2));
				 mdto.setEmail(rs.getString(3));
				 mdto.setTel(rs.getString(4));
				 mdto.setHobby(rs.getString(5));
				 mdto.setJob(rs.getString(6));
				 mdto.setAge(rs.getString(7));
				 mdto.setInfo(rs.getString(8));
				 //ArrayList에 MemberDTO를 저장한다.
				 m.add(mdto);
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return m;
	}
	
	
	//------ 한사람의 id만 select 하여 가져오기
	public String getId(String id) {
		
		String chkId = null;
		
		try {
			 con = Util.getConnection();
			 //쿼리준비
			 String sql ="select id from member where id=?";
			 //쿼리실행할 객체 선언
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1,id);
			 
			 //쿼리실행
			 rs = pstmt.executeQuery();
            //반복문을 돌려서 회원정보를 저장한다.
			 if(rs.next()) {
				 chkId = rs.getString(1);
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return chkId;
	}
	
	// ----------------------------------------
}
