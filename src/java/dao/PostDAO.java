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
import bean.PostCategory;
import bean.Role;

/**
 *
 * @author HP
 */
public class PostDAO extends BaseDAO {
    
    public ArrayList<Post> getPosts() {
        ArrayList<Post> posts = new ArrayList<>();

        try {
            String sql = "select * from\n"
                    + "(select p.id, p.content, p.description, updated_date, featured, thumbnail_link, author_id, category_id, p.status as p_status, title,\n"
                    + "s.name as category_name\n"
                    + "from post p left join (select id, name from setting where type=\"Post category\") as s\n"
                    + "on p.category_id = s.id) as x\n"
                    + "left join (select a.id as user_id, a.email, a.password, a.full_name, \n"
                    + "a.gender, a.mobile, a.address, a.image_link, a.status as user_status , r.role_name, a.role_id\n"
                    + "from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r\n"
                    + "on a.role_id = r.role_id) as tbl\n"
                    + "on x.author_id = tbl.user_id";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id")); //done
                p.setTitle(rs.getString("title")); //done
                p.setContent(rs.getString("content"));//done
                p.setDescription(rs.getString("description"));//done
                p.setUpdatedDate(rs.getDate("updated_date"));//done
                p.setFeatured(rs.getBoolean("featured"));//done
                p.setThumbnailLink(rs.getString("thumbnail_link"));//done

                User acc = new User();
                acc.setId(rs.getInt("author_id"));//done
                acc.setEmail(rs.getString("email"));//done
                acc.setPassword(rs.getString("password"));//done
                acc.setFullName(rs.getString("full_name"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setMobile(rs.getString("mobile"));
                acc.setAddress(rs.getString("address"));
                acc.setImageLink(rs.getString("image_link"));
                acc.setStatus(rs.getBoolean("user_status"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getString("role_name"));
                acc.setRole(r);
                p.setAuthor(acc);

                PostCategory pc = new PostCategory();
                pc.setId(rs.getInt("category_id"));
                pc.setName(rs.getString("category_name"));

                p.setCategory(pc);
                p.setStatus(rs.getBoolean("p_status"));

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
    
    public ArrayList<PostCategory> getCategories() {
        ArrayList<PostCategory> post_categories = new ArrayList<>();
        try {
            String sql = "select id, name from setting where type=\"Service category\"";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                PostCategory pc = new PostCategory();
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
            String sql = "select * from\n" +
"                    (select p.id, p.content, p.description, updated_date, featured, thumbnail_link, author_id, category_id, p.status as p_status, title,\n" +
"                    s.name as category_name\n" +
"                    from post p left join (select id, name from setting where type=\"Post category\") as s\n" +
"				on p.category_id = s.id) as x\n" +
"                   left join (select a.id as user_id, a.email, a.password, a.full_name, \n" +
"                    a.gender, a.mobile, a.address, a.image_link, a.status as user_status , r.role_name, a.role_id\n" +
"                    from user a left join (select id as role_id, name as role_name from setting where type =\"Role\") as r\n" +
"                   on a.role_id = r.role_id) as tbl\n" +
"                   on x.author_id = tbl.user_id\n" +
"                   where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
                p.setId(rs.getInt("id")); //done
                p.setTitle(rs.getString("title")); //done
                p.setContent(rs.getString("content"));//done
                p.setDescription(rs.getString("description"));//done
                p.setUpdatedDate(rs.getDate("updated_date"));//done
                p.setFeatured(rs.getBoolean("featured"));//done
                p.setThumbnailLink(rs.getString("thumbnail_link"));//done

                User acc = new User();
                acc.setId(rs.getInt("author_id"));//done
                acc.setEmail(rs.getString("email"));//done
                acc.setPassword(rs.getString("password"));//done
                acc.setFullName(rs.getString("full_name"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setMobile(rs.getString("mobile"));
                acc.setAddress(rs.getString("address"));
                acc.setImageLink(rs.getString("image_link"));
                acc.setStatus(rs.getBoolean("user_status"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getString("role_name"));
                acc.setRole(r);
                p.setAuthor(acc);

                PostCategory pc = new PostCategory();
                pc.setId(rs.getInt("category_id"));
                pc.setName(rs.getString("category_name"));

                p.setCategory(pc);
                p.setStatus(rs.getBoolean("p_status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
    public void updatePost(Post p){
        try {
            String sql = "UPDATE `swp`.`post`\n" +
                            "SET\n" +
                            "`content` = ?,\n" +
                            "`description` = ?,\n" +
                            "`updated_date` = NOW(),\n" +
                            "`featured` = ?,\n" +
                            "`thumbnail_link` = ?,\n" +
                            "`author_id` = ?,\n" +
                            "`category_id` = ?,\n" +
                            "`status` = ?,\n" +
                            "`title` = ?\n" +
                            "WHERE `id` = ?;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, p.getContent());
            stm.setString(2, p.getDescription());

            stm.setBoolean(3, p.isFeatured());
            stm.setString(4, p.getThumbnailLink());
            stm.setInt(5, p.getAuthor().getId());
            stm.setInt(6, p.getCategory().getId());
            stm.setBoolean(7, p.isStatus());
            stm.setString(8, p.getTitle());
            stm.setInt(9, p.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<User> getAuthors() {
        ArrayList<User> users = new ArrayList<>();

        try {
            String sql = "select distinct author_id, email, password, full_name, \n"
                    + "gender, mobile, address, image_link, user_status , role_name, role_id from\n"
                    + "(select author_id\n"
                    + "from post p left join (select id, name from setting where type=\"Post category\") as s\n"
                    + "on p.category_id = s.id) as x\n"
                    + "left join (select a.id as user_id, a.email, a.password, a.full_name, \n"
                    + "a.gender, a.mobile, a.address, a.image_link, a.status as user_status , r.role_name, a.role_id\n"
                    + "from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r\n"
                    + "on a.role_id = r.role_id) as tbl\n"
                    + "on x.author_id = tbl.user_id";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                User acc = new User();
                acc.setId(rs.getInt("author_id"));//done
                acc.setEmail(rs.getString("email"));//done
                acc.setPassword(rs.getString("password"));//done
                acc.setFullName(rs.getString("full_name"));
                acc.setGender(rs.getBoolean("gender"));
                acc.setMobile(rs.getString("mobile"));
                acc.setAddress(rs.getString("address"));
                acc.setImageLink(rs.getString("image_link"));
                acc.setStatus(rs.getBoolean("user_status"));
                
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getString("role_name"));
                acc.setRole(r);
                users.add(acc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }
}
