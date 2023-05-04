package controller;

import javax.activation.DataHandler;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;

@WebServlet(name = "GuiMailControl", value = "/lienHe")
public class GuiMailControl extends HttpServlet {

    public GuiMailControl(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("LienHe.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String username = "bachbnvn123@gmail.com";
        final String password = "qicyaknmbxjjlmge ";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
//            props.put("mail.debug", "true");
        props.put("mail.smtps.ssl.trust", "*");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username,password);
            }
        });
        String emailTo = req.getParameter("email");
        String emailName = req.getParameter("emailName");
        try{
            Message message = new MimeMessage(session) ;
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(emailTo)
            );
            message.setSubject("Nhóm Lập trình 07 xin chào");
            message.setContent("Cảm ơn "+emailName+ " đã quan tâm đến sản phẩm của đội ngũ nhóm 07\n"
                    , "text/plain; charset=UTF-8");
            Transport.send(message);
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}