/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Borrow;
import model.Category;
import model.LibCard;
import model.Products;
import model.Rating;

/**
 *
 * @author tanki
 */
public class DAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Book> list = new ArrayList<>();
    List<Category> listC = new ArrayList<>();
    List<LibCard> listCard = new ArrayList<>();

    public List<Category> getAllCategory() {
        try {
            String strSelect = "select * from Category";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                listC.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listC;
    }

    public List<Book> getAllBooks() {
        try {
            String strSelect = "Select b.bookId,c.cid,b.title,b.author,c.cname,b.publication_year,b.describe,b.img,b.number from Books"
                    + " b join Category c\n"
                    + "on b.cid = c.cid";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"),
                        rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getAllBooksByCid(String cid) {
        try {
            String strSelect = "Select top 4 b.bookId,c.cid,b.title,b.author,c.cname,b.publication_year,b.describe,b.img,b.number from Books\n"
                    + "                    b join Category c\n"
                    + "                    on b.cid = c.cid\n"
                    + "                    where c.cid= ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, cid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"),
                        rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteBook(int bookId) {
        try {
            String sql = "DELETE FROM [dbo].[Books] WHERE bookId = " + bookId;
            stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Book getBookById(int id) {
        String sql = "SELECT * FROM [dbo].[Books] where bookId = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Book(rs.getInt(1), rs.getInt("cid"), rs.getString(2), rs.getString(3), null, rs.getString(4), rs.getString(6), rs.getString(7), rs.getInt(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addBook(String title, String author, String pYear, String describe, int cid, String img, String number) {
        try {
            String strSelect = "INSERT INTO [dbo].[Books]\n"
                    + "           ([title]\n"
                    + "           ,[author]\n"
                    + "           ,[publication_year]\n"
                    + "           ,[cid]\n"
                    + "           ,[describe]\n"
                    + "           ,[img],[number])\n"
                    + "     VALUES(?,?,?,?,?,?,?)";

            stm = connection.prepareStatement(strSelect);
            stm.setString(1, title);
            stm.setString(2, author);
            stm.setString(3, pYear);
            stm.setString(5, describe);
            stm.setInt(4, cid);
            stm.setString(6, img);
            stm.setString(7, number);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateBook(String title, String author, String pYear, String describe, int cid, String img, String number, int id) {
        String sql = "UPDATE [dbo].[Books]\n"
                + "   SET [title] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[publication_year] = ?\n"
                + "      ,[cid] = ?\n"
                + "      ,[describe] = ?  \n"
                + "      ,[img] = ?  \n"
                + "      ,[number] = ? \n"
                + " WHERE bookId = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, title);
            stm.setString(2, author);
            stm.setString(3, pYear);
            stm.setString(5, describe);
            stm.setInt(4, cid);
            stm.setString(6, img);
            stm.setString(7, number);
            stm.setInt(8, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Book> getTop4() {
        try {
//            String sql = "select top 4 b.bookId,c.cid,c.cname,b.title,b.author,b.publication_year,b.describe,b.img,avg(br.rating) as avgRate from Books b inner join \n"
//                    + "bookRating br on b.bookId = br.bookId\n"
//                    + "inner join Category c on b.cid = c.cid\n"
//                    + "group by b.bookId,b.title,c.cid,c.cname,b.author,b.publication_year,b.cid,b.describe,b.img";        
            String strSelect = "select top 4 b.bookId,c.cid,c.cname,b.title,b.author,b.publication_year,b.describe,b.img,b.number from Books b \n"
                    + "inner join Category c \n"
                    + "on b.cid = c.cid";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"), rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getNextBooks(int num) {
        try {
            String strSelect = "select b.bookId,c.cid,c.cname,b.title,b.author,b.publication_year,b.describe,b.img,b.number from Books b inner join Category c on b.cid = c.cid\n"
                    + "                   ORDER by bookId\n"
                    + "                    OFFSET ? rows \n"
                    + "                    fetch next 4 rows only";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, num);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"), rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Book> getNextBooksByCid(int num, String cid) {
        try {
            String strSelect = "select b.bookId,c.cid,c.cname,b.title,b.author,b.publication_year,b.describe,b.img,b.number from Books b \n"
                    + "inner join Category c on b.cid = c.cid \n"
                    + "where c.cid = ?\n"
                    + "ORDER by bookId\n"
                    + "OFFSET ? rows \n"
                    + "fetch next 4 rows only";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(2, num);
            stm.setString(1, cid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"), rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    String cname;

    public String getCnameByCid(String cid) {
        try {
            String strSelect = "select cname from Category \n"
                    + "where cid = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, cid);
            rs = stm.executeQuery();
            while (rs.next()) {
                cname = rs.getString("cname");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cname;
    }

    public Book getAllBooksByBid(String id) {
        try {
            String strSelect = "Select b.bookId,c.cid,b.title,b.author,c.cname,b.publication_year,b.describe,b.img,b.number from Books\n"
                    + "                    b join Category c\n"
                    + "                    on b.cid = c.cid\n"
                    + "                    where b.bookId= ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"),
                        rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Book> searchByName(String key) {
        try {
            String strSelect = "Select b.bookId,c.cid,b.title,b.author,c.cname,b.publication_year,b.describe,b.img,b.number from Books\n"
                    + "                    b join Category c\n"
                    + "                    on b.cid = c.cid\n"
                    + "                    where b.title like ? OR b.author like ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, "%" + key + "%");
            stm.setString(2, "%" + key + "%");

            rs = stm.executeQuery();
            while (rs.next()) {
                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"),
                        rs.getString("author"), rs.getString("cname"),
                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"), rs.getInt("number"));
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addRating(String bookId, String userId, String rating) {
        try {
            String strSelect = "INSERT INTO bookRating([bookId],[userId],[rating] )\n"
                    + "         VALUES(?,?,?)";

            stm = connection.prepareStatement(strSelect);
            stm.setString(1, bookId);
            stm.setString(2, userId);
            stm.setString(3, rating);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addBorrowDetails(String bookId, String bFrom, String number, String borrowId) {
        try {
            String strSelect = "INSERT INTO BorrowDetails([borrowId],[status],[bFrom],[number],[bookId] )\n"
                    + "         VALUES(?,' ',?,?,?)";

            stm = connection.prepareStatement(strSelect);
            stm.setString(1, borrowId);
            stm.setString(2, bFrom);
            stm.setString(3, number);
            stm.setString(4, bookId);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Borrow getBorrowById() {
        try {
            String strSelect = "select top 1 * from Borrow order by borrowId desc";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Borrow(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addBorrow(String cardId) {
        try {
            String strSelect = "INSERT INTO Borrow([cardId])\n"
                    + "         VALUES(?)";

            stm = connection.prepareStatement(strSelect);
            stm.setString(1, cardId);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Rating getRating(String bookId, String userId) {
        try {
            String strSelect = "select * from bookRating where "
                    + "bookId = ? and userId = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, bookId);
            stm.setString(2, userId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Rating(rs.getInt("rating"), rs.getInt("bookId"), rs.getInt("userId"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateRating(String rating, String bookId, String userId) {
        try {
            String sql = "UPDATE [dbo].[bookRating]\n"
                    + "   SET [rating] = ?\n"
                    + " WHERE bookId = ? and userId = ?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, rating);
            stm.setString(2, bookId);
            stm.setString(3, userId);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String getRate(String bookId) {
        try {
            String sql = "SELECT COALESCE(avg(rating), 0) AS rate\n"
                    + "FROM bookRating\n"
                    + "WHERE bookId = ?";
//            String strSelect = "select avg(rating) as rate from bookRating where "
//                    + "bookId = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, bookId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString("rate");
//                return new Rating(rs.getInt("rating"), rs.getInt("bookId"), rs.getInt("userId"));
//                return new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"),
//                        rs.getString("author"), rs.getString("cname"),
//                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addCard(String userId, String maxBook, String startDate, String endDate) {
        try {
            String strSelect = "INSERT INTO LibCard([id],[status],[maxBookBor],[NgayCap],[NgayHetHan] )\n"
                    + "         VALUES(?,'0',?,?,?)";

            stm = connection.prepareStatement(strSelect);
            stm.setString(1, userId);
            stm.setString(2, maxBook);
            stm.setString(3, startDate);
            stm.setString(4, endDate);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public LibCard getCard(String userId) {
        try {
            String strSelect = "select * from LibCard where "
                    + "id = ?";
            stm = connection.prepareStatement(strSelect);
//            stm.setString(1, bookId);
            stm.setString(1, userId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new LibCard(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public LibCard getCardById(int cardId) {
        try {
            String strSelect = "select * from LibCard where "
                    + "cardId = ?";
            stm = connection.prepareStatement(strSelect);
//            stm.setString(1, bookId);
            stm.setInt(1, cardId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new LibCard(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateRcard(String maxBook, String startDate, String endDate, String userId) {
        try {
            String sql = "UPDATE LibCard\n"
                    + "SET maxBookBor = ?,NgayCap = ?, NgayHetHan = ?\n"
                    + "WHERE id=?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, maxBook);
            stm.setString(2, startDate);
            stm.setString(3, endDate);
            stm.setString(4, userId);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<LibCard> getAllCard() {
        try {
            String strSelect = "select * from LibCard";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                LibCard card = new LibCard(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7));
//                Book book = new Book(rs.getInt("bookId"), rs.getInt("cid"), rs.getString("title"),
//                        rs.getString("author"), rs.getString("cname"),
//                        rs.getString("publication_year"), rs.getString("describe"), rs.getString("img"));
                listCard.add(card);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCard;
    }

    public void deleteCard(String cardId) {
        try {
            String sql = "DELETE FROM [dbo].[LibCard] WHERE cardId = " + cardId;
            stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateStatusCard(String cardId, String status, String startDate, String endDate) {
        try {
            String sql = "UPDATE LibCard\n"
                    + "SET status= ?,NgayCap = ?, NgayHetHan = ?\n"
                    + "WHERE cardId=?";

            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, startDate);
            stm.setString(3, endDate);
            stm.setString(4, cardId);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        //(String title, String author, String pYear, String describe, int cid, String img,String number,int id
        DAO dao = new DAO();
        dao.updateBook("vd2", "vd2", "2023", "vd2", 3, "vd2", "4", 16);
//        LibCard card = dao.getCardById(3);

//        System.out.println(card.getCardId());
    }
}
