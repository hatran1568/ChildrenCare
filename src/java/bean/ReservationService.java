/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class ReservationService {
    int id;
    Reservation r;
    Service s;
    Precription p;
    Date dateTime;
    float unitprice;
    Receiver re;

    public Receiver getRe() {
        return re;
    }

    public void setRe(Receiver re) {
        this.re = re;
    }

    public ReservationService() {
    }

    public ReservationService(int id, Reservation r, Service s, Precription p, Date dateTime, float unitprice) {
        this.id = id;
        this.r = r;
        this.s = s;
        this.p = p;
        this.dateTime = dateTime;
        this.unitprice = unitprice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Reservation getR() {
        return r;
    }

    public void setR(Reservation r) {
        this.r = r;
    }

    public Service getS() {
        return s;
    }

    public void setS(Service s) {
        this.s = s;
    }

    public Precription getP() {
        return p;
    }

    public void setP(Precription p) {
        this.p = p;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public float getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(float unitprice) {
        this.unitprice = unitprice;
    }
    
    
}
