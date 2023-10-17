package com.jiat.ndcamera.util;

import com.jiat.ndcamera.entity.BusinessSetting;
import org.apache.commons.text.StringEscapeUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BSUtil {
    private static Map<String, Object> businessSettings = new HashMap<>();

    static {
        load();
    }

    private static void load(){
        businessSettings.clear();
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> list = session.createQuery("SELECT bs.name,bs.value FROM business_settings bs").list();
        list.forEach(o ->{
            businessSettings.put(o[0].toString(), o[1]);
        });
        session.close();
        System.out.println("BusinessSetting loaded...");
    }

    public static String getString(String key){
        return businessSettings.get(key).toString();
    }

    public static Object get(String key){
        return businessSettings.get(key);
    }

    public static String getEscape(String value){
        return StringEscapeUtils.escapeHtml4(value);
    }

    public static String getUnescape(String key){
        String data = getString(key);
        return StringEscapeUtils.unescapeHtml4(data);
    }

    public static List getUnescapeArray(String key, String split){
        String s = getString(key);
        String us = StringEscapeUtils.unescapeHtml4(s);
        String[] strings = us.split(split);
        return Arrays.asList(strings);
    }

    public static List getArray(String key, String split){
        String s = getString(key);
        String[] strings = s.split(split);
        return Arrays.asList(strings);
    }

    public static void reload(){
        load();
    }

    public static void updateBusinessSetting(String name, String newValue) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        BusinessSetting businessSetting = session
                .createQuery("SELECT bs FROM business_settings bs WHERE bs.name = :name", BusinessSetting.class)
                .setParameter("name", name)
                .uniqueResult();

        if (businessSetting != null) {
            businessSetting.setValue(newValue);
            session.update(businessSetting);
        }

        transaction.commit();
        session.close();

        reload();
    }
}
