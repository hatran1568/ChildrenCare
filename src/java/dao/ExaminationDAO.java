
package dao;

import bean.MedicalExamination;
import bean.Reservation;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExaminationDAO extends BaseDAO{
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
}
