package project.shopping.service;

import java.util.List;
import java.util.Map;

import project.shopping.pojo.BackModule;
import project.shopping.pojo.BackTree;
import project.shopping.pojo.PageConfig;

public interface IBackModuleService {
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
	 * 查询所有显示的菜单树
	 * 
	 * @param params
	 * @return
	 */
	public PageConfig<BackModule> findPage(Map<String, Object> params);

	/**
	 * 添加
	 * 
	 * @param backModule
	 */
	public void addBackMoudle(BackModule backModule);

	/**
	 * 通过ID查找
	 * 
	 * @param id
	 * @return
	 */
	public BackModule findById(Integer id);

	/**
	 * 更新
	 * 
	 * @param backModule
	 */
	public void updateBackMoudle(BackModule backModule);

	/**
	 * 根据ID删除
	 */
	public void deleteById(Integer id);
}
