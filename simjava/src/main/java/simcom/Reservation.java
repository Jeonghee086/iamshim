package simcom;


import java.sql.Date;

public class Reservation {
	int RCODE;
	String MID;
	int SHCODE;
	int PGCODE;
	Date RCHECKIN;
	Date RCHECKOUT;
	int RPPLNUM;
	Date RMBIRTH;
	String RMPHONE;
	int MGCODE;
	String RCARDNUM;
	int RCARDENDM;
	int RCARDENDD;
	int RCARDCVV;
	int RPRICE;
	Date RPAYDATE;
	
	int RES;

	public Reservation(int rCODE, String mID, int sHCODE, int pGCODE, Date rCHECKIN, Date rCHECKOUT, int rPPLNUM,
			Date rMBIRTH, String rMPHONE, int mGCODE, String rCARDNUM, int rCARDENDM, int rCARDENDD, int rCARDCVV,
			int rPRICE, Date rPAYDATE, int rES) {
		super();
		RCODE = rCODE;
		MID = mID;
		SHCODE = sHCODE;
		PGCODE = pGCODE;
		RCHECKIN = rCHECKIN;
		RCHECKOUT = rCHECKOUT;
		RPPLNUM = rPPLNUM;
		RMBIRTH = rMBIRTH;
		RMPHONE = rMPHONE;
		MGCODE = mGCODE;
		RCARDNUM = rCARDNUM;
		RCARDENDM = rCARDENDM;
		RCARDENDD = rCARDENDD;
		RCARDCVV = rCARDCVV;
		RPRICE = rPRICE;
		RPAYDATE = rPAYDATE;
		RES = rES;
	}

	public Reservation() {
		super();
	}

	public int getRCODE() {
		return RCODE;
	}

	public void setRCODE(int rCODE) {
		RCODE = rCODE;
	}

	public String getMID() {
		return MID;
	}

	public void setMID(String mID) {
		MID = mID;
	}

	public int getSHCODE() {
		return SHCODE;
	}

	public void setSHCODE(int sHCODE) {
		SHCODE = sHCODE;
	}

	public int getPGCODE() {
		return PGCODE;
	}

	public void setPGCODE(int pGCODE) {
		PGCODE = pGCODE;
	}

	public Date getRCHECKIN() {
		return RCHECKIN;
	}

	public void setRCHECKIN(Date rCHECKIN) {
		RCHECKIN = rCHECKIN;
	}

	public Date getRCHECKOUT() {
		return RCHECKOUT;
	}

	public void setRCHECKOUT(Date rCHECKOUT) {
		RCHECKOUT = rCHECKOUT;
	}

	public int getRPPLNUM() {
		return RPPLNUM;
	}

	public void setRPPLNUM(int rPPLNUM) {
		RPPLNUM = rPPLNUM;
	}

	public Date getRMBIRTH() {
		return RMBIRTH;
	}

	public void setRMBIRTH(Date rMBIRTH) {
		RMBIRTH = rMBIRTH;
	}

	public String getRMPHONE() {
		return RMPHONE;
	}

	public void setRMPHONE(String rMPHONE) {
		RMPHONE = rMPHONE;
	}

	public int getMGCODE() {
		return MGCODE;
	}

	public void setMGCODE(int mGCODE) {
		MGCODE = mGCODE;
	}

	public String getRCARDNUM() {
		return RCARDNUM;
	}

	public void setRCARDNUM(String rCARDNUM) {
		RCARDNUM = rCARDNUM;
	}

	public int getRCARDENDM() {
		return RCARDENDM;
	}

	public void setRCARDENDM(int rCARDENDM) {
		RCARDENDM = rCARDENDM;
	}

	public int getRCARDENDD() {
		return RCARDENDD;
	}

	public void setRCARDENDD(int rCARDENDD) {
		RCARDENDD = rCARDENDD;
	}

	public int getRCARDCVV() {
		return RCARDCVV;
	}

	public void setRCARDCVV(int rCARDCVV) {
		RCARDCVV = rCARDCVV;
	}

	public int getRPRICE() {
		return RPRICE;
	}

	public void setRPRICE(int rPRICE) {
		RPRICE = rPRICE;
	}

	public Date getRPAYDATE() {
		return RPAYDATE;
	}

	public void setRPAYDATE(Date rPAYDATE) {
		RPAYDATE = rPAYDATE;
	}

	public int getRES() {
		return RES;
	}

	public void setRES(int rES) {
		RES = rES;
	}



	
}
