package com.jiat.ndcamera.service;

import com.jiat.ndcamera.util.Env;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailService {
    public static void sendMail(String to, String data){
        Properties properties = new Properties();
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.put("mail.smtp.host", Env.get("mailtrap.host"));
        properties.put("mail.smtp.port", Env.get("mailtrap.port"));

        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Env.get("mailtrap.user"), Env.get("mailtrap.password"));
            }
        };

        Session session = Session.getInstance(properties,authenticator);
        try{
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("hello@ndcamera.com"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setText("Hello!");

            Transport.send(message);
        }catch (MessagingException e){
            e.printStackTrace();
        }
    }
}
