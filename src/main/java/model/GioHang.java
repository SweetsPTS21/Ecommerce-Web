package model;

import java.util.List;

public class GioHang extends SanPham {

    private int soLuongGioHang = 0;
    private int id;
    public GioHang() {

    }

    public int getSoLuongGioHang() {
        return soLuongGioHang;
    }

    public void setSoLuongGioHang(int soLuongGioHang) {
        this.soLuongGioHang = soLuongGioHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}
