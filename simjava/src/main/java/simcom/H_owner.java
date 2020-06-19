package simcom;


import java.sql.Date;

public class H_owner {
	// 변수
	String HOID;
	String HOPWD;
	String HONAME;
	String HOEMAIL;
	Date HOBIRTH;
	String HOPHONE;
	int HOGCODE;
	int BCODE;
	String HOACNUM;
	String HOPICNAME;
	public H_owner(String hOID, String hOPWD, String hONAME, String hOEMAIL, Date hOBIRTH, String hOPHONE, int hOGCODE,
			int bCODE, String hOACNUM, String hOPICNAME) {
		super();
		HOID = hOID;
		HOPWD = hOPWD;
		HONAME = hONAME;
		HOEMAIL = hOEMAIL;
		HOBIRTH = hOBIRTH;
		HOPHONE = hOPHONE;
		HOGCODE = hOGCODE;
		BCODE = bCODE;
		HOACNUM = hOACNUM;
		HOPICNAME = hOPICNAME;
	}
	public H_owner() {
		super();
	}
	public String getHOID() {
		return HOID;
	}
	public void setHOID(String hOID) {
		HOID = hOID;
	}
	public String getHOPWD() {
		return HOPWD;
	}
	public void setHOPWD(String hOPWD) {
		HOPWD = hOPWD;
	}
	public String getHONAME() {
		return HONAME;
	}
	public void setHONAME(String hONAME) {
		HONAME = hONAME;
	}
	public String getHOEMAIL() {
		return HOEMAIL;
	}
	public void setHOEMAIL(String hOEMAIL) {
		HOEMAIL = hOEMAIL;
	}
	public Date getHOBIRTH() {
		return HOBIRTH;
	}
	public void setHOBIRTH(Date hOBIRTH) {
		HOBIRTH = hOBIRTH;
	}
	public String getHOPHONE() {
		return HOPHONE;
	}
	public void setHOPHONE(String hOPHONE) {
		HOPHONE = hOPHONE;
	}
	public int getHOGCODE() {
		return HOGCODE;
	}
	public void setHOGCODE(int hOGCODE) {
		HOGCODE = hOGCODE;
	}
	public int getBCODE() {
		return BCODE;
	}
	public void setBCODE(int bCODE) {
		BCODE = bCODE;
	}
	public String getHOACNUM() {
		return HOACNUM;
	}
	public void setHOACNUM(String hOACNUM) {
		HOACNUM = hOACNUM;
	}
	public String getHOPICNAME() {
		return HOPICNAME;
	}
	public void setHOPICNAME(String hOPICNAME) {
		HOPICNAME = hOPICNAME;
	}

	
	
}
