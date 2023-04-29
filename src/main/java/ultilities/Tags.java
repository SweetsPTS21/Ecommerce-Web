package ultilities;

public class Tags {
    private static int orderId = 0;

    public static int getOrderId() {
        return orderId;
    }

    public static void setOrderId(int orderId) {
        Tags.orderId = orderId;
    }
}
