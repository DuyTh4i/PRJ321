/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Cart;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class cartDAO extends DBContext{
    public ArrayList<Cart> getCart(int uNumber){
        String sql = "select * from cart join product on cart.code = product.code where uNumber="+uNumber;
        ArrayList<Cart> carts = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                carts.add(new Cart(rs.getInt(1),rs.getInt(2), rs.getString(5),rs.getString(6),rs.getInt(3),rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return carts;
    }
    
    public ArrayList<Integer> getCode(ArrayList<Cart> carts){
        ArrayList<Integer> result = new ArrayList<>();
        for(Cart c:carts)
            result.add(c.getCode());
        return result;
    }
    
    public void insert(int uNumber, int code){
        String sql = "insert into cart values(?,?,1)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, uNumber);
            ps.setInt(2, code);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public void update(int uNumber, int code){
        String sql = "update cart set quantity = (select quantity from cart where uNumber ="+uNumber+" and code ="+code+")+1 where uNumber ="+uNumber+" and code ="+code;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void reduceAProduct(int uNumber, int code){
        String sql = "update cart set quantity = (select quantity from cart where uNumber ="+uNumber+" and code ="+code+")-1 where uNumber ="+uNumber+" and code ="+code;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void removeProduct(int uNumber, int code){
        String sql = "delete from cart where uNumber ="+uNumber+" and code ="+code;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public String getTotalQ(int uNumber){
        String sql = "select sum(quantity) from cart where uNumber ="+uNumber+" group by uNumber";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                return Integer.toString(rs.getInt(1));
        } catch (Exception e) {
        }
        return null;
    }
    public int getOId(){
        String sql ="select top 1 oId  from [order] order by oId desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                return rs.getInt(1)+1;
        } catch (Exception e) {
        }
        return 1;
    }
    public void removeCart(int uNumber){
        String sql="delete cart where uNumber="+uNumber;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {
        }
    }
    public void updateAmount(int code,int quantity){
        String sql = "update product set amount = amount - "+quantity+" where code="+code;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void checkOut(int uNumber,String fullName, String phoneNumber,String address){
        int oId = getOId();
        ArrayList<Cart> carts = getCart(uNumber);
        
        for(Cart c:carts){
            String sql ="insert into [order] values (?,?,GETDATE(),?,?,0,N'"+fullName+"',"+phoneNumber+",N'"+address+"')";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, uNumber);
                ps.setInt(2, oId);
                ps.setInt(3,c.getCode());
                ps.setInt(4, c.getQuantity());
                ps.execute();
            } catch (Exception e) {
            }
        }
        removeCart(uNumber);
    }
    
    
}
