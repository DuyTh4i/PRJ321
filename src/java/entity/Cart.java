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
public class Cart {
    int id, code, quantity, price;
    String image, name;

    public Cart() {
    }

    
    
    public Cart(int id, int code, String name, String image, int quantity, int price) {
        this.id = id;
        this.code = code;
        this.quantity = quantity;
        this.image = image;
        this.name = name;
        this.price = price;
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
    
    
    
    public Cart(int code, int quantity) {
        this.code = code;
        this.quantity = quantity;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    
    public String formatPrice(int price){
        String p = Integer.toString(price);
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
