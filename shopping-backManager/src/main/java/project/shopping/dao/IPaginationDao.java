package project.shopping.dao;

import java.util.Map;

import project.shopping.pojo.PageConfig;

/**
 * 分页
 * 
 * @author zhouyuyou
 * @date 2017年4月28日上午10:03:00
 * @param <T>
 */
public interface IPaginationDao<T> {

	/**
	 * 分页方法
	 * 
	 * @param map
	 * @return
	 */
	public PageConfig<T> findPage(final String listSql, final String countSql, final Map<String, Object> map);

	/**
	 * 数据量较大时，自己拼装sql语句
	 * 
	 * @param listId
	 * @param countId
	 * @param map
	 * @param type
	 * @return
	 *//*
		 * PageConfig getMyPage(String listId, String countId, HashMap map,
		 * String type);
		 */
}
