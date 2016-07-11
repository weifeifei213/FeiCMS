package com.jwebsite.pub;
import java.io.File;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
public class TransformFiletoHtml {
	int WORD_HTML = 10;
	int WORD_TXT = 7;
	int EXCEL_HTML = 44;

	/**
	 * WORD转HTML
	 * 
	 * @param docfile
	 *            WORD文件全路径
	 * @param htmlfile
	 *            转换后HTML存放路径
	 */
	public void wordToHtml(String docfile, String htmlfile) {
		ActiveXComponent app = new ActiveXComponent("Word.Application"); // 启动word
		try {

			app.setProperty("Visible", new Variant(false));
			Dispatch docs = app.getProperty("Documents").toDispatch();
			Dispatch doc = Dispatch.invoke(
					docs,
					"Open",
					Dispatch.Method,
					new Object[] { docfile, new Variant(false),
							new Variant(true) }, new int[1]).toDispatch();		
			
			Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {
					htmlfile, new Variant(WORD_HTML) }, new int[1]);
			Variant f = new Variant(false);
			Dispatch.call(doc, "Close", f);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			app.invoke("Quit", new Variant[] {});
		}
	}

	
	public void getWordBookMarker(){
		
		ActiveXComponent app = null;
		Dispatch doc = null;
		try {
			ComThread.InitSTA();

			app = new ActiveXComponent("Word.Application");
			app.setProperty("Visible", new Variant(false));
			Dispatch docs = app.getProperty("Documents").toDispatch();
//			doc = Dispatch.invoke(
//					docs,
//					"Open",
//					Dispatch.Method,
//					//new Object[] {this.templateFile, new Variant(false), new Variant(true)},
//					new int[1]).toDispatch();

			Dispatch bookmarks = Dispatch.get(doc, "Bookmarks").toDispatch();
			System.out.println("bookmarks counts = " + Dispatch.get(bookmarks, "Count").getInt());
			for (int i = 1; i <= Dispatch.get(bookmarks, "Count").getInt(); i++) {
				Dispatch item = Dispatch.call(bookmarks, "Item", i).toDispatch();
				Dispatch range = Dispatch.get(item, "Range").toDispatch();
				System.out.println(Dispatch.get(range, "Text").getString());
			}
		} catch (Exception e) {
			//throw e;
		} finally {
			if (doc != null) {
				Dispatch.call(doc, "Close", new Variant(true));
			}
			if (app != null) {
				Dispatch.call(app, "Quit");
			}
		ComThread.Release();
		}
		
		
	}
	
	
	
	
	
	/**
	 * EXCEL转HTML
	 * 
	 * @param xlsfile
	 *            EXCEL文件全路径
	 * @param htmlfile
	 *            转换后HTML存放路径
	 */
	public void excelToHtml(String xlsfile, String htmlfile) {
		ActiveXComponent app = new ActiveXComponent("Excel.Application"); // 启动excel
		try {
			app.setProperty("Visible", new Variant(false));

			Dispatch excels = app.getProperty("Workbooks").toDispatch();
			Dispatch excel = Dispatch.invoke(
					excels,
					"Open",
					Dispatch.Method,
					new Object[] { xlsfile, new Variant(false),
							new Variant(true) }, new int[1]).toDispatch();
			Dispatch.invoke(excel, "SaveAs", Dispatch.Method, new Object[] {
					htmlfile, new Variant(EXCEL_HTML) }, new int[1]);
			Variant f = new Variant(false);
			Dispatch.call(excel, "Close", f);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			app.invoke("Quit", new Variant[] {});
		}
	}

	/**
	 * /删除指定文件夹
	 * 
	 * @param folderPath
	 *            文件夹全路径
	 * @param htmlfile
	 *            转换后HTML存放路径
	 */
	public void delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // 删除空文件夹
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * /删除指定文件夹下所有文件
	 * 
	 * @param path
	 *            文件全路径
	 */
	public boolean delAllFile(String path) {
		boolean flag = false;
		File file = new File(path);
		if (!file.exists()) {
			return flag;
		}
		if (!file.isDirectory()) {
			return flag;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]); // 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]); // 再删除空文件夹
				flag = true;
			}
		}
		return flag;
	}
	
	public static void main(String[] args) {
		
		TransformFiletoHtml t=new TransformFiletoHtml();
		t.wordToHtml("E:/test1.doc", "E:/test.html");
		
		
	}
	
	
}