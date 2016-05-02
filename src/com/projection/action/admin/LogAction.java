package com.projection.action.admin;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Log;
import com.projection.util.Constant;

public class LogAction extends BaseAction{
	private static final long serialVersionUID = -1700147767899542588L;
	private String logContent;
	private List<Log> logList;
	private Log log;
	public String execute(){
		try{
			logContent = "管理员查询全部日志信息";
			logList = logService.getAll();
			return SUCCESS;
		}catch(Exception e){
			/*logService.save(new Log(new User(
			(Integer) getValueFromSession(Constant.USER_ID)),
			ExceptionUtil.getExceptionAllinformation(e), new Date(),
			Constant.EXCEPTION_LOG, Constant.SEE_OPERATION, this
					.getClass().getName()));*/
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	
	public String DeleteLog(){
		try{
			logContent = "删除日志信息";
			if(log == null){
				throw new Exception("参数为空");
			}
			log = logService.get(log.getId());
			if(log == null){
				throw new Exception("查询");
			}
			logService.delete(log);
			return SUCCESS;
		}catch(Exception e){
			/*logService.save(new Log(new User(
			(Integer) getValueFromSession(Constant.USER_ID)),
			ExceptionUtil.getExceptionAllinformation(e), new Date(),
			Constant.EXCEPTION_LOG, Constant.SEE_OPERATION, this
					.getClass().getName()));*/
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	public List<Log> getLogList() {
		return logList;
	}
	public void setLogList(List<Log> logList) {
		this.logList = logList;
	}

	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}
}
