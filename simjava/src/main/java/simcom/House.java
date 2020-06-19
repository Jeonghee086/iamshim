package simcom;


import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class House {
	// 변수
	int HCODE;
	String HOID;
	int TCODE;
	int RCODE;
	int HOWNCODE;
	int ACODE;
	String HADETAIL;
	String HAZIPCODE;
	String HNAME;
	int HPPLNUM;
	int HPRICE;
	int HBEDRMNUM;
	int HBEDNUM;
	int HBATHRMNUM;
	int HBSCODE;
	String HMANUAL;
	String HPICNAME;
	Date HREGDATE;
	
	String fileName;
	MultipartFile uploadFile;
	public House(int hCODE, String hOID, int tCODE, int rCODE, int hOWNCODE, int aCODE, String hADETAIL,
			String hAZIPCODE, String hNAME, int hPPLNUM, int hPRICE, int hBEDRMNUM, int hBEDNUM, int hBATHRMNUM,
			int hBSCODE, String hMANUAL, String hPICNAME, Date hREGDATE, String fileName, MultipartFile uploadFile) {
		super();
		HCODE = hCODE;
		HOID = hOID;
		TCODE = tCODE;
		RCODE = rCODE;
		HOWNCODE = hOWNCODE;
		ACODE = aCODE;
		HADETAIL = hADETAIL;
		HAZIPCODE = hAZIPCODE;
		HNAME = hNAME;
		HPPLNUM = hPPLNUM;
		HPRICE = hPRICE;
		HBEDRMNUM = hBEDRMNUM;
		HBEDNUM = hBEDNUM;
		HBATHRMNUM = hBATHRMNUM;
		HBSCODE = hBSCODE;
		HMANUAL = hMANUAL;
		HPICNAME = hPICNAME;
		HREGDATE = hREGDATE;
		this.fileName = fileName;
		this.uploadFile = uploadFile;
	}
	public House() {
		super();
	}
	public int getHCODE() {
		return HCODE;
	}
	public void setHCODE(int hCODE) {
		HCODE = hCODE;
	}
	public String getHOID() {
		return HOID;
	}
	public void setHOID(String hOID) {
		HOID = hOID;
	}
	public int getTCODE() {
		return TCODE;
	}
	public void setTCODE(int tCODE) {
		TCODE = tCODE;
	}
	public int getRCODE() {
		return RCODE;
	}
	public void setRCODE(int rCODE) {
		RCODE = rCODE;
	}
	public int getHOWNCODE() {
		return HOWNCODE;
	}
	public void setHOWNCODE(int hOWNCODE) {
		HOWNCODE = hOWNCODE;
	}
	public int getACODE() {
		return ACODE;
	}
	public void setACODE(int aCODE) {
		ACODE = aCODE;
	}
	public String getHADETAIL() {
		return HADETAIL;
	}
	public void setHADETAIL(String hADETAIL) {
		HADETAIL = hADETAIL;
	}
	public String getHAZIPCODE() {
		return HAZIPCODE;
	}
	public void setHAZIPCODE(String hAZIPCODE) {
		HAZIPCODE = hAZIPCODE;
	}
	public String getHNAME() {
		return HNAME;
	}
	public void setHNAME(String hNAME) {
		HNAME = hNAME;
	}
	public int getHPPLNUM() {
		return HPPLNUM;
	}
	public void setHPPLNUM(int hPPLNUM) {
		HPPLNUM = hPPLNUM;
	}
	public int getHPRICE() {
		return HPRICE;
	}
	public void setHPRICE(int hPRICE) {
		HPRICE = hPRICE;
	}
	public int getHBEDRMNUM() {
		return HBEDRMNUM;
	}
	public void setHBEDRMNUM(int hBEDRMNUM) {
		HBEDRMNUM = hBEDRMNUM;
	}
	public int getHBEDNUM() {
		return HBEDNUM;
	}
	public void setHBEDNUM(int hBEDNUM) {
		HBEDNUM = hBEDNUM;
	}
	public int getHBATHRMNUM() {
		return HBATHRMNUM;
	}
	public void setHBATHRMNUM(int hBATHRMNUM) {
		HBATHRMNUM = hBATHRMNUM;
	}
	public int getHBSCODE() {
		return HBSCODE;
	}
	public void setHBSCODE(int hBSCODE) {
		HBSCODE = hBSCODE;
	}
	public String getHMANUAL() {
		return HMANUAL;
	}
	public void setHMANUAL(String hMANUAL) {
		HMANUAL = hMANUAL;
	}
	public String getHPICNAME() {
		return HPICNAME;
	}
	public void setHPICNAME(String hPICNAME) {
		HPICNAME = hPICNAME;
	}
	public Date getHREGDATE() {
		return HREGDATE;
	}
	public void setHREGDATE(Date hREGDATE) {
		HREGDATE = hREGDATE;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
		
	
	

}
