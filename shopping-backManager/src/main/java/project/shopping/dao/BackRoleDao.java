package project.shopping.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.shopping.pojo.BackTree;

/**
 * 后台角色类dao
 * 
 * @author zhouyuyou
 * @date 2017年5月5日下午3:37:47
 */
@Repository
public interface BackRoleDao {

	/**
	 * 所有角色树
	 * 
	 * @return
	 */
	public List<BackTree> findAllTree(Map<String, Object> params);
}
