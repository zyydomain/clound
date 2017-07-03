package project.shopping.service;

import project.shopping.pojo.OperatorLog;

/**
 * 日志
 * 
 * @author zhouyuyou
 * @date 2017年4月27日下午2:44:37
 */
public interface IOperatorLogService {

	/**
	 * 添加
	 * 
	 * @param operatorLog
	 */
	public void addBackLog(OperatorLog operatorLog);

}
