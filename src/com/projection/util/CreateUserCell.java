package com.projection.util;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.projection.domain.Dishes;
import com.projection.domain.Log;
import com.projection.domain.Message;
import com.projection.domain.Order;
import com.projection.domain.User;

public class CreateUserCell {
	public HSSFWorkbook userCell(List<User> userList,List<Dishes> dishesList,List<Message> messageList,List<Order> orderList,List<Log> logList,String check1,String check2,String check3,String check4,String check5){
		HSSFWorkbook workbook = new HSSFWorkbook();//创建一个excel
		HSSFCell cell = null;                                    //Excel的列
        HSSFRow row = null;                                      //Excel的行
        HSSFCellStyle style = workbook.createCellStyle();        //设置表头的类型
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFCellStyle style1 = workbook.createCellStyle();       //设置数据类型
        style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font = workbook.createFont();                 //设置字体
        if(check1 != null){
        	String [] userHeader = {"姓名","用户名","性别","联系方式","邮箱","地址","生日"};
    		short usercellNumber = (short)userHeader.length;//表的列数
            HSSFSheet sheet = workbook.createSheet("sheet1");        //创建一个sheet
            HSSFHeader header = sheet.getHeader();//设置sheet的头
            if(userList.size() < 1){
        		header.setCenter("导出失败");
        	}else{
        		header.setCenter("用户表");
        		row = sheet.createRow(0);
        		row.setHeight((short)400);
        		for(int i = 0;i < usercellNumber;i++){
        			cell = row.createCell(i);
        			cell.setCellValue(userHeader[i]);//设置第0行第k列的值
        			sheet.setColumnWidth(i,8000);//设置列的宽度
        			font.setColor(HSSFFont.COLOR_NORMAL);
        			font.setFontHeight((short)200);
        			style1.setFont(font);//设置字体风格
        			cell.setCellStyle(style1);
        		}
        		for(int i = 0;i < userList.size();i++){
        			User user = userList.get(i);
        			row = sheet.createRow((short)(i+1));//创建i+1行
        			row.setHeight((short)400);//设置行高
        			if(user.getName() != null){
        				cell = row.createCell(0);//创建地i+1行
        				cell.setCellValue(user.getName());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(user.getUsername() != null){
        				cell = row.createCell(1);//创建地i+1行
        				cell.setCellValue(user.getUsername());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(user.getSex() != null){
        				cell = row.createCell(2);//创建地i+1行
        				cell.setCellValue(user.getSex());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(user.getTelephone() != null){
        				cell = row.createCell(3);//创建地i+1行
        				cell.setCellValue(user.getTelephone());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(user.getEmail() != null){
        				cell = row.createCell(4);//创建地i+1行
        				cell.setCellValue(user.getEmail());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(user.getAddress() != null){
        				cell = row.createCell(5);//创建地i+1行
        				cell.setCellValue(user.getAddress());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(user.getBirthday() != null){
        				cell = row.createCell(6);//创建地i+1行
        				cell.setCellValue(user.getBirthday());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        		}
        	}
        }
        if(check2 != null){
        	String [] dishesHeader = {"名称","单价","种类","更新时间","描述"};
    		short dishescellNumber = (short)dishesHeader.length;//表的列数
            HSSFSheet sheet = workbook.createSheet("sheet2");        //创建一个sheet
            HSSFHeader header = sheet.getHeader();//设置sheet的头
            if(dishesList.size() < 1){
        		header.setCenter("导出失败");
        	}else{
        		header.setCenter("菜品表");
        		row = sheet.createRow(0);
        		row.setHeight((short)400);
        		for(int i = 0;i < dishescellNumber;i++){
        			cell = row.createCell(i);
        			cell.setCellValue(dishesHeader[i]);//设置第0行第k列的值
        			sheet.setColumnWidth(i,8000);//设置列的宽度
        			font.setColor(HSSFFont.COLOR_NORMAL);
        			font.setFontHeight((short)200);
        			style1.setFont(font);//设置字体风格
        			cell.setCellStyle(style1);
        		}
        		for(int i = 0;i < dishesList.size();i++){
        			Dishes dishes = dishesList.get(i);
        			row = sheet.createRow((short)(i+1));//创建i+1行
        			row.setHeight((short)400);//设置行高
        			if(dishes.getName() != null){
        				cell = row.createCell(0);//创建地i+1行
        				cell.setCellValue(dishes.getName());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(dishes.getPrice()!= null){
        				cell = row.createCell(1);//创建地i+1行
        				cell.setCellValue(dishes.getPrice());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(dishes.getType() != null){
        				cell = row.createCell(2);//创建地i+1行
        				cell.setCellValue(dishes.getType().getType());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(dishes.getUpdateTime() != null){
        				cell = row.createCell(3);//创建地i+1行
        				cell.setCellValue(dishes.getUpdateTime());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(dishes.getDescription() != null){
        				cell = row.createCell(4);//创建地i+1行
        				cell.setCellValue(dishes.getDescription());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        		}
        	}
        }
        if(check3 != null){
        	String [] messageHeader = {"姓名","性别","民族","出生日期","行政职务","专业职称","研究专长","身份证号码","最后学历","最后学位","工作单位","用户类型","通讯地址","邮政编码","手机号码","办公室号码","住宅号码","邮箱"};
    		short messagecellNumber = (short)messageHeader.length;//表的列数
            HSSFSheet sheet = workbook.createSheet("sheet3");        //创建一个sheet
            HSSFHeader header = sheet.getHeader();//设置sheet的头
            if(messageList.size() < 1){
        		header.setCenter("导出失败");
        	}else{
        		header.setCenter("留言表");
        		row = sheet.createRow(0);
        		row.setHeight((short)400);
        		for(int i = 0;i < messagecellNumber;i++){
        			cell = row.createCell(i);
        			cell.setCellValue(messageHeader[i]);//设置第0行第k列的值
        			sheet.setColumnWidth(i,8000);//设置列的宽度
        			font.setColor(HSSFFont.COLOR_NORMAL);
        			font.setFontHeight((short)200);
        			style1.setFont(font);//设置字体风格
        			cell.setCellStyle(style1);
        		}
        		for(int i = 0;i < messageList.size();i++){
        			Message message = messageList.get(i);
        			row = sheet.createRow((short)(i+1));//创建i+1行
        			row.setHeight((short)400);//设置行高
        			if(message.getContent() != null){
        				cell = row.createCell(0);//创建地i+1行
        				cell.setCellValue(message.getContent());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(message.getGrade() != null){
        				cell = row.createCell(1);//创建地i+1行
        				cell.setCellValue(message.getGrade());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(message.getRecommendation() != null){
        				cell = row.createCell(2);//创建地i+1行
        				cell.setCellValue(message.getRecommendation());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(message.getUser() != null){
        				cell = row.createCell(3);//创建地i+1行
        				cell.setCellValue(message.getUser().getName());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(message.getOrder() != null){
        				cell = row.createCell(4);//创建地i+1行
        				cell.setCellValue(message.getOrder().getCodes());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        		}
        	}
        }
        if(check4 != null){
        	String [] orderHeader = {"订单编号","菜量","消费总计","下单时间","状态","下单人","餐位"};
    		short ordercellNumber = (short)orderHeader.length;//表的列数
            HSSFSheet sheet = workbook.createSheet("sheet4");        //创建一个sheet
            HSSFHeader header = sheet.getHeader();//设置sheet的头
            if(orderList.size() < 1){
        		header.setCenter("导出失败");
        	}else{
        		header.setCenter("订单表");
        		row = sheet.createRow(0);
        		row.setHeight((short)400);
        		for(int i = 0;i < ordercellNumber;i++){
        			cell = row.createCell(i);
        			cell.setCellValue(orderHeader[i]);//设置第0行第k列的值
        			sheet.setColumnWidth(i,8000);//设置列的宽度
        			font.setColor(HSSFFont.COLOR_NORMAL);
        			font.setFontHeight((short)200);
        			style1.setFont(font);//设置字体风格
        			cell.setCellStyle(style1);
        		}
        		for(int i = 0;i < orderList.size();i++){
        			Order order = orderList.get(i);
        			row = sheet.createRow((short)(i+1));//创建i+1行
        			row.setHeight((short)400);//设置行高
        			if(order.getCodes() != null){
        				cell = row.createCell(0);//创建地i+1行
        				cell.setCellValue(order.getCodes());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(order.getFoodNum() != null){
        				cell = row.createCell(1);//创建地i+1行
        				cell.setCellValue(order.getFoodNum());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(order.getTotalMoney() != null){
        				cell = row.createCell(2);//创建地i+1行
        				cell.setCellValue(order.getTotalMoney());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(order.getDinnerTime() != null){
        				cell = row.createCell(3);//创建地i+1行
        				cell.setCellValue(order.getDinnerTime().toString());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(order.getState() != null){
        				cell = row.createCell(4);//创建地i+1行
        				cell.setCellValue(order.getState());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(order.getUser() != null){
        				cell = row.createCell(5);//创建地i+1行
        				cell.setCellValue(order.getUser().getUsername());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(order.getSeat() != null){
        				cell = row.createCell(6);//创建地i+1行
        				cell.setCellValue(order.getSeat().getId());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        		}
        	}
        }
        if(check5 != null){
        	String [] logtHeader = {"内容","时间","日志类型","操作类型","操作类名"};
    		short logcellNumber = (short)logtHeader.length;//表的列数
            HSSFSheet sheet = workbook.createSheet("sheet5");        //创建一个sheet
            HSSFHeader header = sheet.getHeader();//设置sheet的头
            if(logList.size() < 1){
        		header.setCenter("导出失败");
        	}else{
        		header.setCenter("日志表");
        		row = sheet.createRow(0);
        		row.setHeight((short)400);
        		for(int i = 0;i < logcellNumber;i++){
        			cell = row.createCell(i);
        			cell.setCellValue(logtHeader[i]);//设置第0行第k列的值
        			sheet.setColumnWidth(i,8000);//设置列的宽度
        			font.setColor(HSSFFont.COLOR_NORMAL);
        			font.setFontHeight((short)200);
        			style1.setFont(font);//设置字体风格
        			cell.setCellStyle(style1);
        		}
        		for(int i = 0;i < logList.size();i++){
        			Log log = logList.get(i);
        			row = sheet.createRow((short)(i+1));//创建i+1行
        			row.setHeight((short)400);//设置行高
        			if(log.getContent() != null){
        				cell = row.createCell(0);//创建地i+1行
        				cell.setCellValue(log.getContent());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(log.getDate() != null){
        				cell = row.createCell(1);//创建地i+1行
        				cell.setCellValue(log.getDate().toString());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(log.getType() != null){
        				cell = row.createCell(2);//创建地i+1行
        				cell.setCellValue(log.getType());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(log.getOperationType() != null){
        				cell = row.createCell(3);//创建地i+1行
        				cell.setCellValue(log.getOperationType());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        			if(log.getClassName() != null){
        				cell = row.createCell(4);//创建地i+1行
        				cell.setCellValue(log.getClassName());//设置地i+1行第1列的值
        				cell.setCellStyle(style);//设置风格
        			}
        		}
        	}
        }
        return workbook;
  }
}
