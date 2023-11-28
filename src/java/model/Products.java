package model;

public class Products {
    public int Id;
    public int Catalogy_Id;
    public String Name;
    public String Note;
    public String Images;

    public Products(int Id, int Catalogy_Id, String Name, String Note, String Images) {
        this.Id = Id;
        this.Catalogy_Id = Catalogy_Id;
        this.Name = Name;
        this.Note = Note;
        this.Images = Images;
    }

    public Products() {
    }

    public int getId() {
        return Id;
    }

    public int getCatalogy_Id() {
        return Catalogy_Id;
    }

    public String getName() {
        return Name;
    }

    public String getNote() {
        return Note;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public void setCatalogy_Id(int Catalogy_Id) {
        this.Catalogy_Id = Catalogy_Id;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }
    
    public String getImages() {
        return Images;
    }
    
    public void setImages(String Images) {
        this.Images = Images;
    }

    @Override
    public String toString() {
        return "Products{" + "Id=" + Id + ", Catalogy_Id=" + Catalogy_Id + ", Name=" + Name + ", Note=" + Note + ", Images=" + Images + '}';
    }
    
}
