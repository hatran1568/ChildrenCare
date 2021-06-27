/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class Reservation {
    private int id;
    private User customer;
    private Receiver receiver;
    private Date reservation_date;
    private Date checkup_time;
    private Setting status;
    private User staff;
    private float total_cost;
    private ArrayList<Service> listService;

    public ArrayList<Service> getListService() {
        return listService;
    }

    public void setListService(ArrayList<Service> listService) {
        this.listService = listService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Receiver getReceiver() {
        return receiver;
    }

    public void setReceiver(Receiver receiver) {
        this.receiver = receiver;
    }

  


    public Date getReservation_date() {
        return reservation_date;
    }

    public void setReservation_date(Date reservation_date) {
        this.reservation_date = reservation_date;
    }

    public Date getCheckup_time() {
        return checkup_time;
    }

    public void setCheckup_time(Date checkup_time) {
        this.checkup_time = checkup_time;
    }

    public Setting getStatus() {
        return status;
    }

    public void setStatus(Setting status) {
        this.status = status;
    }

    public User getStaff() {
        return staff;
    }

    public void setStaff(User staff) {
        this.staff = staff;
    }

    public float getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(float total_cost) {
        this.total_cost = total_cost;
    }

    
    
    
}
