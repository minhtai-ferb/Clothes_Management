/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author minht
 */
public class Email {
    //Email: nguyenferbvn@gmail.com
    //Passwork: plotdbzxrudobafc

    public boolean sendEmail(String to, String header, String content) {
        boolean check = false;
        final String from = "nguyenferbvn@gmail.com";
        final String password = "plotdbzxrudobafc";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");  //SMTP HOST
        props.put("mail.smtp.port", "587");  //TLS 587 SSL 465\
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //Tài khoản gmail
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }

        };

        //Đăng nhập vào được gmail
        Session session = Session.getInstance(props, auth);

        //tạo 1 tin nhắn
        MimeMessage msg = new MimeMessage(session);
        try {
            //Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //Người gửi
            msg.setFrom(from);
            //Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //Tiêu đề
            msg.setSubject(header);

            //Nội dung
            //msg.setText("", "UTF-8");
            msg.setContent(content, "text/HTML; charset=UTF-8"); //code html

            //Gửi email
            Transport.send(msg);

            check = true;
        } catch (Exception e) {
            check = false;
            e.printStackTrace();
        }
        return check;
    }

}
