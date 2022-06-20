package model;

public class ChiTiet {
    private int donDatHangId;
    private int sanPhamId;
    private int soluong;


    public ChiTiet() {
    }

    public ChiTiet(int donDatHangId, int sanPhamId, int soluong) {
        this.donDatHangId = donDatHangId;
        this.sanPhamId = sanPhamId;
        this.soluong = soluong;
    }

    public int getDonDatHangId() {
        return donDatHangId;
    }

    public void setDonDatHangId(int donDatHangId) {
        this.donDatHangId = donDatHangId;
    }

    public int getsanPhamId() {
        return sanPhamId;
    }

    public void setSanPhamId(int sanPhamId) {
        this.sanPhamId = sanPhamId;
    }

    public int getQuantity() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
}
