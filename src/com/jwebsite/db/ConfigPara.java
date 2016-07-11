package com.jwebsite.db;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/** */
/**
 * 读取properties文件
 * 
 * @author Qutr
 * 
 */
public class ConfigPara {
	private Properties propertie;
	private FileInputStream inputFile;
	private FileOutputStream outputFile;
	private InputStream is;

	/** */
	/**
	 * 初始化Configuration类
	 */
	public ConfigPara() {
		propertie = new Properties();
	}

	/** */
	/**
	 * 初始化Configuration类
	 * 
	 * @param filePath
	 *            要读取的配置文件的路径+名称
	 * @throws IOException
	 */
	public ConfigPara(String filePath) throws Exception {
		propertie = new Properties();

	/*	Properties sysProperties = System.getProperties();
		Object object = sysProperties.get("os.name");
		if ("Windows XP".equals(String.valueOf(object))) {
			inputFile = new FileInputStream(ConfigPara.class.getResource("/")
					.getPath().toString().substring(1)
					+ filePath);
		} else {
			inputFile = new FileInputStream(ConfigPara.class.getResource("/")
					.getPath().toString()
					+ filePath);
		}*/
		is = ConfigPara.class.getClassLoader().getResourceAsStream(filePath);
		if (is == null) {
			System.out.println("配置文件不存在，请检查文件名或路径是否正确！");
		}
		//sysProperties = null;
		try {

			propertie.load(is);

		} catch (IOException e) {
			System.out.println("配置文件加载失败，请检查文件名或路径是否正确！");
		}
		
		try {
			is.close();
		} catch (IOException e) {
			System.out.println("配置文件文件流关闭失败！");
		}
	}// end ReadConfigInfo(...)
	
	/** */
	/**
	 * 重载函数，得到key的值
	 * 
	 * @param key
	 *            取得其值的键
	 * @return key的值
	 */
	public String getValue(String key) {
		if (propertie.containsKey(key)) {
			String value = propertie.getProperty(key);// 得到某一属性的值
			return value;
		} else
			return "";
	}// end getValue(...)

	/** */
	/**
	 * 重载函数，得到key的值
	 * 
	 * @param fileName
	 *            properties文件的路径+文件名
	 * @param key
	 *            取得其值的键
	 * @return key的值
	 */
	public String getValue(String fileName, String key) {
		try {
			String value = "";
			inputFile = new FileInputStream(fileName);
			propertie.load(inputFile);
			inputFile.close();
			if (propertie.containsKey(key)) {
				value = propertie.getProperty(key);
				return value;
			} else
				return value;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "";
		}
	}// end getValue(...)

	/** */
	/**
	 * 清除properties文件中所有的key和其值
	 */
	public void clear() {
		propertie.clear();
	}// end clear();

	/** */
	/**
	 * 改变或添加一个key的值，当key存在于properties文件中时该key的值被value所代替， 当key不存在时，该key的值是value
	 * 
	 * @param key
	 *            要存入的键
	 * @param value
	 *            要存入的值
	 */
	public void setValue(String key, String value) {
		propertie.setProperty(key, value);
	}// end setValue(...)

	/** */
	/**
	 * 将更改后的文件数据存入指定的文件中，该文件可以事先不存在。
	 * 
	 * @param fileName
	 *            文件路径+文件名称
	 * @param description
	 *            对该文件的描述
	 * @throws Exception
	 */
	public void saveFile(String fileName, String description) throws Exception {

		Properties sysProperties = System.getProperties();
		Object object = sysProperties.get("os.name");
		if ("Windows XP".equals(String.valueOf(object))) {
			outputFile = new FileOutputStream(ConfigPara.class.getResource("/")
					.getPath().toString().substring(1)
					+ fileName);
		} else {
			outputFile = new FileOutputStream(ConfigPara.class.getResource("/")
					.getPath().toString()
					+ fileName);
		}
		sysProperties = null;
		propertie.store(outputFile, description);
		outputFile.close();

	}// end saveFile(...)
	
	 public static void main(String[] args) throws Exception { 
		 //ConfigPara rc =null;
		 //String filePath = "dbconn.properties"; 
		 //rc = new ConfigPara(filePath);
	  //String host = rc.getValue("host"); 
	  //System.out.println("host = " + host);
	  //String Driver = rc.getValue("Driver"); 
	  //System.out.println("Driver = " + Driver);
	  
	  //String dbname = rc.getValue("dbname"); 
	  //System.out.println("dbname = " + dbname);
	 }// end main()
	 

}
