package project.shopping.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.shopping.dao.BackRoleDao;
import project.shopping.pojo.BackRole;
import project.shopping.pojo.BackTree;
import project.shopping.pojo.PageConfig;
import project.shopping.service.IBackRoleService;

/**
 * 后台角色处理类
 * 
 * @author zhouyuyou
 * @date 2017年5月5日下午3:35:46
 */
@Service
public class BackRoleServiceImpl implements IBackRoleService {
	@Autowired
	private BackRoleDao backRoleDao;

	@Override
	public List<BackTree> findAllTree(Map<String, Object> params) {
		return this.backRoleDao.findAllTree(params);
	}

	@Override
	public PageConfig<BackRole> findPage(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

}
