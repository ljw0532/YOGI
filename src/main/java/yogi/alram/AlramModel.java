package yogi.alram;

import java.util.Date;

public class AlramModel {

	private int alram_seq;
	private int alram_index_no;
	private int alram_contnum;
	private String alram_id;
	private String reg_id;
	private Date regdate;
	private Date readdate;
	public int getAlram_seq() {
		return alram_seq;
	}
	public void setAlram_seq(int alram_seq) {
		this.alram_seq = alram_seq;
	}
	public int getAlram_index_no() {
		return alram_index_no;
	}
	public void setAlram_index_no(int alram_index_no) {
		this.alram_index_no = alram_index_no;
	}
	public int getAlram_contnum() {
		return alram_contnum;
	}
	public void setAlram_contnum(int alram_contnum) {
		this.alram_contnum = alram_contnum;
	}
	public String getAlram_id() {
		return alram_id;
	}
	public void setAlram_id(String alram_id) {
		this.alram_id = alram_id;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getReaddate() {
		return readdate;
	}
	public void setReaddate(Date readdate) {
		this.readdate = readdate;
	}
	
	
}
