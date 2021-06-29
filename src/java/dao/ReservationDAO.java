/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Receiver;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import bean.User;
import bean.Reservation;
import bean.ReservationService;
import bean.Service;
import java.sql.Date;

/**
 *
 * @author HP
 */
public class ReservationDAO extends BaseDAO {

    private UserDAO userDB = new UserDAO();
    private ServiceDAO serviceDB = new ServiceDAO();
    private SettingDAO settingDB = new SettingDAO();
    private ReceiverDAO receiverDB = new ReceiverDAO();

    public ArrayList<Reservation> getReservation(User u) {
        try {
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            String sql = "SELECT\n"
                    + "reservation.id,\n"
                    + "reservation.customer_id,\n"
                    + "reservation.reservation_date,\n"
                    + "reservation.status_id,\n"
                    + "reservation.staff_id,\n"
                    + "reservation.receiver_id,\n"
                    + "reservation.checkup_time\n"
                    + "FROM\n"
                    + "reservation\n"
                    + "WHERE customer_id =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setCustomer(u);
                r.setReservation_date(rs.getDate("reservation_date"));
                User staff = new User();
                staff.setId(rs.getInt("staff_id"));
                r.setStaff(staff);
                r.setCheckup_time(rs.getDate("checkup_time"));
                r.setStatus(settingDB.getSettingById(rs.getInt("status_id")));
                list.add(r);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Reservation> getReservationWithoutPending(User u) {
        try {
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            String sql = "SELECT\n"
                    + "reservation.id,\n"
                    + "reservation.customer_id,\n"
                    + "reservation.reservation_date,\n"
                    + "reservation.status_id,\n"
                    + "reservation.staff_id,\n"
                    + "reservation.receiver_id,\n"
                    + "reservation.checkup_time\n"
                    + "FROM\n"
                    + "reservation\n"
                    + "WHERE customer_id =? and status_id!=19";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setCustomer(u);
                r.setReservation_date(rs.getDate("reservation_date"));
                User staff = new User();
                staff.setId(rs.getInt("staff_id"));
                r.setStaff(staff);
                r.setCheckup_time(rs.getDate("checkup_time"));
                r.setStatus(settingDB.getSettingById(rs.getInt("status_id")));
                list.add(r);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Reservation> getReservation(User u, int status) {
        try {
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            String sql = "SELECT\n"
                    + "reservation.id,\n"
                    + "reservation.customer_id,\n"
                    + "reservation.reservation_date,\n"
                    + "reservation.status_id,\n"
                    + "reservation.staff_id,\n"
                    + "reservation.receiver_id,\n"
                    + "reservation.checkup_time\n"
                    + "FROM\n"
                    + "reservation\n"
                    + "WHERE customer_id =? and status_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            stm.setInt(2, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setCustomer(u);
                r.setReservation_date(rs.getDate("reservation_date"));
                User staff = new User();
                staff.setId(rs.getInt("staff_id"));
                r.setStaff(staff);
                r.setStatus(settingDB.getSettingById(rs.getInt("status_id")));
                list.add(r);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Reservation getReservationById(int id) {
        try {
            String sql = "SELECT\n"
                    + "reservation.id,\n"
                    + "reservation.customer_id,\n"
                    + "reservation.reservation_date,\n"
                    + "reservation.status_id,\n"
                    + "reservation.staff_id,\n"
                    + "reservation.receiver_id,\n"
                    + "reservation.checkup_time\n"
                    + "FROM\n"
                    + "reservation\n"
                    + "WHERE id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Reservation s = new Reservation();
                s.setId(id);
                s.setCheckup_time(rs.getDate("checkup_time"));
                s.setReservation_date(rs.getDate("reservation_date"));
                s.setStatus(settingDB.getSetting(rs.getInt("status_id")));
                s.setCustomer(userDB.getUser(rs.getInt("customer_id")));
                s.setStaff(userDB.getUser(rs.getInt("staff_id")));
                s.setReceiver(receiverDB.getReceiversById(rs.getInt("receiver_id")));
                return s;

            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

//    public void addReservation(Reservation r) {
//        try {
//            String sql = "insert into reservation(customer_id, reservation_date, status,\n"
//                    + "            staff_id, number_of_person)\n"
//                    + "            values(?, ?, ?, ?, ?)";
//
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, r.getCustomer().getId());
//            stm.setDate(2, r.getReservation_date());
//            stm.setString(3, r.getStatus());
//            stm.setInt(4, r.getStaff().getId());
//            stm.setInt(5, r.getNumber_of_person());
//
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public Reservation getReservationById(int id) {
//        Reservation r = new Reservation();
//        try {
//            String sql = "select reservation.id, reservation.customer_id, reservation.reservation_date,\n"
//                    + "            reservation.status, reservation.number_of_person,\n"
//                    + "            user.email, user.full_name, user.mobile, user.image_link  \n"
//                    + "            from reservation left join user\n"
//                    + "            on reservation.staff_id = user.id\n"
//                    + "where reservation.id = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, id);
//            ResultSet rs = stm.executeQuery();
//            if (rs.next()) {
//                r.setId(rs.getInt("id"));
//                User customer = new User();
//                customer.setId(rs.getInt("customer_id"));
//                r.setCustomer(customer);
//                r.setReservation_date(rs.getDate("reservation_date"));
//                r.setStatus(settingDB.getSettingById(rs.getInt("status")));
//                
//
//                User staff = new User();
//                staff.setEmail(rs.getString("email"));
//                staff.setFullName(rs.getString("full_name"));
//                staff.setMobile(rs.getString("mobile"));
//                staff.setImageLink(rs.getString("image_link"));
//                r.setStaff(staff);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return r;
//    }
    public ArrayList<ReservationService> getReservationServices(Reservation reservation) {
        ArrayList<ReservationService> services = new ArrayList<>();

        try {
            String sql = "SELECT\n"
                    + "reservation_service.reservation_id,\n"
                    + "reservation_service.service_id,\n"
                    + "reservation_service.quantity,\n"
                    + "reservation_service.unit_price\n"
                    + "FROM\n"
                    + "reservation_service\n"
                    + "WHERE reservation_id=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, reservation.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ReservationService rerserReservationService = new ReservationService();
                rerserReservationService.setReservation(reservation);
                rerserReservationService.setService(serviceDB.getService(rs.getInt("service_id")));
                rerserReservationService.setQuantity(rs.getInt("quantity"));
                rerserReservationService.setUnitPrice(rs.getFloat("unit_price"));
                services.add(rerserReservationService);
            }
            return services;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<ReservationService> getReservationServices(Reservation reservation, Service service) {
        ArrayList<ReservationService> services = new ArrayList<>();

        try {
            String sql = "SELECT\n"
                    + "reservation_service.reservation_id,\n"
                    + "reservation_service.service_id,\n"
                    + "reservation_service.quantity,\n"
                    + "reservation_service.unit_price\n"
                    + "FROM\n"
                    + "reservation_service\n"
                    + "WHERE reservation_id=? and service_id =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, reservation.getId());
            stm.setInt(2, service.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ReservationService rerserReservationService = new ReservationService();
                rerserReservationService.setReservation(reservation);
                rerserReservationService.setService(serviceDB.getService(rs.getInt("service_id")));
                rerserReservationService.setQuantity(rs.getInt("quantity"));
                rerserReservationService.setUnitPrice(rs.getFloat("unit_price"));
                services.add(rerserReservationService);
            }
            return services;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void submitReservation(int reservation_id) {
        try {
            String sql = "update reservation set reservation.status_id = ?\n"
                    + "where reservation.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, 20);
            stm.setInt(2, reservation_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeStaffReservation(int reservation_id, int staff_id) {
        try {
            String sql = "update reservation set reservation.staff_id = ?\n"
                    + "where reservation.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, staff_id);
            stm.setInt(2, reservation_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addReservationService(Reservation r, Service s, Receiver rc) {
        try {
            String sql = "insert into reservation_service(reservation_id, service_id, prescription_id, receiver_id,\n"
                    + "            datetime, unit_price)\n"
                    + "            values(?, ?, ?, ?, ?, ?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.setInt(2, s.getId());
            stm.setInt(3, 1);
            stm.setInt(4, rc.getId());
            stm.setDate(5, r.getReservation_date());
            stm.setFloat(6, s.getSalePrice());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countReservations(User staff) {
        try {
            String sql = "SELECT COUNT(*) as total FROM reservation WHERE staff_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, staff.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int returnNewestReservation() {
        try {
            int n = 0;
            String sql = "SELECT MAX(id) AS 'Maximum'\n"
                    + "FROM reservation";

            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                n = rs.getInt("Maximum");
            }
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public float getTotalCost(Reservation r) {
        try {
            String sql = "select sum(unit_price) as sum FROM reservation_service where reservation_id =  ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("sum");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void deleteReservationService(Reservation r) {
        try {
            String sql = "delete from reservation_service where reservation_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteReservationService(int rid, int sid) {
        try {
            String sql = "delete from reservation_service where reservation_id =? and service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setInt(2, sid);

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteReservation(int rid) {
        try {
            String sql = "delete from reservation where id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void cancelReservation(Reservation r) {
        try {
            String sql = "update reservation set status = 'Cancel' where id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countReservation(int status) {
        try {
            int a = 0;
            String sql = "SELECT count(status_id) as total from reservation where status_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                a = rs.getInt("total");
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }

    public int countReservation(Date date) {
        try {
            int a = 0;
            String sql = "SELECT count(status_id) as total from reservation where  reservation_date=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                a = rs.getInt("total");
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }

    public int countReservation(int status, Date date) {
        try {
            int a = 0;
            String sql = "SELECT count(status_id) as total from reservation where status_id =? and reservation_date=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setDate(2, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                a = rs.getInt("total");
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }

    public float getRevenue(Service s) {
        try {
            String sql = "SELECT sum(unit_price) as total from reservation_service where service_id=? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void editReservationService(int rid, int sid, int quantity) {
        try {
            String sql = "UPDATE reservation_service set quantity = ? where reservation_id =? and service_id=? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, rid);
            stm.setInt(3, sid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editReceiver(int reservationID, int receiverID) {
        try {
            String sql = "update reservation set receiver_id = ? where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, receiverID);
            stm.setInt(2, reservationID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editCheckupTime(int reservationID, Date checkupTime){
        try{
            String sql = "update reservation set checkup_time = ? where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, checkupTime);
            stm.setInt(2, reservationID);
            stm.executeUpdate();
        }catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    public int getPendingReservation(User customer) {
        int i = 0;
        try {
            String sql = "select id \n"
                    + "from reservation r join (select id as stt_id, name as stt_name from setting where type = \"Reservation Status\" and name = \"Pending\") as s\n"
                    + "on r.status_id = s.stt_id\n"
                    + "where customer_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customer.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                i = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int addPendingReservation(User customer) {
        int id = 0;
        try {
            String sql = "INSERT INTO `swp`.`reservation` (`customer_id`, `status_id`) VALUES (?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customer.getId());
            stm.setInt(2, 19);
            stm.executeUpdate();
            sql = "SELECT LAST_INSERT_ID() as id";
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public int checkReservationServiceExists(Reservation r, Service s) {
        int quantity = 0;
        try {
            String sql = "select * from reservation_service where reservation_id = ? and service_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.setInt(2, s.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantity;
    }

    public void addReservationService(Reservation r, Service s, int quantity) {
        try {
            int current_quantity = checkReservationServiceExists(r, s);
            String sql = "select * from reservation_service";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (current_quantity == 0) {
                sql = "INSERT INTO `swp`.`reservation_service`\n"
                        + "(`reservation_id`,\n"
                        + "`service_id`,\n"
                        + "`quantity`,\n"
                        + "`unit_price`)\n"
                        + "VALUES\n"
                        + "(?,\n"
                        + "?,\n"
                        + "?,\n"
                        + "?);";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, r.getId());
                stm.setInt(2, s.getId());
                stm.setInt(3, quantity);
                stm.setFloat(4, s.getSalePrice());
            } else if (current_quantity > 0) {
                sql = "UPDATE `swp`.`reservation_service`\n"
                        + "SET\n"
                        + "`quantity` = ?\n"
                        + "WHERE `reservation_id` = ? AND `service_id` = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, current_quantity + quantity);
                stm.setInt(2, r.getId());
                stm.setInt(3, s.getId());
            }
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
