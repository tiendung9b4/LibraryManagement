/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tanki
 */
public class Book {

    /*[bookId]
      ,[title]
      ,[author]
      ,[publication_year]
      ,[cid]
      ,[describe]
      ,[img]*/
    private int bookId;
    private int cid;
    private String title;
    private String author;
    private String category;
    private String publicY;
    private String describe;
    private String img;
    private int number;

    public Book() {
    }

//    public Book(int bookId, int cid, String title, String author, String category, String publicY, String describe, String img) {
//        this.bookId = bookId;
//        this.cid = cid;
//        this.title = title;
//        this.author = author;
//        this.category = category;
//        this.publicY = publicY;
//        this.describe = describe;
//        this.img = img;
//    }
    public Book(int bookId, int cid, String title, String author, String category, String publicY, String describe, String img, int number) {
        this.bookId = bookId;
        this.cid = cid;
        this.title = title;
        this.author = author;
        this.category = category;
        this.publicY = publicY;
        this.describe = describe;
        this.img = img;
        this.number = number;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPublicY() {
        return publicY;
    }

    public void setPublicY(String publicY) {
        this.publicY = publicY;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Book{" + "bookId=" + bookId + ", cid=" + cid + ", title=" + title + ", author=" + author + ", category=" + category + ", publicY=" + publicY + ", describe=" + describe + ", img=" + img + ", number=" + number + '}';
    }

}
