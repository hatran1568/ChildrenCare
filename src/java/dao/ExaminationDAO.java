
package dao;

import bean.MedicalExamination;
import bean.Receiver;
import bean.Reservation;
import bean.ReservationService;
import bean.Service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExaminationDAO extends BaseDAO{
    
    private ServiceDAO serviceDB = new ServiceDAO();
    private SettingDAO settingDB = new SettingDAO();
    private ReceiverDAO receiverDB = new ReceiverDAO();
    
    public int countExamination(int rid, int sid){
        int count = 0;
        try {
            String sql = "SELECT COUNT(reservation_id) as count FROM swp.medical_examination\n" +
                    " where reservation_id = ? and service_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setInt(2, sid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                count = rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExaminationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public void addExamination(MedicalExamination exam){
        try {
            String sql = "INSERT INTO `swp`.`medical_examination`\n" +
                    "(`reservation_id`, `service_id`, `receiver_id`, `prescription`)\n" +
                    "VALUES (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, exam.getReservationService().getReservation().getId());
            stm.setInt(2, exam.getReservationService().getService().getId());
            stm.setInt(3, exam.getReceiver().getId());
            stm.setString(4, exam.getPrescription());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExaminationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<MedicalExamination> getExamsByReservation(int rid){
        ArrayList<MedicalExamination> list = new ArrayList<>();
        try {
            String sql = "select m.reservation_id, m.service_id, s.fullname as service_name, m.receiver_id, r.full_name as receiver_name,\n" +
                        "r.gender, r.email, m.prescription\n" +
                        " from medical_examination m INNER JOIN service s\n" +
                        " on m.service_id = s.id\n" +
                        " join receiver r on m.receiver_id = r.id\n" +
                         "where reservation_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            ReservationDAO reservationDB = new ReservationDAO();
            stm.setInt(1, rid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                MedicalExamination m = new MedicalExamination();
                ReservationService r = new ReservationService();
                Reservation re = reservationDB.getReservationById(rs.getInt("reservation_id"));
                r.setReservation(re);
                Service s = serviceDB.getService(rs.getInt("service_id"));
                r.setService(s);
                m.setReservationService(r);
                Receiver receiver = receiverDB.getReceiversById(rs.getInt("receiver_id"));
                m.setReceiver(receiver);
                m.setPrescription(rs.getString("prescription"));
                list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExaminationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public MedicalExamination getAnExamination(int rid,int sid, int recid){
        
        try {
            String sql = "select m.reservation_id, m.service_id, s.fullname as service_name, m.receiver_id, r.full_name as receiver_name,\n" +
                        "r.gender, r.email, m.prescription\n" +
                        " from medical_examination m INNER JOIN service s\n" +
                        " on m.service_id = s.id\n" +
                        " join receiver r on m.receiver_id = r.id\n" +
                         "where reservation_id = ? and service_id = ? and receiver_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            ReservationDAO reservationDB = new ReservationDAO();
            stm.setInt(1, rid);
            stm.setInt(2, sid);
            stm.setInt(3, recid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                MedicalExamination m = new MedicalExamination();
                ReservationService r = new ReservationService();
                Reservation re = reservationDB.getReservationById(rs.getInt("reservation_id"));
                r.setReservation(re);
                Service s = serviceDB.getService(rs.getInt("service_id"));
                r.setService(s);
                m.setReservationService(r);
                Receiver receiver = receiverDB.getReceiversById(rs.getInt("receiver_id"));
                m.setReceiver(receiver);
                m.setPrescription(rs.getString("prescription"));
                return m;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExaminationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
