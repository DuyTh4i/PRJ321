/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Account {
    int id, permission;
    String username, password, address, fullname, phoneNumber;
    ArrayList<UOrder> orderList;

    public Account( String username, String password,int permission) {
        this.username = username;
        this.password = password;
        this.permission = permission;
    }
    
    public Account(int id, String username, String password,int permission, String fullname, String phoneNumber, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.permission = permission;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }
    
    public Account(int id, String username, String password,int permission, String fullname, String phoneNumber, String address,ArrayList<UOrder> orderList) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.permission = permission;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.orderList = orderList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String usename) {
        this.username = usename;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public ArrayList<UOrder> getOrderList() {
        return orderList;
    }

    public void setOrderList(ArrayList<UOrder> orderList) {
        this.orderList = orderList;
    }
    
    
}
