/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class accountDAO extends DBContext{
    public boolean checkAcc(String username,String password){
        String sql="select * from account where username=? and password = ?";
        try{
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next())
                return true;
        }catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }
    
    public boolean checkUsername(String username){
        String sql="select * from account where username=?";
        try{
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs=st.executeQuery();
            if(rs.next())
                return true;
        }catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }
    
    public Account getInfo(String username,String password){
        String sql="select * from account where username=? and password = ?";
        try{
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next())
                return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(6),rs.getString(7),rs.getString(5));
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public void insertAcc(Account acc){
        String sql = "insert into account values (?,?,0,'','','')";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,acc.getUsername());
            ps.setString(2,acc.getPassword());
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public void updateInfo(int uNumber, String address, String phoneNumber, String fullname){
        String sql ="update account set address=N'"+address+"', fullName=N'"+fullname+"', phoneNumber='"+phoneNumber+"' where number="+uNumber;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
