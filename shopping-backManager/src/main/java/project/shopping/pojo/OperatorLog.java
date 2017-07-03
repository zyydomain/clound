package project.shopping.pojo;

import java.util.Date;

/**
 * 后台系统日志
 * 
 * @author zhouyuyou
 * @date 2017年4月27日下午1:58:41
 */
public class OperatorLog {
	/**
	 * 后台登录
	 */
	public static final Integer BACK_LOGIN = 1;

	private Integer id;

	private String logUserid;

	private String operatorReturn;

	private String operatorTitle;

	private Date createTime;

	private String operatorIp;

	/**
	 * 日志种类
	 */
	private Integer operatorCategory;

	/**
	 * 状态
	 */
	private Integer operatorStatus;

	/**
	 * 参数
	 */
	private String operatorParams;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLogUserid() {
		return logUserid;
	}

	public void setLogUserid(String logUserid) {
		this.logUserid = logUserid;
	}

	public String getOperatorReturn() {
		return operatorReturn;
	}

	public void setOperatorReturn(String operatorReturn) {
		this.operatorReturn = operatorReturn;
	}

	public String getOperatorTitle() {
		return operatorTitle;
	}

	public void setOperatorTitle(String operatorTitle) {
		this.operatorTitle = operatorTitle;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getOperatorIp() {
		return operatorIp;
	}

	public void setOperatorIp(String operatorIp) {
		this.operatorIp = operatorIp;
	}

	public Integer getOperatorCategory() {
		return operatorCategory;
	}

	public void setOperatorCategory(Integer operatorCategory) {
		this.operatorCategory = operatorCategory;
	}

	public Integer getOperatorStatus() {
		return operatorStatus;
	}

	public void setOperatorStatus(Integer operatorStatus) {
		this.operatorStatus = operatorStatus;
	}

	public String getOperatorParams() {
		return operatorParams;
	}

	public void setOperatorParams(String operatorParams) {
		this.operatorParams = operatorParams;
	}

}
