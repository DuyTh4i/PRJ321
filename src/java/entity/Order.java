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
public class Order {
    int oId, price,uNumber;
    String username,date;

    public Order(int oId, int uNumebr,String username, int price, String date) {
        this.uNumber = uNumebr;
        this.oId = oId;
        this.price = price;
        this.username = username;
        this.date = date;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getuNumber() {
        return uNumber;
    }

    public void setuNumber(int uNumber) {
        this.uNumber = uNumber;
    }
    
    
    
    
    public String formatPrice(){
        String p = Integer.toString(this.price);
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

    
}
