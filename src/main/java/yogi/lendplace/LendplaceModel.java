package yogi.lendplace;

import java.util.Date;

public class LendplaceModel {

    private int L_NO;
	private String L_SUBJECT;
	private String L_ADDR;
	private String L_CONTENT;
	private String L_REP_IMG;
	private int L_ENABLE;
	private int L_PAYMENT;
	private Date L_SDATE;
	private Date L_EDATE;
	private int L_RATE;
	
	// 장소등록시 날짜부분이 스트링값으로 넘어와 String 날짜변수생성
	private String L_T_SDATE; //대관시작
	private String L_T_EDATE; //대관종료
	public int getL_NO() {
		return L_NO;
	}
	public void setL_NO(int l_NO) {
		L_NO = l_NO;
	}
	public String getL_SUBJECT() {
		return L_SUBJECT;
	}
	public void setL_SUBJECT(String l_SUBJECT) {
		L_SUBJECT = l_SUBJECT;
	}
	public String getL_ADDR() {
		return L_ADDR;
	}
	public void setL_ADDR(String l_ADDR) {
		L_ADDR = l_ADDR;
	}
	public String getL_CONTENT() {
		return L_CONTENT;
	}
	public void setL_CONTENT(String l_CONTENT) {
		L_CONTENT = l_CONTENT;
	}
	public String getL_REP_IMG() {
		return L_REP_IMG;
	}
	public void setL_REP_IMG(String l_REP_IMG) {
		L_REP_IMG = l_REP_IMG;
	}
	public int getL_ENABLE() {
		return L_ENABLE;
	}
	public void setL_ENABLE(int l_ENABLE) {
		L_ENABLE = l_ENABLE;
	}
	public int getL_PAYMENT() {
		return L_PAYMENT;
	}
	public void setL_PAYMENT(int l_PAYMENT) {
		L_PAYMENT = l_PAYMENT;
	}
	public Date getL_SDATE() {
		return L_SDATE;
	}
	public void setL_SDATE(Date l_SDATE) {
		L_SDATE = l_SDATE;
	}
	public Date getL_EDATE() {
		return L_EDATE;
	}
	public void setL_EDATE(Date l_EDATE) {
		L_EDATE = l_EDATE;
	}
	public int getL_RATE() {
		return L_RATE;
	}
	public void setL_RATE(int l_RATE) {
		L_RATE = l_RATE;
	}
	public String getL_T_SDATE() {
		return L_T_SDATE;
	}
	public void setL_T_SDATE(String l_T_SDATE) {
		L_T_SDATE = l_T_SDATE;
	}
	public String getL_T_EDATE() {
		return L_T_EDATE;
	}
	public void setL_T_EDATE(String l_T_EDATE) {
		L_T_EDATE = l_T_EDATE;
	}
		
	
	
		
}