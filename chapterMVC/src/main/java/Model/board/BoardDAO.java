package Model.board;

import java.sql.*;
import java.util.ArrayList;

import DBPKG.Util;
import Model.Member.MemberDTO;

public class BoardDAO {
    
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//회원 한사람에 대한 정보를 저장하는 메소드를 만든다.
		public int getAllCount() {
	
			//게시글 전체수를 저장하는 변수
			int count =0;

			try {
				con = Util.getConnection();
				//쿼리준비
				String sql="select count(*) from board ";
				//쿼리를 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				//쿼리 실행후 결과를 리턴
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt(1);//전체게시글수
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
			
			return count;
		}
		
		//--------------------------------------------------
		// 화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드
		public ArrayList<BoardDTO> getAllBoard(int startRow, int pageSize) {
			
			ArrayList<BoardDTO> a = new ArrayList<BoardDTO>();

			try {
				con = Util.getConnection();
				//쿼리준비
				// 쿼리준비: limit [시작위치], [가져올개수]
				String sql="select * from board limit ?, ? ";
				//쿼리를 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				//쿼리 실행후 결과를 리턴
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					BoardDTO bdto = new BoardDTO();
					bdto.setNum(rs.getInt(1));
					bdto.setWriter(rs.getString(2));
					bdto.setEmail(rs.getString(3));
					bdto.setSubject(rs.getString(4));
					bdto.setPassword(rs.getString(5));
					bdto.setReg_date(rs.getString(6));
					bdto.setRef(rs.getInt(7));
					bdto.setRe_step(rs.getInt(8));
					bdto.setReadcount(rs.getInt(9));
					bdto.setContent(rs.getString(10));
					bdto.setId(rs.getString(11));
					
					//패키징한 데이터를 ArrayList에 저장
					a.add(bdto);
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
			
			return a;
		}
}
