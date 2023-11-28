/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tanki
 */
public class Users {

    private int id;
    private String name;
    private String email;
    private String phno;
    private String password;
    private String sID;
    private String Address;
    private int isAdmin;
    private String avt;

    public Users() {
    }

    public Users(int id, String name, String email, String phno, String password, String sID, String Address, int isAdmin, String avt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phno = phno;
        this.password = password;
        this.sID = sID;
        this.Address = Address;
        this.isAdmin = isAdmin;
        this.avt = avt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getsID() {
        return sID;
    }

    public void setsID(String sID) {
        this.sID = sID;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", name=" + name + ", email=" + email + ", phno=" + phno + ", password=" + password + ", sID=" + sID + ", Address=" + Address + ", isAdmin=" + isAdmin + ", avt=" + avt + '}';
    }

}
