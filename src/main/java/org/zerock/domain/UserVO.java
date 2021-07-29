package org.zerock.domain;

public class UserVO {
	//회원 id
	private String userId;
	
	//회원 비밀번호
	private String userPw;
	
	//회원 이름
	private String userName;
	
	//회원 이메일
	private String userMail;
	
	//회원 전화번호
	private String userPhone;
	
	//회원 우편번호
	private String userAddr1;
	
	//회원 주소
	private String userAddr2;
	
	//회원 상세주소
	private String userAddr3;
	
	// 관리자 구분(0:일반사용자, 1:관리자)
	private int userAdmin;
	
	//수정일자
	private int updateDate;
	
	//회원 돈
	private int money;
	
	//회원 포인트
	private int point;
		
	//등록일자
	private int regDate;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

	public int getUserAdmin() {
		return userAdmin;
	}

	public void setUserAdmin(int userAdmin) {
		this.userAdmin = userAdmin;
	}

	public int getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(int updateDate) {
		this.updateDate = updateDate;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getRegDate() {
		return regDate;
	}

	public void setRegDate(int regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userMail=" + userMail
				+ ", userPhone=" + userPhone + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3="
				+ userAddr3 + ", userAdmin=" + userAdmin + ", updateDate=" + updateDate + ", money=" + money
				+ ", point=" + point + ", regDate=" + regDate + "]";
	}
	
}
