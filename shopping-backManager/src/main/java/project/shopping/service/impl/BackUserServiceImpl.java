package project.shopping.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.shopping.dao.BackUserDao;
import project.shopping.pojo.BackUser;
import project.shopping.service.IBackUserService;

/**
 * 后台用户service实现
 * 
 * @author zhouyuyou
 * @date 2017年4月26日下午5:30:58
 */
@Service
public class BackUserServiceImpl implements IBackUserService {

	@Autowired
	private BackUserDao backUserDao;

	@Override
	public BackUser findByAccount(Map<String, Object> params) {
		return this.backUserDao.findByAccount(params);
	}

	@Override
	public BackUser findByPrimaryKey(Integer id) {
		return this.backUserDao.findByPrimaryKey(id);
	}

}
