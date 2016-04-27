package com.projection.domain;

import java.util.Date;

/**
 * 日志类
 * 
 * @author WXF
 *
 */
public class Log {
	private Integer id;
	private User user;
	private String content;
	private Date date;
	private String type;
	private String operationType;
	private String className;
	public Log() {
		super();
	}



	public Log(User user, String content, Date date, String type,
			String operationType, String className) {
		super();
		this.user = user;
		this.content = content;
		this.date = date;
		this.type = type;
		this.operationType = operationType;
		this.className = className;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

}
