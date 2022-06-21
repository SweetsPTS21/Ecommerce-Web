package dao;

import model.SanPham;
import model.SanPham;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SanPhamDAO extends DBconnection {


    public List<SanPham> getTatCaSanPham() {
        String sql = "SELECT * FROM product";
        List<SanPham> listSanPham = new ArrayList<SanPham>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setId(rs.getInt("productId"));
                sanPham.setTen(rs.getString("productName"));
                sanPham.setGia(rs.getInt("productPrice"));
                sanPham.setMota(rs.getString("productDescription"));
                sanPham.setAnh(rs.getString("productImg"));
                sanPham.setLoai(rs.getString("productCategory"));
                listSanPham.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSanPham;
    }


    public SanPham getSanPhamById(int id) {
        String sql = "SELECT * FROM product WHERE productId = ?";
        SanPham sanPham = new SanPham();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sanPham.setId(rs.getInt("productId"));
                sanPham.setTen(rs.getString("productName"));
                sanPham.setGia(rs.getInt("productPrice"));
                sanPham.setMota(rs.getString("productDescription"));
                sanPham.setAnh(rs.getString("productImg"));
                sanPham.setLoai(rs.getString("productCategory"));
                sanPham.setSoluong(rs.getInt("productQuantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sanPham;
    }

    public void themSanPham(SanPham sanPham) {
        String sql = "INSERT INTO product (productName, productImg, productPrice, productQuantity, productDescription, productCategory) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sanPham.getTen());
            ps.setString(2, sanPham.getAnh());
            ps.setDouble(3, sanPham.getGia());
            ps.setInt(4, sanPham.getSoluong());
            ps.setNString(5, sanPham.getMota());
            ps.setString(6, sanPham.getLoai());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void capNhatSanPham(SanPham sanPham) {
        String sql = "UPDATE product SET productName = ?, productImg = ?,  productPrice = ?, productQuantity = ? ,productDescription = ?, productCategory = ? WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sanPham.getTen());
            ps.setString(2, sanPham.getAnh());
            ps.setDouble(3, sanPham.getGia());
            ps.setInt(4, sanPham.getSoluong());
            ps.setNString(5, sanPham.getMota());
            ps.setString(6, sanPham.getLoai());
            ps.setInt(7, sanPham.getId());
            ps.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void xoaSanPham(int id) {
        String sql = "DELETE FROM product WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<String> getTatCaLoai() {
        List<SanPham> listSanPham = getTatCaSanPham();
        Set<String> listLoai = new HashSet<>();

        for(SanPham sanPham : listSanPham) {
            listLoai.add(sanPham.getLoai());
        }

        return new ArrayList<>(listLoai);
    }

    public List<SanPham> timSanPham(String tukhoa){
        List<SanPham> list = new ArrayList<>();
        String sql = "select * from product where productName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + tukhoa + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setId(rs.getInt("productId"));
                sanPham.setTen(rs.getString("productName"));
                sanPham.setGia(rs.getInt("productPrice"));
                sanPham.setMota(rs.getString("productDescription"));
                sanPham.setAnh(rs.getString("productImg"));
                sanPham.setLoai(rs.getString("productCategory"));
                list.add(sanPham);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<SanPham> timSanPhamTheoLoai(String loaiSanPhamName) {
        List<SanPham> list = new ArrayList<>();
        String sql = "select * from product where productCategory like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + loaiSanPhamName + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham product = new SanPham();
                product.setId(rs.getInt("productId"));
                product.setTen(rs.getString("productName"));
                product.setGia(rs.getInt("productPrice"));
                product.setMota(rs.getString("productDescription"));
                product.setAnh(rs.getString("productImg"));
                product.setLoai(rs.getString("productCategory"));
                list.add(product);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<SanPham> getProductByOrderID(String ID) {
        List<SanPham> list = new ArrayList<>();
        String sql = "select product.productName, product.productPrice, product.productImg, orderdetail.quantity from webptit.product \n" +
                "join webptit.orderdetail on product.productId = orderdetail.productId where orderdetail.orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setTen(rs.getString("productName"));
                sanPham.setGia(rs.getInt("productPrice"));
                sanPham.setAnh(rs.getString("productImg"));
                sanPham.setSoluong(rs.getInt("quantity"));
                list.add(sanPham);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
