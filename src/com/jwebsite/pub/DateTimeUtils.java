package com.jwebsite.pub;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateTimeUtils {
	/**
	 * 取得但前时间 时间模式 yyyy-MM-dd HH:mm:ss 
	 * G 年代标志符 
	 * y 年 
	 * M 月 
	 * d 日 
	 * h 时 在上午或下午 (1~12) 
	 * H 时 在一天中 (0~23) 
	 * m 分 
	 * s 秒 
	 * S 毫秒 
	 * E 星期 
	 * D 一年中的第几天
	 * F 一月中第几个星期几
	 * w 一年中第几个星期 
	 * W 一月中第几个星期
	 * a 上午 / 下午 标记符
	 * k 时 在一天中 (1~24) 
	 * K 时 在上午或下午 (0~11) 
	 * z 时区
	 * */
	public static String getDateTime(String pattern) {
		String nowDateTime = "";
		// 取得但前时间
		GregorianCalendar gc = new GregorianCalendar();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		nowDateTime = sdf.format(d);
		return nowDateTime;
	}

}
