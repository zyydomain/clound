package project.shopping.pojo;

import java.util.List;

/**
 * 系统菜单类
 * 
 * @author zhouyuyou
 * @date 2017年4月27日下午4:15:56
 */
public class BackModule {

	private Integer id;

	private String moduleName;

	private String moduleUrl;

	private String moduleDescribe;

	private Integer moduleSequence;

	private Integer moduleView;

	private Integer moduleParentId;

	private String moduleStyle;

	private List<BackModule> moduleList;

	public String getModuleStyle() {
		return moduleStyle;
	}

	public void setModuleStyle(String moduleStyle) {
		this.moduleStyle = moduleStyle;
	}

	public List<BackModule> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<BackModule> moduleList) {
		this.moduleList = moduleList;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getModuleSequence() {
		return moduleSequence;
	}

	public void setModuleSequence(Integer moduleSequence) {
		this.moduleSequence = moduleSequence;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName == null ? null : moduleName.trim();
	}

	public String getModuleUrl() {
		return moduleUrl;
	}

	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl == null ? null : moduleUrl.trim();
	}

	public String getModuleDescribe() {
		return moduleDescribe;
	}

	public void setModuleDescribe(String moduleDescribe) {
		this.moduleDescribe = moduleDescribe == null ? null : moduleDescribe.trim();
	}

	public Integer getModuleView() {
		return moduleView;
	}

	public void setModuleView(Integer moduleView) {
		this.moduleView = moduleView;
	}

	public Integer getModuleParentId() {
		return moduleParentId;
	}

	public void setModuleParentId(Integer moduleParentId) {
		this.moduleParentId = moduleParentId;
	}

	@Override
	public String toString() {
		return "BackModule [id=" + id + ", moduleName=" + moduleName + ", moduleUrl=" + moduleUrl + ", moduleDescribe="
				+ moduleDescribe + ", moduleSequence=" + moduleSequence + ", moduleView=" + moduleView
				+ ", moduleParentId=" + moduleParentId + ", moduleStyle=" + moduleStyle + ", moduleList=" + moduleList
				+ "]";
	}

}