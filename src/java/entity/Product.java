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
public class Product {
    int code;
    String  name, image , releaseDate;
    String[] describe;
    int price, amount, status;

    public Product(int code, String name, String image, String[] describe, String releaseDate, int price, int amount, int status) {
        this.code = code;
        this.name = name;
        this.image = image;
        this.describe = describe;
        this.releaseDate = releaseDate;
        this.price = price;
        this.amount = amount;
        this.status = status;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String[] getDescribe() {
        
        return describe;
    }

    public void setDescribe(String[] describe) {
        this.describe = describe;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
