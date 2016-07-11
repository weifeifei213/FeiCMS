package com.jwebsite.pub; 
     
import java.io.*;
import java.sql.*;
import java.util.*;
public class CharType{
  /**调试信息显示开关*/
  public static boolean DEBUG=true;
   private static FileWriter back_log ;
   static {
         try {
         java.text.SimpleDateFormat dateform = new java.text.SimpleDateFormat("yyyy-MM-dd");
         String log_day = dateform.format(new java.util.Date());
            back_log=new FileWriter("./back" + log_day + ".log");
         }catch (Exception e) {e.printStackTrace();}
   }
   
	public static void GS_Log(String s){
		if (DEBUG){
		   try {
		      back_log.write(s+"\n");
		      back_log.flush();
		      System.out.println(s);
		   }catch (Exception e) {e.printStackTrace();}
			//System.out.println(s);
		}
	}
	
public final static int GBCODE   = 1111;
public final static int UNICODE  = 2222;
public CharType() {
}
/**
描述: 判断是GB码还是UNICOE码<br>
@param         String<br>
@return        int <br>
@author        sundapeng<br>
@since         2002-09-30<br>
**/
public static int isGB_Unicode(String sInput){
    int i=0;
    int iChar=0;
    int iLength=sInput.length();
    while (i<iLength) {
        iChar=(int)sInput.charAt(i);
        if (iChar>128 || iChar<0) {
           break;
        }
        i++;
    }
    if (i==iLength)  {
        return (GBCODE+UNICODE);  //sInput is empty or only ASCII string.
    }
    if ((iChar & 0xff00)!=0xff00 && (iChar & 0xff00)!=0x0) {
        return (UNICODE);
    }else {
        iChar = iChar & 0x00ff;
        if (iChar>160 && iChar<248)  {
            return (GBCODE);
        }else {
            return (UNICODE);
        }
    }
}
/**
描述: Unicode转为GB码<br>
@param         String<br>
@return        String<br>
@author        sundapeng<br>
@since         2002-09-30<br>
**/
public static String UnicodeToGB(String sInput)
{
    int i;
    int iLength;
    if(sInput==null)    return "";
    
    if (isGB_Unicode(sInput)==UNICODE)  {
         return sInput;
    }
    else {
         iLength=sInput.length();
         byte[] bBytes=new byte[iLength];
         for (i=0;i<iLength;i++)  {
              bBytes[i]=(byte)sInput.charAt(i);
         }
         try {
              return (new String(bBytes,"GB2312"));
         }catch(Exception e) {
              System.out.println("characters convert failed!  "+e);
              return null;
         }
    }
}

String GBByteToUnicode(byte[] btInput,int iLength) {
    String sOutput="";
    for (int i=0;i<iLength;i++) {
        if (btInput[i]!=0x0d)  {
            sOutput=sOutput+(char)(0x00ff&btInput[i]);
        }
    }
    return GBToUnicode(sOutput);
}


public static String GBToUnicode(String sInput)
{

    int iLength=0;
    int i,j;
    short stChar;
    String stringTemp="";
    if(sInput==null)    return "";
    if (isGB_Unicode(sInput)==GBCODE)  {
         return sInput;
    }
    else {
         // get the unicode string length
         j=sInput.length();
         for (i=0;i<j;i++) {
              stChar=(short)sInput.charAt(i);
              if (stChar<128 && stChar>-1)  {
                   iLength++;
              }else {
                   iLength+=2;
              }
         }

         try {
              byte[] bBytes=sInput.getBytes("GB2312");
              for(i=0;i<iLength;i++)  {
                   stringTemp=stringTemp+(char)bBytes[i];
              }
         }catch(Exception e) {
              System.out.println("CHARACTER CONVERT FAILED! "+e);
              return null;
         }
         return (stringTemp);
    }
}


public static byte[] UnicodeToGBByte(String sInput)   {
    String sOutput="";
    int iLength=sInput.length();
    char cChar;
    for (int i=0;i<iLength;i++) {
        cChar=sInput.charAt(i);
        if (cChar=='\n') {
            if (isGB_Unicode(sInput)!=GBCODE) {
                sOutput=sOutput+(char)0x0d+(char)0x0a;
            }
        }  else {
            sOutput=sOutput+cChar;
        }
    }

    sOutput=UnicodeToGB(sOutput);
    iLength=sOutput.length();
    byte[]  bBytes=new byte[iLength];
    for(int i=0;i<iLength;i++)  {
        bBytes[i]=(byte)sOutput.charAt(i);
    }
    return (bBytes);
}


public static int GBByteLength(String sInput)   {

    if (isGB_Unicode(sInput)==GBCODE)  {
        return(sInput.length());
    }

    int iLength=0;
    int iInputLength=sInput.length();
    short stChar;
    short stReturn=(short)'\n';
    for (int i=0;i<iInputLength;i++)    {
        stChar=(short)sInput.charAt(i);
        if (stChar<128 && stChar>-1 && stChar!=stReturn)    {
            iLength++;
        }else {
            iLength=iLength+2;
        }
    }
    return (iLength);
}

/**
描述: 在一个长字符串中按指定的长度加入回车符<br>
@param         String,int<br>
@return        String<br>
@author        Leon Shi<br>
@since         2002-10-13<br>
**/
	public static String sepaString(String input,int leng)
 	{
 		if(input == null) return null;
 		int str_leng = input.length();
 		if(str_leng <= leng) return input;
 		
 		int count = (str_leng - 1)/leng;
 		String ret = "";
 		for(int i = 0;i < count;i++)
 			ret += input.substring(i * leng,(i+1)*leng) + "\n";
 		ret += input.substring(count * leng,str_leng);
	
 		return ret;
 		
 	}
	
	/*** 
	* 字符串的单个字符是否是汉字 
	* @param c 
	* @return 
	*/ 
	public static int ascii(String c) 
	{ 
	byte x[] = new byte[2]; 
	x = c.getBytes(); 

	if (null == x || x.length > 2 || x.length <=0) 
	{ 
	return 0; 
	} 

	if( x.length == 1){ //英文字符 
	return x[0]; 
	} 

	if (x.length == 2) 
	{ 
	int hightByte = 256 + x[0]; 
	int lowByte = 256 + x[1]; 
	int ascii = (256 * hightByte + lowByte) - 256 * 256; 
	return ascii; 
	} 

	return 0; 
	} 

	/*** 
	* 显示字符串的前N个字符 
	* 此处着重处理了英文字符和中文字符在显示上的一致性； 
	* 2个英文字符和一个汉字占据的宽度一致; 
	*/ 
	public static String limitStr(String string, int size) 
	{ 
	if (null != string) 
	{ 
	//string = goodStr(string); 
	if (string.length() <= size) 
	{ 
	return string; 
	} 
	else 
	{ 
	StringBuffer buffer = new StringBuffer(); 
	double len = 0; 
	for (int i = 0; i < string.length(); i++) 
	{ 
    //	是否汉字 ascii<0 
	String str = string.substring(i,i+1); 
	if (ascii(str) < 0 ) 
	{ 
	buffer.append(str); 
	len ++ ; 
	} 
	else 
	{ 
	buffer.append(str); 
	len = len + 0.5; 
	} 

	if (len >= size) break; 
	} 
	return buffer.toString(); 
	} 

	} 
	return ""; 
	} 
}//charType

