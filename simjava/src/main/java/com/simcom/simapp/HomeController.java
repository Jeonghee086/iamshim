package com.simcom.simapp;

import java.io.File;
import java.io.IOException;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import simcom.Conven;
import simcom.HLoginManager;
import simcom.H_owner;
import simcom.House;
import simcom.Member;
import simcom.Reservation;
import simcom.Share_house;

@Controller
public class HomeController {

	/* 서버메모리객체에 생성한 것을 자동할당받는 것 : Autowired */
	@Autowired 
	ServletContext context;
	@Resource(name = "sqlSession")
	private SqlSession se;
	private String ns = "com.simcom.simapp.StartMapper";

	// ns-> namespace / 멥퍼의 네임스페이스
	// 실행할 때는 com.mcom.mapp.StartMapper.start_insert
	/* 네임스페이스 + 쿼리id 로 리턴하는 메서드 (합쳐주는 함수 만들기) */
	private String rtnNsid(String id) {
		return String.format("%s.%s", ns, id);
	}

	@RequestMapping(value = "/mymem2", method = RequestMethod.GET)
	public String mymem2(Model m, int HCODE) {
		List<Map<String, Object>> rdate = se.selectList(rtnNsid("select_rdate"), HCODE);
		m.addAttribute("rdate", rdate);
		return "mymem2";
	}

	/* 로그인----------------------------------------------------------------------------*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model m) {
		return "login";
	}
	/* 로그인요청 */
	@RequestMapping(value = "/loginProces", method = RequestMethod.POST)
	public String loginProces(Member mem, HttpSession session, HttpServletRequest request) {
		// 로그인처리
		try {
			HLoginManager.loginProc(session, mem);
		} catch (SQLException e) {
			// 로그인 안됨처리
			session.setAttribute("mem", null);
			// 예외메세지
			System.out.println("HomeController loginProces : " + e.getMessage());
		}
		// 리턴
		return "home";
	}
	/* 로그아웃요청 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		try {
			HLoginManager.loginOutProc(session);
		} catch (SQLException e) {
			System.out.println("HomeController logout : " + e.getMessage());
		}
		// 리턴
		return "home";
	}
	
	
	/*  결제-------------------------------------------- */	
	/* before update_rsvend */
	@RequestMapping(value = "/rsvpayment", method = RequestMethod.GET)
	public String rsvpayment(int RCODE, Model m) {
		m.addAttribute("RCODE", RCODE);
		int pri = se.selectOne(rtnNsid("select_rprice"), RCODE);
		m.addAttribute("pri", pri);
		return "rsvpayment";
	}	
	/* update_rsvend */
	@RequestMapping(value = "/update_rsvend", method = RequestMethod.POST)
	public String update_rsvend(Reservation rsv, Model m, String MID, String HOID ) {
		se.update(rtnNsid("update_rsvend"), rsv);
		List<Map<String, Object>> hst = se.selectList(rtnNsid("select_hview"), HOID);
		m.addAttribute("hst", hst);
		List<Map<String, Object>> gst = se.selectList(rtnNsid("select_gview"), MID);
		m.addAttribute("gst", gst);
		return "mymem";
	}
		
	/* 결제내역 조회-------------------------------------------- */
	@RequestMapping(value = "/rsvrecipt", method = RequestMethod.GET)
	public String rsvrecipt(int RCODE, Model m) {
		List<Map<String, Object>> reci = se.selectList(rtnNsid("select_recipt"), RCODE);
		m.addAttribute("reci", reci);
		
		return "rsvrecipt";
	}



	/* 숙소 예약요청 후 마이페이지에서 확인가능--------------------------------------------- */
	/* start_rsv */
	@RequestMapping(value = "/start_rsv", method = RequestMethod.POST)
	public String start_rsv(Reservation rsv, Model m, int SHCODE, 
			 int res, int HPPLNUM, int RPRICE, String RCHECKIN, String RCHECKOUT) {
		m.addAttribute("SHCODE", SHCODE);
		m.addAttribute("res", res);
		m.addAttribute("HPPLNUM", HPPLNUM);
		m.addAttribute("RPRICE", RPRICE);
		m.addAttribute("RCHECKIN", RCHECKIN);
		m.addAttribute("RCHECKOUT", RCHECKOUT);
		return "rsvinsert";
	}
	/* insert_rsv */
	@RequestMapping(value = "/insert_rsv", method = RequestMethod.POST)
	public String insert_rsv(Reservation rsv, Model m, String MID, String HOID) {
		se.insert(rtnNsid("insert_rsv"), rsv);
		
		List<Map<String, Object>> hst = se.selectList(rtnNsid("select_hview"), HOID);
		m.addAttribute("hst", hst);
		List<Map<String, Object>> gst = se.selectList(rtnNsid("select_gview"), MID);
		m.addAttribute("gst", gst);
		
		return "mymem";
	}	
	
	
	/* 호스트정보 및 숙소정보 수정--------------------------------------------------------	 */
	/* 호스트 정보 수정페이지 */
	@RequestMapping(value = "/mymodi", method = RequestMethod.GET)
	public String mymodi(Model m, String HOID) {
		List<Map<String, Object>> b = se.selectList(rtnNsid("h_b"));
		m.addAttribute("b", b);
		List<Map<String, Object>> mho = se.selectList(rtnNsid("modi_ho"), HOID);
		m.addAttribute("mho", mho);
		return "mymodi";
	}
	/* 숙소 정보 수정페이지 */
	@RequestMapping(value = "/mymodih", method = RequestMethod.GET)
	public String mymodih(Model m, String HOID) {
		List<Map<String, Object>> mh = se.selectList(rtnNsid("modi_h"), HOID);
		m.addAttribute("mh", mh);
		return "mymodih";
	}	
	/* 상세숙소 정보 수정페이지 */
	@RequestMapping(value = "/mymodihdetail", method = RequestMethod.GET)
	public String mymodihdetail(Model m, int HCODE) {
		List<Map<String, Object>> mhdetail = se.selectList(rtnNsid("modi_hdetail"), HCODE);
		m.addAttribute("mhdetail", mhdetail);
		return "mymodihdetail";
	}
	/* 호스트 정보 수정 */
	@RequestMapping(value = "/mo_ho", method = RequestMethod.POST)
	public String mo_ho(H_owner ho, Model m, String HOID) {
		se.update(rtnNsid("mo_ho"), ho);
		return "redirect:/mymodi?HOID=" + HOID;
	}
	/* 숙소 정보 삭제 */
	@RequestMapping(value = "/upmymodih", method = RequestMethod.GET)
	public String upmymodih(House h, Model m, String HOID) {
		se.update(rtnNsid("update_h"), h);
		return "redirect:/mymodih?HOID=" + HOID;
	}
	/* 상세숙소 정보 수정 */
	@RequestMapping(value = "/mo_h", method = RequestMethod.POST)
	public String mo_h( House h, String HOID, int HCODE) {
		se.update(rtnNsid("mo_h"), h);
		return "redirect:/mymodihdetail?HOID=" + HOID + "&HCODE=" + HCODE;
	}
	
	
	
	/* 마이페이지 ---------------------------------------------------------------------	 */
	@RequestMapping(value = "/myadmin", method = RequestMethod.GET)
	public String myadmin(Model m) {
		List<Map<String, Object>> adh = se.selectList(rtnNsid("add_hview"));
		m.addAttribute("adh", adh);
		List<Map<String, Object>> adpri = se.selectList(rtnNsid("addend_hview"));
		m.addAttribute("adpri", adpri);
		
		return "myadmin";
	}
	@RequestMapping(value = "/mymem", method = RequestMethod.GET)
	public String mymem(Model m, Reservation rsv , String MID, String HOID) {
	
		List<Map<String, Object>> hst = se.selectList(rtnNsid("select_hview"), HOID);
		m.addAttribute("hst", hst);
		List<Map<String, Object>> gst = se.selectList(rtnNsid("select_gview"), MID);
		m.addAttribute("gst", gst);
		return "mymem";
	}
	
	@RequestMapping(value = "/mymemup", method = RequestMethod.GET)
	public String mymemup(Model m, Reservation rsv , String MID, String HOID) {
		se.update(rtnNsid("update_rsv"), rsv);
		return "redirect:/mymem?HOID=" + HOID + "&MID=" + MID;
	}
	@RequestMapping(value = "/mymemdel", method = RequestMethod.GET)
	public String mymemm(Model m, Reservation rsv , String MID, String HOID) {
		se.delete(rtnNsid("delete_rsv"), rsv);		
		return "redirect:/mymem?HOID=" + HOID + "&MID=" + MID;
	}

	/* 숙소조회------------------------------------------------------------------*/
	@RequestMapping(value = "/select_house", method = RequestMethod.GET)
	public String select_house(Model m, int res, String CITYNAME, int HPPLNUM,
			 String HOID) {
		m.addAttribute("CITYNAME", CITYNAME);
		m.addAttribute("HPPLNUM", HPPLNUM);
		m.addAttribute("res", res);

		Map<String, Object> param = new HashMap<>();
		param.put("CITYNAME", CITYNAME);
		param.put("HPPLNUM", HPPLNUM);
		param.put("HOID", HOID);
		List<Map<String, Object>> hs = se.selectList(rtnNsid("h_select"), param);
		m.addAttribute("hs", hs);

		return "hselect";
	}
	@RequestMapping(value = "/hselect", method = RequestMethod.GET)
	public String hselect(Model m) {
		return "hselect";
	}
	@RequestMapping(value = "/hselectdetail", method = RequestMethod.GET)
	public String hselectdetail(Model m, int HCODE, int HPPLNUM, String MID) {	
		List<Map<String, Object>> hss = se.selectList(rtnNsid("hdetail_select"), HCODE);
		m.addAttribute("hss", hss);
		List<Map<String, Object>> rdate = se.selectList(rtnNsid("select_rdate"), HCODE);

		m.addAttribute("rdate", rdate);
		m.addAttribute("MID", MID);
		m.addAttribute("HPPLNUM", HPPLNUM);
		return "hselectdetail";
	}

	/* 숙소등록 -------------------------------------------------------------------- */
	/* 1. 추가회원정보 등록 update_ho */
	@RequestMapping(value = "/hinsert1", method = RequestMethod.GET)
	public String hinsert1(Model m) {
		List<Map<String, Object>> b = se.selectList(rtnNsid("h_b"));
		m.addAttribute("b", b);
		return "hinsert1";
	}
	@RequestMapping(value = "/update_ho", method = RequestMethod.POST)
	public String update_ho(H_owner ho, Model m) {
		se.update(rtnNsid("update_howner"), ho);

		List<Map<String, Object>> c = se.selectList(rtnNsid("h_c"));
		m.addAttribute("c", c);
		List<Map<String, Object>> r = se.selectList(rtnNsid("h_r"));
		m.addAttribute("r", r);
		List<Map<String, Object>> city = se.selectList(rtnNsid("h_city"));
		m.addAttribute("city", city);

		return "hinsert2";
	}
	/* 2. 숙소정보 등록1/2 insert_house */
	@RequestMapping(value = "/hinsert2", method = RequestMethod.GET)
	public String hinsert2(Model m) {
		return "hinsert2";
	}
	
	@RequestMapping(value = "/chkDupId.do", method = RequestMethod.GET)
	public int chkDupId(HttpServletRequest req, HttpServletResponse res, 
			Model m, String HADETAIL) throws Exception {
		
		int result = se.selectOne(rtnNsid("count_hcode"), HADETAIL);
		
		return result;
	}
		

	@RequestMapping(value = "/hinsert2hadetail", method = RequestMethod.GET)
	public String hinsert2hadetail(HttpServletResponse response, @RequestParam("HADETAIL") String HADETAIL, Model m) {
		int ha = se.selectOne(rtnNsid("select_hadetail"), HADETAIL);
		try {
            response.setContentType("application/text; charset=UTF-8");
         }
         catch(Exception eh) {
            System.out.println(eh);
         }
         try {
            response.getWriter().print(ha);
         } catch (IOException e) {
            System.out.println("error");
         }
		return "hinsert2";
	}
	
	
	@RequestMapping(value = "/insert_house", method = RequestMethod.POST)
	public String insert_house(House h, Model m, String HADETAIL) {
		se.insert(rtnNsid("insert_house"), h);
		int b = se.selectOne(rtnNsid("h"), HADETAIL);
		m.addAttribute("b", b);
		return "hinsert3";
	}
	/* 3. 숙소정보 등록2/2 update_house */
	@RequestMapping(value = "/hinsert3", method = RequestMethod.GET)
	public String hinsert3(Model m) {
		return "hinsert3";
	}
	@RequestMapping(value = "/update_house", method = RequestMethod.POST)
	public String update_house(House h, Share_house sh, Conven cv, Model m) throws IOException {
		se.insert(rtnNsid("insert_sharehouse"), sh);
		se.insert(rtnNsid("insert_conven"), cv);

		// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = h.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("D:\\jsp\\ws2\\simjava\\src\\main\\webapp\\resources\\img\\" + fileName));
		}

		h.setFileName(fileName);
		se.update(rtnNsid("update_house"), h);
		return "hinsert4";
	}
	/* 4. 계약동의 */
	@RequestMapping(value = "/hinsert4", method = RequestMethod.GET)
	public String hinsert4(Locale locale, Model m) {
		return "hinsert4";
	}
	@RequestMapping(value = "/insert_house3", method = RequestMethod.POST)
	public String insert_house3() {
		return "hinsertend";
	}
	/* 5. 등록완료 */
	@RequestMapping(value = "/hinsertend", method = RequestMethod.GET)
	public String hinsertend() {
		return "hinsertend";
	}
	/* 홈화면 ----------------------------------------------------------------------*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
}
