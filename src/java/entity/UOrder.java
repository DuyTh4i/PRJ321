/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class UOrder {
    int oId, code,quantity,price,status;
    String image, name,date,fullName,phoneNumber,address;

    public UOrder(int code, int quantity){
        this.quantity = quantity;
        this.code = code;
    }
    
    
    
    public UOrder(int oId, int code,String image, String name,int quantity, int price, String date, int status) {
        this.oId = oId;
        this.code = code;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.name = name;
        this.date = date;
        this.status = status;
    }
    public UOrder( int code,String image, String name,int quantity, int price, String date,String fullName,String phoneNumber,String address,int status) {
        this.code = code;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.name = name;
        this.date = date;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.status = status;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public String formatPrice(){
        String p = Integer.toString(this.price*this.quantity);
        String format ="";
        int cnt=0;
        for(int i = p.length()-1;i>=0;i--){
            cnt++;
            format = p.charAt(i) + format;
            if(cnt==3){
                cnt=0;
                format = ","+format;
            }
        }
        return format;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    
}
