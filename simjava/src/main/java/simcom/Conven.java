package simcom;


public class Conven {
	int CVCODE;
	String[] CVNAME;
	int HCODE;
	public Conven(int cVCODE, String[] cVNAME, int hCODE) {
		super();
		CVCODE = cVCODE;
		CVNAME = cVNAME;
		HCODE = hCODE;
	}
	public Conven() {
		super();
	}
	public int getCVCODE() {
		return CVCODE;
	}
	public void setCVCODE(int cVCODE) {
		CVCODE = cVCODE;
	}
	public String[] getCVNAME() {
		return CVNAME;
	}
	public void setCVNAME(String[] cVNAME) {
		CVNAME = cVNAME;
	}
	public int getHCODE() {
		return HCODE;
	}
	public void setHCODE(int hCODE) {
		HCODE = hCODE;
	}
	

}
