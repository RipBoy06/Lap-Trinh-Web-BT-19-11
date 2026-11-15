package vn.iotstar.model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Category")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cate_id")
    private int cateid;

    @Column(name = "cate_name", columnDefinition = "NVARCHAR(255) NOT NULL")
    private String catename;

    @Column(name = "icons", columnDefinition = "NVARCHAR(255)")
    private String icon;

    public Category() {}

    public int getCateid() { return cateid; }
    public void setCateid(int cateid) { this.cateid = cateid; }

    public int getId() { return cateid; }
    public void setId(int id) { this.cateid = id; }

    public String getCatename() { return catename; }
    public void setCatename(String catename) { this.catename = catename; }

    public String getName() { return catename; }
    public void setName(String name) { this.catename = name; }

    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }
}