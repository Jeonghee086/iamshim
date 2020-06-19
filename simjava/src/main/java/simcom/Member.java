package simcom;


public class Member {
	String MID;
	int AUCODE;
	String MPWD;
	String MNAME;
	String MEMAIL;
	public Member(String mID, int aUCODE, String mPWD, String mNAME, String mEMAIL) {
		super();
		MID = mID;
		AUCODE = aUCODE;
		MPWD = mPWD;
		MNAME = mNAME;
		MEMAIL = mEMAIL;
	}
	public Member() {
		super();
	}
	public String getMID() {
		return MID;
	}
	public void setMID(String mID) {
		MID = mID;
	}
	public int getAUCODE() {
		return AUCODE;
	}
	public void setAUCODE(int aUCODE) {
		AUCODE = aUCODE;
	}
	public String getMPWD() {
		return MPWD;
	}
	public void setMPWD(String mPWD) {
		MPWD = mPWD;
	}
	public String getMNAME() {
		return MNAME;
	}
	public void setMNAME(String mNAME) {
		MNAME = mNAME;
	}
	public String getMEMAIL() {
		return MEMAIL;
	}
	public void setMEMAIL(String mEMAIL) {
		MEMAIL = mEMAIL;
	}
	
}