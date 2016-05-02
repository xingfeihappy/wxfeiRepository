package com.projection.action.admin;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Message;
import com.projection.util.Constant;

public class MessageAction extends BaseAction{
	private static final long serialVersionUID = -5200857075098978637L;
	private String logContent;
	private List<Message> messageList;
	private Message message;
	public String execute(){
		try{
			logContent = "查询全部留言信息";
			messageList = messageService.getAll();
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
	
	public String GetAMessage(){
		try{
			logContent = "留言信息";
			message = messageService.get(message.getId());
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
	
	public String DeleteMessage(){
		try{
			logContent = "留言信息";
			if(message == null){
				throw new Exception("参数为空");
			}
			message = messageService.get(message.getId());
			if(message == null){
				throw new Exception("查询为空");
			}
			messageService.delete(message);
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
	public List<Message> getMessageList() {
		return messageList;
	}
	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
}
