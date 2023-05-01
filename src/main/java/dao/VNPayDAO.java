package dao;

import java.sql.PreparedStatement;

public class VNPayDAO extends DBconnection{

    public void addVNPay(int orderId, String vnp_TxnRef, String vnp_Amount, String vnp_OrderInfo, String vnp_ResponseCode, String vnp_TransactionNo, String vnp_BankCode, String vnp_PayDate) {

        String query = "INSERT INTO vnp_return(orderId, vnp_TxnRef, vnp_Amount, vnp_OrderInfo, vnp_ResponseCode, vnp_TransactionNo, vnp_BankCode, vnp_PayDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        String query2 = "UPDATE order SET paymentId = ?, isPaid = ? WHERE orderId = ?;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.setString(2, vnp_TxnRef);
            ps.setString(3, vnp_Amount);
            ps.setString(4, vnp_OrderInfo);
            ps.setString(5, vnp_ResponseCode);
            ps.setString(6, vnp_TransactionNo);
            ps.setString(7, vnp_BankCode);
            ps.setString(8, vnp_PayDate);

            ps.executeUpdate();

            PreparedStatement ps2 = connection.prepareStatement(query2);
            ps2.setInt(1, 1);
            ps2.setInt(2, 1);
            ps2.setInt(3, orderId);
            ps2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteVNPay(int orderId) {
        String sql = "DELETE FROM vnp_return WHERE orderId = ?;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
