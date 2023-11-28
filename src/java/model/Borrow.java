/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tanki
 */
public class Borrow {
    private int borrowId;
    private String cardId;
    private String note;

    public Borrow() {
    }

    public Borrow(int borrowId, String cardId, String note) {
        this.borrowId = borrowId;
        this.cardId = cardId;
        this.note = note;
    }

    public int getBorrowId() {
        return borrowId;
    }

    public void setBorrowId(int borrowId) {
        this.borrowId = borrowId;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Borrow{" + "borrowId=" + borrowId + ", cardId=" + cardId + ", note=" + note + '}';
    }
    
}
