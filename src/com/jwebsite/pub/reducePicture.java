package com.jwebsite.pub;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.persistence.Entity;
import javax.swing.ImageIcon;

@Entity
public class reducePicture {
	public static void main(String[] args) throws IOException {
		new reducePicture().start("D:\\8.jpg", 100, 0, null);
	}

	public void start(String inUrl, int width, int height, String watermark)
			throws IOException {
		ImageIcon icon = new ImageIcon(inUrl);
		Image image = icon.getImage(); // 得到文件对应的Image对象

		// 约束比例保证不变形
	    if(image.getWidth(null)>image.getHeight(null)){       	
        	
        	height = image.getHeight(null) * width / image.getWidth(null);
        }
	    if(image.getWidth(null)<image.getHeight(null)){       	
        	
        	width = image.getWidth(null) * height / image.getHeight(null);
        }	
	    
	    
		// 实现缩略功能
		/*
		 * 构造一个预定义图像类型的BufferedImage对象
		 * 创建Graphics2D对象，用于在BufferedImage对象上绘图（即绘需缩小的Image对象）
		 */
		BufferedImage bi = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_BGR);
		Graphics2D g = bi.createGraphics();
		Color c = g.getColor();
		g.setColor(Color.white);
		g.fillRect(0, 0, width, height);
		g.drawImage(image, 0, 0, width, height, null);
		g.dispose(); // 释放图形上下文使用的系统资源

		// 实现水印功能
		/*
		 * 获取Graphics对象 在图片上绘制文字
		 */
		if (watermark != null) {
			Graphics gg = bi.getGraphics();
			Font font = new Font("lqh", Font.BOLD, 48);
			gg.setFont(font);
			gg.setColor(Color.black);
			gg.drawString(watermark, 10, 200);
			gg.dispose();
		}
		// 生成文件名
		String outUrl = inUrl.replace(".jpg", "_S.jpg");

		// 输出图片
		File output = new File(outUrl);
		output.createNewFile();
		ImageIO.write(bi, "jpg", output);
	}
}