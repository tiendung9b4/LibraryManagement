package dal;

import model.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

public class ProductsDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Products> list = new ArrayList<>();

    public List<Products> getAll() {
        try {
            String strSelect = "select * from Product";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Products em = new Products(rs.getInt("Id"), rs.getInt("Catalogy_Id"), rs.getString("Title"), rs.getString("Author"), rs.getString("Images"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getByName(String na) {
        try {
            String strSelect = "select * from Product where Title like '%" + na + "%'";
            stm = connection.prepareStatement(strSelect);
            stm.executeQuery();
            while (rs.next()) {
                Products em = new Products(rs.getInt("Id"), rs.getInt("Catalogy_Id"), rs.getString("Title"), rs.getString("Author"), rs.getString("Images"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProduct(int caId, String name, String note, String img) {
        try {
            String strSelect = "INSERT INTO [dbo].[Product]\n"
                    + "           ([Catalogy_Id]\n"
                    + "           ,[Title]\n"
                    + "           ,[Author]\n"
                    + "           ,[Images])\n"
                    + "     VALUES(?,?,?,?)";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, caId);
            stm.setString(2, name);
            stm.setString(3, note);
            stm.setString(4, img);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Product] WHERE Id = " + id;
            stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Products getProductById(int id) {
        String sql = "SELECT * FROM [dbo].[Product] where id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Products(rs.getInt("Id"), rs.getInt("Catalogy_Id"), rs.getString("Title"), rs.getString("Author"), rs.getString("Images"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateProduct(int caId, String name, String note, String img, int id) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [Catalogy_Id] = ?\n"
                + "      ,[Title] = ?\n"
                + "      ,[Author] = ?\n"
                + "      ,[Images] = ?\n"
                + " WHERE id = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, caId);
            stm.setString(2, name);
            stm.setString(3, note);
            stm.setString(4, img);
            stm.setInt(5, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Products> getNextProducts(int num) {
        try {
            String strSelect = "select * from Product  \n"
                    + "ORDER by ID\n"
                    + "OFFSET ? rows \n"
                    + "fetch next 4 rows only";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, num);
            rs = stm.executeQuery();
            while (rs.next()) {
                Products em = new Products(rs.getInt("Id"), rs.getInt("Catalogy_Id"), rs.getString("Title"), rs.getString("Author"), rs.getString("Images"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getTop4() {
        try {
            String strSelect = "select top 4 * from Product ";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Products em = new Products(rs.getInt("Id"), rs.getInt("Catalogy_Id"), rs.getString("Title"), rs.getString("Author"), rs.getString("Images"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Cart> getCartProduct(List<Cart> cartList) {
        List<Cart> products = new ArrayList<Cart>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "select * from Books where bookId = ?";
                    stm = connection.prepareStatement(query);
                    stm.setInt(1, item.getBookId());
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setBookId(rs.getInt("bookId"));
                        row.setTitle(rs.getString("title"));
                        row.setAuthor(rs.getString("author"));
                        row.setPublicY(rs.getString("publication_year"));
                        row.setCid(rs.getInt("cid"));
                        row.setDescribe(rs.getString("describe"));
                        row.setImg(rs.getString("img"));
                        row.setNumber(rs.getInt("number"));
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return products;
    }

    public static void main(String[] args) {
        ProductsDAO a = new ProductsDAO();
//       List<Cart> list = a.getCartProduct(cartList);
//        System.out.println(list.get(0).getName());
    }
}
