package simcom;


import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

/* 로그인 클래스 */
public class HLoginManager {
	// 로그인 변수
	static Member login;
	// 로그인처리 메서드
	// HttpSession : 접속 관리 객체,  jsp 기본객체, 각브라우저의 접속을 구분해서 관리하는 객체
	// application : javax.servlet.ServletContext
	// 전체웹 애플리케이션 관리 객체
	public static Member loginProc(HttpSession session, Member mem) throws SQLException {
		// 아이디/비번가져오기
		String sql = String.format("SELECT * FROM MEMBER WHERE MID='%s' AND MPWD='%s'", 
				mem.MID, mem.MPWD);
		System.out.println(sql);
		// 로그인 판단
		ResultSet rs = Cdb.executeQuery(sql);
		if (rs.next()) {
			login = new Member();
			login.setMID(rs.getString("MID"));
			login.setMNAME(rs.getString("MNAME"));
			
			login.setAUCODE(rs.getInt("AUCODE"));
			// 세션
			session.setAttribute("login", login);
			
			// 로그인을 의미함.: session.setAttribute("login", login)
			// 로그아웃을 의미함.: session.setAttribute("login", null)
			return login;
		}
		return null;
	}
	
	// 로그아웃처리 메서드
	public static void loginOutProc(HttpSession session) throws SQLException {
		session.setAttribute("login", null);
	}


}











