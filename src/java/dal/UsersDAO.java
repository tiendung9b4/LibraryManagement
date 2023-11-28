/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.LibCard;
import model.Users;

/**
 *
 * @author tanki
 */
public class UsersDAO extends DBContext {
    
    PreparedStatement stm;
    ResultSet rs;
    
    public Users login(String email, String pass) {
        String query = "select * from Users\n"
                + "where email = ?\n"
                + "and password = ?";
        
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, email);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
            }
            
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public Users checkUserExist(String email) {
        String query = "select * from Users\n"
                + "where email = ?";
        
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
            }
            
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public void signup(String name, String email, String password, int phno, String isAdmin) {
        String sql = "insert into Users(name,email,password,phno,isAdmin) values(?,?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, email);
            stm.setString(3, password);
            stm.setInt(4, phno);
            stm.setString(5, isAdmin);
            stm.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    
    public Users getUser(String id) {
        String query = "select * from Users\n"
                + "where id = ?";
        
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
            }
            
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public void updateUser(String email, String phno, String address, String name, String password, String image, int id) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phno] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[Address] = ?  \n"
                + "      ,[Avt src] = ?  \n"
                + " WHERE id = ?";
        
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, email);
            stm.setString(3, phno);
            stm.setString(4, password);
            stm.setInt(7, id);
            stm.setString(5, address);
            stm.setString(6, image);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //select l.* from LibCard l where l.id = 1
    public LibCard getLibCardById(String id) {
        String query = "select * from LibCard\n"
                + "where id = ?";
        
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
//                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
                return new LibCard(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
            
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public static void main(String[] args) {
        UsersDAO dao = new UsersDAO();
        Users u = dao.getUser("1");
        System.out.println(u.getName());
    }
    
}
