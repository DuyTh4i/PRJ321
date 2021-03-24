/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class productDAO extends DBContext{
    
    public ArrayList<Product> viewByPage(ArrayList<Product> list, int begin, int end){
        ArrayList<Product> result = new ArrayList<Product>();
        for(int i = begin; i < end; i++)
            result.add(list.get(i));
        return result;
    }
    
    public ArrayList<Product> getNewestProduct(){
        String sql = "select top 3 * from product order by releaseDate desc";
        ArrayList<Product> result = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                                        rs.getString(4).split("_"), dateToString(rs.getDate(8)),
                                        rs.getInt(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public ArrayList<Product> getMostOrder(){
        String sql = "select * from product join (select top 3 [order].code, sum(quantity)as total from [order] join product on [order].code = product.code where product.status < 2 group by [order].code order by total desc)as demo on product.code = demo.code ";
        ArrayList<Product> result = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                                        rs.getString(4).split("_"), dateToString(rs.getDate(8)),
                                        rs.getInt(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public Product getProductByCode(String code){
        String sql = "select * from product where code like '%"+code+"%'";
        ArrayList<Product> result = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                                        rs.getString(4).split("_"), dateToString(rs.getDate(8)),
                                        rs.getInt(5), rs.getInt(6), rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public ArrayList<Product> getProducts(int status){
        String sql = "select * from product where status="+status+" order by releaseDate desc,code desc";
        ArrayList<Product> result = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                                        rs.getString(4).split("_"), dateToString(rs.getDate(8)),
                                        rs.getInt(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public String dateToString(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/yyyy");
        String result = sdf.format(date);
        return result;
    }
    
    public ArrayList<Product> searchProduct(String search){
        String sql = "select * from product where code like '%"+search+"%' or name like '%"+search+"%' order by releaseDate desc,code desc";
        ArrayList<Product> result = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                                        rs.getString(4).split("_"), dateToString(rs.getDate(8)),
                                        rs.getInt(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public void update(int code, String name,int price, String describe, String date){
        String sql = "update product set name=?, price=?, describe=?, releaseDate=? where code = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setString(3, describe);
            ps.setString(4, date);
            ps.setInt(5, code);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void remove(int code){
        String sql = "update product set amount = 1, status = 2 where code = "+code;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void insert(int code, String name,String describe,int price, int amount, int status, String date){
        String sql = "insert into product values(?,?,'image/"+code+"',?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, code);
            ps.setString(2,name);
            ps.setString(3, describe);
            ps.setInt(4, price);
            ps.setInt(5, amount);
            ps.setInt(6, status);
            ps.setString(7,date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
