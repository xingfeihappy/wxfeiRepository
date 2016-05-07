package com.projection.action.admin;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.domain.Log;
import com.projection.domain.Message;
import com.projection.domain.Order;
import com.projection.domain.Seat;
import com.projection.domain.User;
import com.projection.util.CreateUserCell;

@SuppressWarnings("serial")
public class ExportAction extends BaseAction{
	private String check1;
	private String check2;
	private String check3;
	private String check4;
	private String check5;
	public ByteArrayInputStream getInputStream(){
		try{
			List<User> userList = new ArrayList<User>();
			List<Dishes> dishesList = new ArrayList<Dishes>();
			List<Message> messagetList = new ArrayList<Message>();
			List<Order> orderList = new ArrayList<Order>();
			List<Log> logList = new ArrayList<Log>();
			
			userList = userService.getAll();
			dishesList = dishesService.getAll();
			messagetList = messageService.getAll();
			orderList = orderService.getAll();
			logList = logService.getAll();
			
			HSSFWorkbook wb = new CreateUserCell().userCell(userList,dishesList,messagetList,orderList,logList,check1,check2,check3,check4,check5);
			ByteArrayOutputStream os=new ByteArrayOutputStream();
			wb.write(os);
			return new ByteArrayInputStream(os.toByteArray());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
    }
	public String getCheck1() {
		return check1;
	}
	public void setCheck1(String check1) {
		this.check1 = check1;
	}
	public String getCheck2() {
		return check2;
	}
	public void setCheck2(String check2) {
		this.check2 = check2;
	}
	public String getCheck3() {
		return check3;
	}
	public void setCheck3(String check3) {
		this.check3 = check3;
	}
	public String getCheck4() {
		return check4;
	}
	public void setCheck4(String check4) {
		this.check4 = check4;
	}
	public String getCheck5() {
		return check5;
	}
	public void setCheck5(String check5) {
		this.check5 = check5;
	}
	
 }