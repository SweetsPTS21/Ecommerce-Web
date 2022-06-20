package model;

public class DonDatHang {
    private int id;
    private int nguoiDungId;

    private String ten;
    private String sodienthoai;
    private String diachi;
    private int tongTien;
    private String ngay;

    private String trangthai;

    public DonDatHang() {
    }

    public DonDatHang(int id, int nguoiDungId, String ten, String sodienthoai, String diachi, int tongTien, String ngay, String trangthai) {
        this.id = id;
        this.nguoiDungId = nguoiDungId;
        this.ten = ten;
        this.sodienthoai = sodienthoai;
        this.diachi = diachi;
        this.tongTien = tongTien;
        this.ngay = ngay;
        this.trangthai = trangthai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNguoiDungId() {
        return nguoiDungId;
    }

    public void setNguoiDungId(int nguoiDungId) {
        this.nguoiDungId = nguoiDungId;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }
}
