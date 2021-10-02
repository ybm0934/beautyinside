package com.beauty.zipcode;

public class ZipcodeDTO {

	private String zipcode;
	private String sido;
	private String sigungu;
	private String doro;
	private int build_a;
	private String haengjung;
	private String detaildong;
	private String eupkey;

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getDoro() {
		return doro;
	}

	public void setDoro(String doro) {
		this.doro = doro;
	}

	public int getBuild_a() {
		return build_a;
	}

	public void setBuild_a(int build_a) {
		this.build_a = build_a;
	}

	public String getHaengjung() {
		return haengjung;
	}

	public void setHaengjung(String haengjung) {
		this.haengjung = haengjung;
	}

	public String getDetaildong() {
		return detaildong;
	}

	public void setDetaildong(String detaildong) {
		this.detaildong = detaildong;
	}

	public String getEupkey() {
		return eupkey;
	}

	public void setEupkey(String eupkey) {
		this.eupkey = eupkey;
	}

	@Override
	public String toString() {
		return "ZipcodeDTO [zipcode=" + zipcode + ", sido=" + sido + ", sigungu=" + sigungu + ", doro=" + doro
				+ ", build_a=" + build_a + ", haengjung=" + haengjung + ", detaildong=" + detaildong + ", eupkey="
				+ eupkey + "]";
	}

}
