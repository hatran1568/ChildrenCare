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
    private Date reservationDate;
    private Date checkupTime;
    private Setting status;
    private User staff;
    private float totalCost;
    private ArrayList<Service> listService;
    private ArrayList<ReservationService> listReservationService;
    private boolean enough;

    public boolean isEnough() {
        return enough;
    }

    public void setEnough(boolean enough) {
        this.enough = enough;
    }
    
    

    public ArrayList<ReservationService> getListReservationService() {
        return listReservationService;
    }

    public void setListReservationService(ArrayList<ReservationService> listReservationService) {
        this.listReservationService = listReservationService;
    }
    
    

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

  


    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public Date getCheckupTime() {
        return checkupTime;
    }

    public void setCheckupTime(Date checkupTime) {
        this.checkupTime = checkupTime;
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

    public float getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(float totalCost) {
        this.totalCost = totalCost;
    }

    
    
    
}
