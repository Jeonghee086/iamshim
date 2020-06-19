package simcom;


import java.sql.Date;

public class Share_house {
	int SHCODE;
	int HCODE;
	Date SHSTART;
	Date SHEND;
	
	public Share_house(int sHCODE, int hCODE, Date sHSTART, Date sHEND) {
		super();
		SHCODE = sHCODE;
		HCODE = hCODE;
		SHSTART = sHSTART;
		SHEND = sHEND;
	}
	public Share_house() {
		super();
	}
	public int getSHCODE() {
		return SHCODE;
	}
	public void setSHCODE(int sHCODE) {
		SHCODE = sHCODE;
	}
	public int getHCODE() {
		return HCODE;
	}
	public void setHCODE(int hCODE) {
		HCODE = hCODE;
	}
	public Date getSHSTART() {
		return SHSTART;
	}
	public void setSHSTART(Date sHSTART) {
		SHSTART = sHSTART;
	}
	public Date getSHEND() {
		return SHEND;
	}
	public void setSHEND(Date sHEND) {
		SHEND = sHEND;
	}
	

	
	

}
