package simcom;

import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Objects;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

/* 데이터베이스 공통 클래스 */
public class Cdb {
	/* 1. 클래스멤버 변수 */
	static String conUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	static String cId = "TOM";
	static String cPwd = "Tiger86$";
	public static Connection cCon = null;
	
	/* 2. 오라클 연결 */
	public static void conOra() throws Exception {
		  // 1. 드라이버 로딩
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  // 2. 연결객체 생성
		  cCon = DriverManager.getConnection(conUrl, cId, cPwd);
    }
	
	/* 3. 오라클 연결 닫기 */
	public static void disconOra() throws Exception {
		// 1. 연결 종료
		cCon.close();	
	}
	
	/* 4. 프로시저실행 sql, 
	 *    배열과 오라클의 테이블 타입 매개변수의 이름 (CNAME_T), 
	 *    오라클의 데이터 타입 매개변수의 데이터로 사용될 배열 */
	public static void doProcArray(String sql, String pType, String[] strings) {
		try {
			// 가. 오라클 연결
			Cdb.conOra();
			// 나. 배열을 오라클에 전송하도록 처리
			ArrayDescriptor ad = ArrayDescriptor.createDescriptor(pType, Cdb.cCon);
			// 다. 자바배열을 오라클의 테이블과 연동하는 타입으로 변환
			ARRAY ar = new ARRAY(ad, Cdb.cCon, strings);
			// 라. 프로시져 실행
			CallableStatement cs = Cdb.cCon.prepareCall(sql);
			cs.setArray(1, ar);
			// 출력확인
			System.out.println("sql : " + sql);
			System.out.println("pType : " + pType);
			System.out.println("pArr : " + strings.toString());
			// 마. 실행
			cs.execute();
			// 0. 오라클 연결 종료
			Cdb.disconOra();
		}catch (Exception e) {
			System.out.printf("Cdb클래스 doProcArray메서드 예외 : %s (sql : %s)",
					e.getMessage(), sql);
				}
		
    	}
	 
	
	
	/* 일반적인 프로시져 실행 */
	public static void executeProc(String sql) {
		// 가. 오라클연결
		try {
			Cdb.conOra();
			// 나. SQL실행
			Cdb.cCon.prepareCall(sql).execute();
			// 다. 오라클종료
			Cdb.disconOra();
		} catch (Exception e) {
			System.out.printf("Cdb클래스 executeProc메서드 예외 : %s (sql : %s)", 
					e.getMessage(), sql);
		}
	}
	
	/* 일반적인 프로시져 실행 */
	public static CallableStatement returnCallState(String sql) {
		
		try {
			// 가. 오라클연결
			Cdb.conOra();
			// 나. SQL실행
			return Cdb.cCon.prepareCall(sql);
		} catch (Exception e) {
			System.out.printf("Cdb클래스 CallableStatement메서드 예외 : %s (sql : %s)", e.getMessage(), sql);
		}
		
		return null;
	}
	
	/* DML */
	public static void executeUpdate(String sql) {
		try {
		 // 가. 오라클연결
			Cdb.conOra();
		 // 나. DML 실행
			Cdb.cCon.createStatement().executeUpdate(sql);
		 // 0. 오라클연결 종료
			Cdb.disconOra();
		} catch (Exception e) {
			System.out.printf("Cdb executeUpdate() 실행예외 ; %s"
					, e.getMessage());
		}
	}

	public static PreparedStatement returnPs(String sql) {
		try {
			 /* preparestatement : 위치에 값을 할당 */
			 /* 1.데이터베이스 접속 */
			 Cdb.conOra();
			 
			 /* 2.preparestatement로 sql준비 */
			 return Cdb.cCon.prepareStatement(sql);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return null;
	}
	
	/* SELECT */
	public static ResultSet executeQuery(String sql) {
		try {
			 // 가. 오라클연결
				Cdb.conOra();
			 // 나. SELECT 실행
				ResultSet rs = Cdb.cCon.createStatement()
						.executeQuery(sql);
				if (!Objects.isNull(rs)) {
					return rs;
				}
			
		} catch (Exception e) {
			System.out.printf("Cdb executeQuery() 실행예외 ; %s"
					, e.getMessage());
		}
		return null;
	}
	
}














