/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tanki
 */
public class Rating {

    private int rate;
    private int bookId;
    private int userId;

    public Rating() {
    }

    public Rating(int rate, int bookId, int userId) {
        this.rate = rate;
        this.bookId = bookId;
        this.userId = userId;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Rating{" + "rate=" + rate + ", bookId=" + bookId + ", userId=" + userId + '}';
    }

}
