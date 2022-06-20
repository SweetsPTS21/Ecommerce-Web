package model;

import java.sql.ResultSet;

public class SanPham {
    private int id;
    private String ten;
    private String mota;
    private int gia;
    private int soluong;
    private String anh;
    private String loai;


    public SanPham() {

    }



    public SanPham(int id, String ten, String mota, int gia, int soluong, String anh, String loai) {
        this.id = id;
        this.ten = ten;
        this.mota = mota;
        this.gia = gia;
        this.soluong = soluong;
        this.anh = anh;
        this.loai = loai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public void increaseSoluong() {
        this.soluong++;
    }
}
