package project.shopping.pojo;

import java.util.Date;

/**
 * 后台角色类
 * 
 * @author zhouyuyou
 * @date 2017年5月5日下午3:31:07
 */
public class BackRole {

	private Integer id;
	private String roleName;
	private String roleSummary;
	private Integer roleStatus;
	private String roleRemark;
	private Date roleAddTime;
	private String roleAddIp;
	private Integer roleSuper;

	public Integer getRoleSuper() {
		return roleSuper;
	}

	public void setRoleSuper(Integer roleSuper) {
		this.roleSuper = roleSuper;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleSummary() {
		return roleSummary;
	}

	public void setRoleSummary(String roleSummary) {
		this.roleSummary = roleSummary;
	}

	public Integer getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(Integer roleStatus) {
		this.roleStatus = roleStatus;
	}

	public String getRoleRemark() {
		return roleRemark;
	}

	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
	}

	public Date getRoleAddTime() {
		return roleAddTime;
	}

	public void setRoleAddTime(Date roleAddTime) {
		this.roleAddTime = roleAddTime;
	}

	public String getRoleAddIp() {
		return roleAddIp;
	}

	public void setRoleAddIp(String roleAddIp) {
		this.roleAddIp = roleAddIp;
	}

	@Override
	public String toString() {
		return "BackRole [id=" + id + ", roleName=" + roleName + ", roleSummary=" + roleSummary + ", roleStatus="
				+ roleStatus + ", roleRemark=" + roleRemark + ", roleAddTime=" + roleAddTime + ", roleAddIp="
				+ roleAddIp + "]";
	}

}
