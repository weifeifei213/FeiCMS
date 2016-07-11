package com.jwebsite.daoimpl;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.jwebsite.pub.CharType;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Date d=new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  EE");
		
		sdf.format(d);
		
		
		
		System.out.println(sdf.format(d));
		
		Calendar cal=Calendar.getInstance();
		
		Date d1=cal.getTime();
		cal.add(Calendar.DATE, -1);
		Date d2=cal.getTime();
		cal.add(Calendar.DATE, -2);
		Date d3=cal.getTime();
		
		
		cal.add(Calendar.WEEK_OF_YEAR, -2);
		
		System.out.println(d1);
		System.out.println(d2);
		System.out.println(d3);
		
		System.out.println(sdf.format(d1));
		
		
		
		
		
	}

}
