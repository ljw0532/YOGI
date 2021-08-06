package yogi.group;

import java.util.Date;

//모임개설 테이블
public class GroupModel {
	
		// 모임 번호
		private int gg_no;

		// 모임 이름
		private String gg_name;
		
		// 주최자 번호
		private int m_no;

		// 주최 카테고리
		private String gg_category;

		// 주최 장소
		private String gg_addr;

		// 주최 날짜
		private Date gg_date;

		// 간단 사항
		private String gg_place;
		
		// 세부 사항
		private String gg_detail;
		
		// 비용
		private int gg_cost;

		// 총 인원
		private int gg_total;
		
		// 신청 가능 인원
		private int gg_enable;
		
		// 사진 원본 이름
		private String gg_ofn;
				
		// 사진 저장 이름
		private String gg_rfn;
		
		// 누적 신고 횟수
		private int gg_penalty;

		// 현재 신청한 인원
		private int gg_permit; 
		
		
		private String temp_gg_date;
		
		
		//모임 날짜 (String)
		private String gg_todt;
		
		//모임 주최자
		private String gg_host;
		
		//찜하기 했느뇨...
		private String gg_Ilikeit;
		
		//신청하기 했느뇨...
		private String gg_Ienroll;
		
		private String gg_Ireport; //신고
		//수정날짜
		private String gg_mdate;
		
		public String getGg_Ienroll() {
			return gg_Ienroll;
		}
		public void setGg_Ienroll(String gg_Ienroll) {
			this.gg_Ienroll = gg_Ienroll;
		}
		public String getGg_Ilikeit() {
			return gg_Ilikeit;
		}
		public void setGg_Ilikeit(String gg_Ilikeit) {
			this.gg_Ilikeit = gg_Ilikeit;
		}
		public String getGg_host() {
			return gg_host;
		}
		public void setGg_host(String gg_host) {
			this.gg_host = gg_host;
		}
		public String getGg_todt() {
			return gg_todt;
		}
		public void setGg_todt(String gg_todt) {
			this.gg_todt = gg_todt;
		}
		
		public int getGg_no() {
			return gg_no;
		}
		public void setGg_no(int gg_no) {
			this.gg_no = gg_no;
		}
		public String getGg_name() {
			return gg_name;
		}
		public void setGg_name(String gg_name) {
			this.gg_name = gg_name;
		}
		public int getM_no() {
			return m_no;
		}
		public void setM_no(int m_no) {
			this.m_no = m_no;
		}
		public String getGg_category() {
			return gg_category;
		}
		public void setGg_category(String gg_category) {
			this.gg_category = gg_category;
		}
		public String getGg_place() {
			return gg_place;
		}
		public void setGg_place(String gg_place) {
			this.gg_place = gg_place;
		}
		public Date getGg_date() {
			return gg_date;
		}
		public void setGg_date(Date gg_date) {
			this.gg_date = gg_date;
		}
	
		public String getGg_detail() {
			return gg_detail;
		}
		public void setGg_detail(String gg_detail) {
			this.gg_detail = gg_detail;
		}
		public int getGg_cost() {
			return gg_cost;
		}
		public void setGg_cost(int gg_cost) {
			this.gg_cost = gg_cost;
		}
		public int getGg_total() {
			return gg_total;
		}
		public void setGg_total(int gg_total) {
			this.gg_total = gg_total;
		}
		public int getGg_enable() {
			return gg_enable;
		}
		public void setGg_enable(int gg_enable) {
			this.gg_enable = gg_enable;
		}
		
		public int getGg_penalty() {
			return gg_penalty;
		}
		public void setGg_penalty(int gg_penalty) {
			this.gg_penalty = gg_penalty;
		}
		public int getGg_permit() {
			return gg_permit;
		}
		public void setGg_permit(int gg_permit) {
			this.gg_permit = gg_permit;
		}
		

		public String getTemp_gg_date() {
			return temp_gg_date;
		}
		public void setTemp_gg_date(String temp_gg_date) {
			this.temp_gg_date = temp_gg_date;
		}
		public String getGg_mdate() {
			return gg_mdate;
		}
		public void setGg_mdate(String gg_mdate) {
			this.gg_mdate = gg_mdate;
		}
		public String getGg_Ireport() {
			return gg_Ireport;
		}
		public void setGg_Ireport(String gg_Ireport) {
			this.gg_Ireport = gg_Ireport;
		}
		public String getGg_ofn() {
			return gg_ofn;
		}
		public void setGg_ofn(String gg_ofn) {
			this.gg_ofn = gg_ofn;
		}
		public String getGg_rfn() {
			return gg_rfn;
		}
		public void setGg_rfn(String gg_rfn) {
			this.gg_rfn = gg_rfn;
		}
		public String getGg_addr() {
			return gg_addr;
		}
		public void setGg_addr(String gg_addr) {
			this.gg_addr = gg_addr;
		} 
			
		
		
}


