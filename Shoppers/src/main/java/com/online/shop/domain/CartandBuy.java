package com.online.shop.domain;

import java.util.Date;

public class CartandBuy {
	private int c_no;//카트번호
	private String b_id;//구매자아이디
	private int p_no;//제품번호
	private String p_name;//제품명
	private int p_price;//제품가격
	private int buy_cnt;//선택한수량
	private String o_cont;//선택한옵션내용
	private int buy_no;//주문번호는 주문테이블에 먼저 insert된후 카트테이블에 insert해줌
	private String s_id;
	//end cart
	//private int buy_no;//주문번호
	//private String b_id;//구매자아이디
	private Date buy_date;//주문일자
	private String delivery_zip;//우편번호
	private String delivery_addr1;//주소
	private int buy_status;//주문상태
	private String delivery_addr2;//주소
	private String b_name;//구매자 이름
	private String b_phone;//구매자 연락처
	private String b_email;//구매자 메일
	private String buy_comp;//구매 확정일자
	private int count;
	//end buy
	public int getCount(){
		return count;
	}
	public void setCount(int count){
		this.count=count;
	}
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getBuy_cnt() {
		return buy_cnt;
	}
	public void setBuy_cnt(int buy_cnt) {
		this.buy_cnt = buy_cnt;
	}
	public String getO_cont() {
		return o_cont;
	}
	public void setO_cont(String o_cont) {
		this.o_cont = o_cont;
	}
	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getDelivery_zip() {
		return delivery_zip;
	}
	public void setDelivery_zip(String delivery_zip) {
		this.delivery_zip = delivery_zip;
	}
	public String getDelivery_addr1() {
		return delivery_addr1;
	}
	public void setDelivery_addr1(String delivery_addr1) {
		this.delivery_addr1 = delivery_addr1;
	}
	public int getBuy_status() {
		return buy_status;
	}
	public void setBuy_status(int buy_status) {
		this.buy_status = buy_status;
	}
	public String getDelivery_addr2() {
		return delivery_addr2;
	}
	public void setDelivery_addr2(String delivery_addr2) {
		this.delivery_addr2 = delivery_addr2;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_phone() {
		return b_phone;
	}
	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getBuy_comp() {
		return buy_comp;
	}
	public void setBuy_comp(String buy_comp) {
		this.buy_comp = buy_comp;
	}
}
