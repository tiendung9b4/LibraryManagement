/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ContactUs;
import model.Products;
import model.Users;

/**
 *
 * @author tanki
 */
public class ContentDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ContactUs checkMesExisted(String mes, String cEmail) {
        String query = "select * from contactForm \n"
                + "where CAST(mes as nvarchar(max)) = ?  AND cEmail = (?)";

        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, mes);
            stm.setString(2, cEmail);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new ContactUs(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void write(String cName, String cEmail, String mes, String date) {
        String sql = "insert into contactForm(cName,cEmail,mes,Date) values(?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, cName);
            stm.setString(2, cEmail);
            stm.setString(3, mes);
            stm.setString(4, date);
            stm.executeUpdate();
        } catch (Exception e) {
        }

    }
    List<ContactUs> list = new ArrayList<>();

    public List<ContactUs> getAll() {
        try {
            String strSelect = "select * from contactForm";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                ContactUs cs = new ContactUs(rs.getInt("formId"), rs.getString("cName"), rs.getString("cEmail"), rs.getString("mes"), rs.getString("Date"));
                list.add(cs);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ContentDAO a = new ContentDAO();
        List<ContactUs> list = a.getAll();
        System.out.println(list.get(0).getcEmail());
    }

}
