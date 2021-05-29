/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Date;
import java.util.Locale.Category;

/**
 *
 * @author HP
 */
public class Post {
    private int id;
    private String title;
    private String content;
    private String description;
    private Date updated_date;
    private boolean featured;
    private String thumbnail_link;
    private User author;
    private Post_Category category;
    private boolean status;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    public String getThumbnail_link() {
        return thumbnail_link;
    }

    public void setThumbnail_link(String thumbnail_link) {
        this.thumbnail_link = thumbnail_link;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Post_Category getCategory() {
        return category;
    }

    public void setCategory(Post_Category category) {
        this.category = category;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    

    
    
}
