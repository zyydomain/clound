package project.shopping.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.shopping.pojo.BackModule;
import project.shopping.pojo.BackTree;

/**
 * 系统菜单持久层
 * 
 * @author zhouyuyou
 * @date 2017年4月27日下午4:21:47
 */
@Repository
public interface BackModuleDao {
	/**
	 * 查询所有显示的菜单
	 * 
	 * @param params
	 * @return
	 */
	public List<BackModule> findAllModule(Map<String, Object> params);

	/**
	 * 查询所有显示的菜单树
	 * 
	 * @param params
	 * @return
	 */
	public List<BackTree> findAllModuleTree(Map<String, Object> params);

	/**
	 * 所有显示的菜单树数量
	 * 
	 * @param params
	 * 
	 * @return
	 */
	public Integer findModuleCount(Map<String, Object> params);

	/**
	 * 添加
	 * 
	 * @param backModule
	 */
	public void insert(BackModule backModule);

	/**
	 * ID 查找
	 * 
	 * @param id
	 * @return
	 */
	public BackModule findById(Integer id);

	/**
	 * 根据ID更新
	 * 
	 * @param id
	 */
	public void updateById(BackModule backModule);

	/**
	 * 根据ID删除
	 * 
	 * @param id
	 */
	public void deleteById(Integer id);
}
