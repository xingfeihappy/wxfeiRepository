package com.projection.action.admin;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.domain.Log;
import com.projection.domain.Message;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.ExceptionUtil;
import com.projection.util.StringUtil;

public class DishesAction extends BaseAction {
	private static final long serialVersionUID = 7974198552914942825L;
	private String logContent;
	private Dishes dishes;
	private Integer type;
	private List<Dishes> dishesList;
	private File file;
	private List<Message> messageList = new ArrayList<Message>();
	private InputStream ips;
	public String execute() {
		try {
			logContent = "查询全部菜品信息";
			dishesList = dishesService.getAll();
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String AddDishes() {
		try {
			if (dishes == null) {
				throw new NullPointerException("参数为空");
			}
			if (dishes.getId() != null) {
				logContent = "更新菜品信息";
				Dishes oldDishes = dishesService.get(dishes.getId());
				oldDishes.setDescription(StringUtil.trim(dishes.getDescription()));
				oldDishes.setName(StringUtil.trim(dishes.getName()));
				oldDishes.setPrice(dishes.getPrice());
				oldDishes.setType(dishesService.getTypeById(type));
				oldDishes.setDescription(StringUtil.trim(dishes.getDescription()));
				oldDishes.setUpdateTime(new Date());
				dishes = oldDishes;
			} else {
				logContent = "新增菜品信息";
				dishes.setDescription(StringUtil.trim(dishes.getDescription()));
				dishes.setName(StringUtil.trim(dishes.getName()));
				dishes.setPrice(dishes.getPrice());
				dishes.setType(dishesService.getTypeById(type));
				dishes.setDescription(StringUtil.trim(dishes.getDescription()));
				dishes.setUpdateTime(new Date());
			}

			if (file != null) {
				// 以字节流的形式读取上传的图片文件
				ips = new FileInputStream(file);
				byte[] photo = new byte[ips.available()];
				ips.read(photo);
				// 保存用户图片
				dishes.setPhoto(photo);
				ips.close();
			}

			if (dishes.getId() == null) {
				dishes.setId(dishesService.save(dishes));
			} else {
				dishesService.update(dishes);
			}
			logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER),
					 logContent, new Date(),
					 Constant.USER_LOG, Constant.ADD_OPERATION, this
					 .getClass().getName()));
			return SUCCESS;
		} catch (Exception e) {
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER),
			 ExceptionUtil.getExceptionAllinformation(e), new Date(),
			 Constant.EXCEPTION_LOG, Constant.ADD_OPERATION, this
			 .getClass().getName()));
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String ShowDishesPhoto() {
		Dishes dish = dishesService.get(dishes.getId());
		byte[] photo = dish.getPhoto();
		ips = new ByteArrayInputStream(photo);
		return "photo";
	}

	public String GetADishes() {
		try {
			logContent = "查询菜品信息";
			dishes = dishesService.get(dishes.getId());
			dishesList = dishesService.getAll();
			List<Message> messageList1 = messageService.getMessageByDish(dishes.getId());
			String id = dishes.getId().toString();
			for(int i=0;i<messageList1.size();i++){
				if(messageList1.get(i).getRecommendation().contains(id)){
					System.out.println(messageList1.get(i).getRecommendation());
					System.out.println(messageList1.get(i).getRecommendation().contains(id));
					messageList.add(messageList1.get(i));
				}
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String DeleteDishes() {
		try {
			logContent = "删除菜品信息";
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER), logContent, new Date(),
			 Constant.USER_LOG, Constant.DELETE_OPERATION, this
			 .getClass().getName()));
			 

			if (dishes == null) {
				throw new Exception("参数为空");
			}
			dishes = dishesService.get(dishes.getId());
			if (dishes == null) {
				throw new Exception("查询结果为空");
			}
			dishesService.delete(dishes);
			return SUCCESS;
		} catch (Exception e) {
			logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER),
					 ExceptionUtil.getExceptionAllinformation(e), new Date(),
					 Constant.EXCEPTION_LOG, Constant.DELETE_OPERATION, this
					 .getClass().getName()));
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	//搜索
	public String dishSearch(){
		try{
			if (dishes.getName() == null) {
				throw new Exception("参数为空");
			}
			dishesList = dishesService.getListByName(dishes.getName());
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	public Dishes getDishes() {
		return dishes;
	}

	public void setDishes(Dishes dishes) {
		this.dishes = dishes;
	}

	public List<Dishes> getDishesList() {
		return dishesList;
	}

	public void setDishesList(List<Dishes> dishesList) {
		this.dishesList = dishesList;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public InputStream getIps() {
		return ips;
	}

	public void setIps(InputStream ips) {
		this.ips = ips;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}
}
