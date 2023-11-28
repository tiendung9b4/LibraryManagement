/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tanki
 */
public class ContactUs {

    private int formId;
    private String cName;
    private String cEmail;
    private String mes;
    private String date;

    public ContactUs() {
    }

    public ContactUs(int formId, String cName, String cEmail, String mes, String date) {
        this.formId = formId;
        this.cName = cName;
        this.cEmail = cEmail;
        this.mes = mes;
        this.date = date;
    }

    public int getFormId() {
        return formId;
    }

    public void setFormId(int formId) {
        this.formId = formId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ContactUs{");
        sb.append("formId=").append(formId);
        sb.append(", cName=").append(cName);
        sb.append(", cEmail=").append(cEmail);
        sb.append(", mes=").append(mes);
        sb.append(", date=").append(date);
        sb.append('}');
        return sb.toString();
    }

}
