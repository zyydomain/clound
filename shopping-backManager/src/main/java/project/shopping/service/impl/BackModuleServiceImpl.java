package project.shopping.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.shopping.dao.BackModuleDao;
import project.shopping.dao.IPaginationDao;
import project.shopping.pojo.BackModule;
import project.shopping.pojo.BackTree;
import project.shopping.pojo.PageConfig;
import project.shopping.service.IBackModuleService;

/**
 * 后台系统菜单类service
 * 
 * @author zhouyuyou
 * @date 2017年4月27日下午4:20:46
 */
@Service
public class BackModuleServiceImpl implements IBackModuleService {

	@Autowired
	private BackModuleDao backModuleDao;
	@Autowired
	private IPaginationDao<BackModule> paginationDao;

	@Override
	public List<BackModule> findAllModule(Map<String, Object> params) {
		return this.backModuleDao.findAllModule(params);
	}

	@Override
	public List<BackTree> findAllModuleTree(Map<String, Object> params) {
		return this.backModuleDao.findAllModuleTree(params);
	}

	@Override
	public PageConfig<BackModule> findPage(Map<String, Object> params) {
		return this.paginationDao.findPage("findAllModule", "findModuleCount", params);
	}

	@Override
	public void addBackMoudle(BackModule backModule) {
		this.backModuleDao.insert(backModule);

	}

	@Override
	public BackModule findById(Integer id) {
		return this.backModuleDao.findById(id);
	}

	@Override
	public void updateBackMoudle(BackModule backModule) {
		this.backModuleDao.updateById(backModule);
	}

	@Override
	public void deleteById(Integer id) {
		this.backModuleDao.deleteById(id);
	}

}
