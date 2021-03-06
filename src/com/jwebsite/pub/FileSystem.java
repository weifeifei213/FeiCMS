package com.jwebsite.pub;

import java.io.File;
import java.util.ArrayList;

public class FileSystem {
  public static ArrayList filelist = new ArrayList();

	public static void main(String[] args) {
		long a = System.currentTimeMillis();
		refreshFileList("c:\\java");
		System.out.println(System.currentTimeMillis() - a);
	}

	public static void refreshFileList(String strPath) {
		File dir = new File(strPath);
		File[] files = dir.listFiles();
		if (files == null)
			return;
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				refreshFileList(files[i].getAbsolutePath());
			} else {
				String strFileName = files[i].getAbsolutePath().toLowerCase();
				
				
				System.out.println("---" + strFileName);
				filelist.add(files[i].getAbsolutePath());
			}
		}
	}
}
