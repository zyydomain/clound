package project.shopping.pojo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 后台用户实体类
 * 
 * @author zhouyuyou
 * @date 2017年4月27日上午10:03:18
 */
public class BackUser {

	/** 邮箱认证状态 */
	public static final Map<Integer, String> EMAIL_STATUS = new HashMap<Integer, String>();
	/** 未申请认证 */
	public static final Integer EMAIL_DEFAULT = 0;
	/** 申请中 */
	public static final Integer EMAIL_APPLY = 1;
	/** 已认证 */
	public static final Integer EMAIL_PASS = 2;
	/** 认证失败 */
	public static final Integer EMAIL_FAIL = 3;
	/** * 实名认证状态 */
	public static final Map<Integer, String> NAME_STATUS = new HashMap<Integer, String>();
	/** 未申请认证 */
	public static final Integer NAME_DEFAULT = 0;
	/** 未申请认证 */
	public static final Integer NAME_APPLY = 1;
	/** 已认证 */
	public static final Integer NAME_PASS = 2;
	/** 认证失败 */
	public static final Integer NAME_FAIL = 3;
	/** 普通、正常状态 */
	public static final Integer STATUS_NORMAL = 1;
	/** 黑名单 */
	public static final Integer STATUS_BLACK = 2;
	public static final Map<Integer, String> ALL_STATUS = new HashMap<Integer, String>();
	/*** 认证的证件类型状态 */
	public static final Map<Integer, String> CARD_TYPE = new HashMap<Integer, String>();
	/** 身份证 */
	public static final Integer CARD_ID_NUM = 1;

	static {
		ALL_STATUS.put(STATUS_NORMAL, "正常");
		ALL_STATUS.put(STATUS_BLACK, "黑名单");

		NAME_STATUS.put(NAME_DEFAULT, "未申请");
		NAME_STATUS.put(NAME_APPLY, "申请中");
		NAME_STATUS.put(NAME_PASS, "通过");
		NAME_STATUS.put(NAME_FAIL, "未通过");

		EMAIL_STATUS.put(EMAIL_DEFAULT, "未申请");
		EMAIL_STATUS.put(EMAIL_APPLY, "申请中");
		EMAIL_STATUS.put(EMAIL_PASS, "通过");
		EMAIL_STATUS.put(EMAIL_FAIL, "未通过");

		CARD_TYPE.put(CARD_ID_NUM, "身份证");
	}

	private Integer id;
	/**
	 * 用户类型
	 */
	private Integer type;
	/**
	 * 用户名
	 */
	private String userAccount;
	private String userPassword;
	private String userPhone;
	private String userRealName;
	/**
	 * 证件类型
	 */
	private String userCardType;
	private String userCardNumble;
	private String cardFrontImg;
	private String cardBackImg;
	private String userEmail;
	/**
	 * 邮箱状态
	 */
	private Integer emailStatus;
	/**
	 * 实名状态
	 */
	private Integer realNameStatus;
	private String qq;
	private Integer sex;
	/**
	 * 地区id
	 */
	private Integer userAreaId;
	private String userAddress;
	/**
	 * 是否加入黑名单
	 */
	private Integer isBlack;
	/**
	 * 是否锁定
	 */
	private Integer isLock;
	private Date userAddTime;
	private String userAddIp;

	public Integer getIsLock() {
		return isLock;
	}

	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getUserCardType() {
		return userCardType;
	}

	public void setUserCardType(String userCardType) {
		this.userCardType = userCardType;
	}

	public String getUserCardNumble() {
		return userCardNumble;
	}

	public void setUserCardNumble(String userCardNumble) {
		this.userCardNumble = userCardNumble;
	}

	public String getCardFrontImg() {
		return cardFrontImg;
	}

	public void setCardFrontImg(String cardFrontImg) {
		this.cardFrontImg = cardFrontImg;
	}

	public String getCardBackImg() {
		return cardBackImg;
	}

	public void setCardBackImg(String cardBackImg) {
		this.cardBackImg = cardBackImg;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(Integer emailStatus) {
		this.emailStatus = emailStatus;
	}

	public Integer getRealNameStatus() {
		return realNameStatus;
	}

	public void setRealNameStatus(Integer realNameStatus) {
		this.realNameStatus = realNameStatus;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getUserAreaId() {
		return userAreaId;
	}

	public void setUserAreaId(Integer userAreaId) {
		this.userAreaId = userAreaId;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Integer getIsBlack() {
		return isBlack;
	}

	public void setIsBlack(Integer isBlack) {
		this.isBlack = isBlack;
	}

	public Date getUserAddTime() {
		return userAddTime;
	}

	public void setUserAddTime(Date userAddTime) {
		this.userAddTime = userAddTime;
	}

	public String getUserAddIp() {
		return userAddIp;
	}

	public void setUserAddIp(String userAddIp) {
		this.userAddIp = userAddIp;
	}
}
