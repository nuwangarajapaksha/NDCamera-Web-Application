package com.jiat.ndcamera.providers;

import com.jiat.ndcamera.mail.Mailable;
import com.jiat.ndcamera.util.Env;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import java.util.concurrent.*;

public class MailServiceProvider {
    private Properties properties = new Properties();
    private Authenticator authenticator;
    private static MailServiceProvider mailServiceProvider;
    private ThreadPoolExecutor executor;
    private BlockingQueue<Runnable> blockingQueue = new LinkedBlockingQueue<Runnable>();


    private MailServiceProvider() {
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", Env.get("mailtrap.host"));
        properties.put("mail.smtp.port", Env.get("mailtrap.port"));
    }

    public static MailServiceProvider getInstance() {
        if (mailServiceProvider == null)
            mailServiceProvider = new MailServiceProvider();
        return mailServiceProvider;
    }

    public void start() {
        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Env.get("mailtrap.user"), Env.get("mailtrap.password"));
            }
        };
        executor = new ThreadPoolExecutor(5, 10, 5,
                TimeUnit.SECONDS, blockingQueue, new ThreadPoolExecutor.AbortPolicy());
        executor.prestartAllCoreThreads();
        System.out.println("MailServiceProvider: Running...");
    }

    public void sendMail(Mailable mailable){
        blockingQueue.offer(mailable);
    }

    public Properties getProperties(){
        return properties;
    }

    public Authenticator getAuthenticator(){
        return authenticator;
    }

    public void shutdown(){
        if(executor != null){
            executor.shutdown();
        }
    }
}
