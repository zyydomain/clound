package project.shopping.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.shopping.dao.OperatorLogDao;
import project.shopping.pojo.OperatorLog;
import project.shopping.service.IOperatorLogService;

@Service
public class OperatorLogServiceImpl implements IOperatorLogService {

	@Autowired
	private OperatorLogDao operatorLogDao;

	@Override
	public void addBackLog(OperatorLog operatorLog) {
		this.operatorLogDao.addBackLog(operatorLog);
	}

}
