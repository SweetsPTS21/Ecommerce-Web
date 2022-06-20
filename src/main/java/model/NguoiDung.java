package model;

public class NguoiDung {
    private int id;
    private String taikhoan;
    private String matkhau;
    private String email;
    private String diachi;
    private String sodienthoai;
    private int vaitro = 0;

    public NguoiDung() {

    }

    public NguoiDung(int id, String taikhoan, String email, String matkhau, int vaitro) {
        this.id = id;
        this.taikhoan = taikhoan;
        this.email = email;
        this.matkhau = matkhau;
        this.vaitro = vaitro;
    }

    public NguoiDung(int id, String taikhoan, String matkhau, String email, String diachi, String sodienthoai, int vaitro) {
        this.id = id;
        this.taikhoan = taikhoan;
        this.matkhau = matkhau;
        this.email = email;
        this.diachi = diachi;
        this.sodienthoai = sodienthoai;
        this.vaitro = vaitro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTaikhoan() {
        return taikhoan;
    }

    public void setTaikhoan(String taikhoan) {
        this.taikhoan = taikhoan;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    public int getVaitro() {
        return vaitro;
    }

    public void setVaitro(int vaitro) {
        this.vaitro = vaitro;
    }
}
