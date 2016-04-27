package com.projection.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
public class FormatUtil {
	public static String form(String unique) throws ParseException{
		String formatDate=null;
		if(unique != null){
			String time=unique.substring(1, 9);
			  SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-HH-dd");  
			    SimpleDateFormat formatter2=new SimpleDateFormat("yyyyHHdd");  
			    time=formatter1.format(formatter2.parse(time));  
			    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
			    
			    Date t = null;  
			    try{  
			    	  t = formatter.parse(time);  
			    	  }catch(ParseException e){  
			    	  }  
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
			    Calendar calendar = Calendar.getInstance();//日历对象
			    calendar.setTime(t);//设置当前日期
			    calendar.add(Calendar.MONTH, 2);//月份加2
			    formatDate=sdf.format(calendar.getTime());
			
		}
		return formatDate;
	}
}
