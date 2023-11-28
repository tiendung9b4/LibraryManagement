/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tanki
 */
public class LibCard {

    private int cardId;
    private int userId;
    private String status;
    private int maxBook;
    private int numBookBorrowing;
    private String startDate;
    private String endDate;

    public LibCard() {
    }

    public LibCard(int cardId, int userId, String status, int maxBook, int numBookBorrowing, String startDate, String endDate) {
        this.cardId = cardId;
        this.userId = userId;
        this.status = status;
        this.maxBook = maxBook;
        this.numBookBorrowing = numBookBorrowing;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getMaxBook() {
        return maxBook;
    }

    public void setMaxBook(int maxBook) {
        this.maxBook = maxBook;
    }

    public int getNumBookBorrowing() {
        return numBookBorrowing;
    }

    public void setNumBookBorrowing(int numBookBorrowing) {
        this.numBookBorrowing = numBookBorrowing;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "LibCard{" + "cardId=" + cardId + ", userId=" + userId + ", status=" + status + ", maxBook=" + maxBook + ", numBookBorrowing=" + numBookBorrowing + ", startDate=" + startDate + ", endDate=" + endDate + '}';
    }

}
