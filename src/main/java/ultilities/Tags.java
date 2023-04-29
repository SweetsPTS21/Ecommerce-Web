package ultilities;

public class Tags {
    public static String ENCRYPT_KEY = "WeBteaM07";
    private static int orderId = 0;

    public static int getOrderId() {
        return orderId;
    }

    public static void setOrderId(int orderId) {
        Tags.orderId = orderId;
    }
}
