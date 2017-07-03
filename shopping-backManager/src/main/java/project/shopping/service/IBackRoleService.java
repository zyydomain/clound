package project.shopping.service;

import java.util.List;
import java.util.Map;

import project.shopping.pojo.BackRole;
import project.shopping.pojo.BackTree;
import project.shopping.pojo.PageConfig;

/**
 * 
 * @author zhouyuyou
 * @date 2017年5月5日下午3:34:59
 */
public interface IBackRoleService {

	public List<BackTree> findAllTree(Map<String, Object> params);

	public PageConfig<BackRole> findPage(Map<String, Object> params);

}
