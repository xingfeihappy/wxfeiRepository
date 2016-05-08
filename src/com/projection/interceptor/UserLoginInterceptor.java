package com.projection.interceptor;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.projection.util.Constant;

@SuppressWarnings("serial")
public class UserLoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = ActionContext.getContext();
		if (ctx.getSession().get(Constant.LOGIN_USER) != null) {
			return invocation.invoke();
		} else {
			return Constant.LOGIN_PAGE;
		}
	}
	
}