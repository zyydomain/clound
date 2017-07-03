package project.shopping.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.shopping.pojo.BackUser;

/**
 * 后台用户dao层
 * 
 * @author zhouyuyou
 * @date 2017年4月26日下午5:45:45
 */
@Repository
public interface BackUserDao {

	/**
	 * 通过用户名查找
	 * 
	 * @return
	 */
	public BackUser findByAccount(Map<String, Object> params);

	/**
	 * 主键查找
	 * 
	 * @return
	 */
	public BackUser findByPrimaryKey(Integer id);
}
