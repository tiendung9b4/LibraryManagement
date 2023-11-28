
import dal.ProductsDAO;
import model.Products;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author trant
 */
public class test {
    
    public static void main(String[] args) {
        ProductsDAO p = new ProductsDAO();
        Products myP =  p.getProductById(5);
        System.out.println(myP);
    }
}
