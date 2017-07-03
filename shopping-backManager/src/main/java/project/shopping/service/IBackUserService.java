package project.shopping.service;

import java.util.Map;

import project.shopping.pojo.BackUser;

/**
 * 后台用户
 * 
 * @author zhouyuyou
 * @date 2017年4月26日下午5:29:53
 */
public interface IBackUserService {

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
