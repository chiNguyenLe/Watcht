/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Cart;
import entities.Item;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class SendMailMachine {

    public static String EMAIL_SENDER = "endlesslovefor123@gmail.com";
    public static String PASSWORD = "$@00yeu@nh";
    public static String HOST_NAME = "smtp.googlemail.com";

    public static void sendMail(Cart cart, String recipientEmail) {
        Email email = new SimpleEmail();

        email.setHostName(HOST_NAME);
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator(EMAIL_SENDER, PASSWORD));
        email.setSSLOnConnect(true);

        String subject = "Thông tin hóa đơn";
        String content = "\t\t\tTRUNG TÂM MUA SẮM BITTORRENT\n\nChi tiết đơn hàng của bạn: \n";
        for (Map.Entry<Integer, Item> entrySet : cart.getCartItem().entrySet()) {
            Item item = entrySet.getValue();
            content += item.getWatch().getName() + "\t\t\t\t\t\t" + item.getQuantity() + " x " +  ((int) item.getWatch().getPrice()) + "000 VND\n";
        }
        content += "Tổng hóa đơn: " + ((int) cart.sumPrice()) + "000 VND";
        try {
            email.setFrom(EMAIL_SENDER);
            email.setCharset("UTF-8");
            email.setSubject(subject);
            email.setMsg(content);
            
            email.addTo(recipientEmail);

            email.send();
        } catch (EmailException ex) {

            ex.printStackTrace();
        }
    }



}
