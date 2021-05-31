/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import bean.User;
import bean.Post;
import bean.Post_Category;

/**
 *
 * @author HP
 */
public class PostDAO extends BaseDAO {
    
    public ArrayList<Post> getPosts() {
        ArrayList<Post> posts = new ArrayList<>();
        
        try {
            String sql = "select post.id, post.content, post.description, post.updated_date, post.featured, \n"
                    + "            post.thumbnail_link, post.author_id, post.category_id, post.status, post.title,\n"
                    + "            user.email, user.full_name, user.image_link,  \n"
                    + "            post_category.name as category_name\n"
                    + "            from post left join user\n"
                    + "            on post.author_id = user.id\n"
                    + "            left join post_category on post.category_id = post_category.id";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setDescription(rs.getString("description"));
                p.setUpdatedDate(rs.getDate("updated_date"));
                p.setFeatured(rs.getBoolean("featured"));
                p.setThumbnailLink(rs.getString("thumbnail_link"));
                
                User acc = new User();
                acc.setId(rs.getInt("author_id"));
                acc.setFullName(rs.getString("full_name"));
                acc.setImageLink(rs.getString("image_link"));
                
                p.setAuthor(acc);
                
                Post_Category pc = new Post_Category();
                pc.setId(rs.getInt("category_id"));
                pc.setName(rs.getString("category_name"));
                
                p.setCategory(pc);
                p.setStatus(rs.getBoolean("status"));
                
                posts.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return posts;
    }
    
    public void deletePost(int id) {
        try {
            String sql = "delete\n"
                    + "from post where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addPost(Post p) {
        try {
            String sql = "insert into post(content, description, updated_date, thumbnail_link,\n"
                    + "            category_id, title)\n"
                    + "            values(?, ?, ?, ?, ?, ?)";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, p.getContent());
            stm.setString(2, p.getDescription());
            stm.setDate(3, p.getUpdatedDate());
            stm.setString(4, p.getThumbnailLink());
            stm.setInt(5, p.getCategory().getId());
            stm.setString(6, p.getTitle());
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Post_Category> getCategories() {
        ArrayList<Post_Category> post_categories = new ArrayList<>();
        try {
            String sql = "select id, name\n"
                    + "                from post_category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post_Category pc = new Post_Category();
                pc.setId(rs.getInt("id"));
                pc.setName(rs.getString("name"));
                
                post_categories.add(pc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return post_categories;
    }
    
    public Post getPostById(int id) {
        Post p = new Post();
        try {
            String sql = "select post.id, post.content, post.description, post.updated_date, post.featured, \n"
                    + "            post.thumbnail_link, post.author_id, post.category_id, post.status, post.title,\n"
                    + "            user.email, user.full_name, user.image_link,  \n"
                    + "            post_category.name as category_name\n"
                    + "            from post left join user\n"
                    + "            on post.author_id = user.id\n"
                    + "            left join post_category on post.category_id = post_category.id\n"
                    + "where post.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setDescription(rs.getString("description"));
                p.setUpdatedDate(rs.getDate("updated_date"));
                p.setFeatured(rs.getBoolean("featured"));
                p.setThumbnailLink(rs.getString("thumbnail_link"));
                
                User acc = new User();
                acc.setId(rs.getInt("author_id"));
                acc.setFullName(rs.getString("full_name"));
                acc.setImageLink(rs.getString("image_link"));
                
                p.setAuthor(acc);
                
                Post_Category pc = new Post_Category();
                pc.setId(rs.getInt("category_id"));
                pc.setName(rs.getString("category_name"));
                
                p.setCategory(pc);
                p.setStatus(rs.getBoolean("status"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
}
