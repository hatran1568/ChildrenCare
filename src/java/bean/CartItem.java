/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author ACER
 */
public class CartItem {

    private Service service;
    private User user;
    private int quantity;

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CartItem(Service service, User user, int quantity) {
        this.service = service;
        this.user = user;
        this.quantity = quantity;
    }

    public boolean equals(CartItem obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj.getService().getId() != this.service.getId()) {
            return false;
        }
        return true;
    }
    
    public CartItem(){
        
    }
}
