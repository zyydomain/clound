package project.shopping.dao;

import org.springframework.stereotype.Repository;

import project.shopping.pojo.OperatorLog;

@Repository
public interface OperatorLogDao {

	/**
	 * 添加
	 * 
	 * @param operatorLog
	 */
	public void addBackLog(OperatorLog operatorLog);
}
