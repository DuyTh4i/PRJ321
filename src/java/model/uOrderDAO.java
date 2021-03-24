/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Order;
import entity.Cart;
import entity.UOrder;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class uOrderDAO extends DBContext {

    public ArrayList<UOrder> getUOrder(int uNumber) {
        String sql = "select oId, product.code, image, name, quantity,price,date,[order].status from [order] join product on [order].code = product.code where uNumber=" + uNumber + " order by oId desc";
        ArrayList<UOrder> orderList = new ArrayList<UOrder>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new UOrder(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), dateToString(rs.getDate(7)), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return orderList;
    }

    public String dateToString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String result = sdf.format(date);
        return result;
    }

    public ArrayList<UOrder> getWaitting() {
        String sql = "select oId, product.code, image, name, quantity,price,date,[order].status from [order] join product on [order].code = product.code where [order].status=0 order by oId desc";
        ArrayList<UOrder> orderList = new ArrayList<UOrder>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new UOrder(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), dateToString(rs.getDate(7)), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return orderList;
    }

    public String getNumberOfOrder() {
        String sql = "select count(DISTINCT oId) from [order] where status =0 group by status";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                return Integer.toString(rs.getInt(1));
        } catch (Exception e) {
        }
        return null;
    }
    public ArrayList<Order> getWaitOrder() {
        String sql = "select oId,[order].uNumber,username, sum(price*quantity),date from [order] join product on [order].code=product.code join account on [order].uNumber=number where [order].status=0 group by oId,[order].uNumber,username,date order by date desc,oId desc";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getInt(4), dateToString(rs.getDate(5))));
            }
        } catch (Exception e) {
        }
        return orderList;
    }
    public ArrayList<Order> getCancelOrder() {
        String sql = "select oId,[order].uNumber,username, sum(price*quantity),date from [order] join product on [order].code=product.code join account on [order].uNumber=number where [order].status=2 group by oId,[order].uNumber,username,date order by date desc,oId desc";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getInt(4), dateToString(rs.getDate(5))));
            }
        } catch (Exception e) {
        }
        return orderList;
    }
    public ArrayList<Order> getDoneOrder() {
        String sql = "select oId,[order].uNumber,username, sum(price*quantity),date from [order] join product on [order].code=product.code join account on [order].uNumber=number where [order].status=1 group by oId,[order].uNumber,username,date order by date desc,oId desc";
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getInt(4), dateToString(rs.getDate(5))));
            }
        } catch (Exception e) {
        }
        return orderList;
    }
    public ArrayList<UOrder> getDetail(String oId){
        String sql = "select  product.code, image, name, quantity,price,date,fullName,phoneNumber,address,[order].status from [order] join product on [order].code = product.code where oId="+oId;
        ArrayList<UOrder> detail = new ArrayList<UOrder>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                detail.add(new UOrder(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), dateToString(rs.getDate(6)), rs.getString(7), rs.getString(8), rs.getString(9),rs.getInt(10)));
        } catch (Exception e) {
        }
        return detail;
    }
    
    public ArrayList<UOrder> getQuantity(int oId){
        String sql="select code, quantity from [order] where oId ="+oId;
        ArrayList<UOrder> quantity =new ArrayList<UOrder>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                quantity.add(new UOrder(rs.getInt(1), rs.getInt(2)));
        } catch (Exception e) {
        }
        return quantity;
    }
    public void updateAmount(int code,int quantity){
        String sql = "update product set amount = amount - "+quantity+" where code="+code;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void accept(int oId){
        ArrayList<UOrder> quantity = getQuantity(oId);
        for(UOrder o : quantity){
            updateAmount(o.getCode(), o.getQuantity());
        }
        String sql = "update [order] set status=1 where oId="+oId;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void cancel(int oId){
        String sql = "update [order] set status=2 where oId="+oId;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
