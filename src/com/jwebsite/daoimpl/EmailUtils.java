package com.jwebsite.daoimpl;

import javax.mail.*;
import javax.mail.internet.*;

import com.jwebsite.vo.Email;

import java.util.*;

public class EmailUtils {
	
	public void send(Email em ) {
		
		try {
			Authenticator auth = new PopupAuthenticator();
			Properties mailProps = new Properties();
			mailProps.put("mail.smtp.host", "smtp.126.com");
			mailProps.put("mail.smtp.auth", "true");
			mailProps.put("username", "gslzqxj");
			mailProps.put("password", "123456");
			Session mailSession = Session.getDefaultInstance(mailProps, auth);
			MimeMessage message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress("gslzqxj@126.com"));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(em.getEmailAddress()));
			message.setSubject("匿名邮件");
			MimeMultipart multi = new MimeMultipart();
			BodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(em.getValue());
			multi.addBodyPart(textBodyPart);
			message.setContent(multi);
			message.saveChanges();
			Transport.send(message);
		} catch (Exception ex) {
			System.err.println("邮件发送失败的原因是：" + ex.getMessage());
			System.err.println("具体错误原因：");
			ex.printStackTrace(System.err);
		}
	}
	
	class PopupAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			String username = "gslzqxj"; // 163邮箱登录帐号
			String pwd = "123456"; // 登录密码
			return new PasswordAuthentication(username, pwd);
		}
	}
}

