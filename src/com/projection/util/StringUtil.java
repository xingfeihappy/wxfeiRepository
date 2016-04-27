package com.projection.util;

public class StringUtil {
	public static String trim(String str){
		if(str == null){
			return "";
		}
		return str.replaceAll(" ","");
	}

}
