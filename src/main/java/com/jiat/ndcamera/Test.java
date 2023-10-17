package com.jiat.ndcamera;

import com.jiat.ndcamera.service.MailService;
import com.jiat.ndcamera.util.Encryption;
import com.jiat.ndcamera.util.Env;
import org.apache.commons.lang3.RandomStringUtils;

import java.util.UUID;

public class Test {
    public static void main(String[] args) {
//        Encryption.encrypt("1234");
//        String name = Env.get("name");
//        System.out.println(name);
//        MailService.sendMail("nuwangarajapaksha@gmail.com",null);

//        UUID uuid = UUID.randomUUID();
//        System.out.println(uuid.toString());
//
//        String s = RandomStringUtils.randomAlphanumeric(20);
//        System.out.println(s);

        System.out.println(Env.get("app.base_url"));

    }

}
