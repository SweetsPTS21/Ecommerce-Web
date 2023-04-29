package controller;

import dao.VNPayDAO;
import ultilities.Tags;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LuuGiaoDichControl", value = "/luuGiaoDich")
public class LuuGiaoDichControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            int orderId = Tags.getOrderId();
            System.out.println("orderId: " + orderId);

            if(orderId != 0) {
                String vnp_TxnRef = request.getParameter("vnp_TxnRef");
                String vnp_Amount = request.getParameter("vnp_Amount");
                String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
                String vnp_BankCode = request.getParameter("vnp_BankCode");
                String vnp_PayDate = request.getParameter("vnp_PayDate");
                String status = request.getParameter("status");
                System.out.println("orserId" + orderId + "\n"
                        + "vnp_TxnRef: " + vnp_TxnRef + "\n"
                        + "vnp_Amount: " + vnp_Amount + "\n"
                        + "vnp_OrderInfo: " + vnp_OrderInfo + "\n"
                        + "vnp_ResponseCode: " + vnp_ResponseCode + "\n"
                        + "vnp_TransactionNo: " + vnp_TransactionNo + "\n"
                        + "vnp_BankCode: " + vnp_BankCode + "\n"
                        + "vnp_PayDate: " + vnp_PayDate + "\n");
                VNPayDAO vnpayDAO = new VNPayDAO();
                vnpayDAO.addVNPay(orderId, vnp_TxnRef, vnp_Amount, vnp_OrderInfo, vnp_ResponseCode, vnp_TransactionNo, vnp_BankCode, vnp_PayDate);
            }
            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
