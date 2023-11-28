/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author tanki
 */
public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;
        try {
            File file = new File(path);
            f = file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] b = new byte[is.available()];
            is.read(b);
            FileOutputStream ops = new FileOutputStream(path);
            ops.write(b);
            ops.flush();
            ops.close();
            test = true;

        } catch (Exception e) {
        }
        return test;
    }
}
