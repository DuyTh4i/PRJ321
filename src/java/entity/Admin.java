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
public class Admin {
    ArrayList<Order> wait;
    ArrayList<Order> cancel;
    ArrayList<Order> done;
    int totalOrder;

    public ArrayList<Order> getCancel() {
        return cancel;
    }

    public void setCancel(ArrayList<Order> cancel) {
        this.cancel = cancel;
    }

    public ArrayList<Order> getDone() {
        return done;
    }

    public void setDone(ArrayList<Order> done) {
        this.done = done;
    }

    
    
    public int getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(int totalOrder) {
        this.totalOrder = totalOrder;
    }
    
    
    
    public ArrayList<Order> getWait() {
        return wait;
    }

    public void setWait(ArrayList<Order> wait) {
        this.wait = wait;
    }
    
}
