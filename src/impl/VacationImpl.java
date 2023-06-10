package impl;

import dao.IVacation;
import entity.Vacation;
import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class VacationImpl implements IVacation {
	private SimpleDateFormat sdf;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public int add(Vacation vacation) {
		int i = 0;
		try {
			conn = DB.getConn();
			pst = conn
					.prepareStatement("INSERT INTO vacation (tec_id,stu_id,is_approv,start,end) VALUES (?,?,?,?,?)");
			pst.setInt(1, vacation.getStudent().getId());
			pst.setInt(2, vacation.getTeacher().getId());
			pst.setString(3, vacation.getIsApprov());
			pst.setString(4, vacation.getStart());
			pst.setString(5, vacation.getEnd());
			i = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return i;
	}

	public void delete(Vacation vacation) {
		try {
			conn = DB.getConn();
			pst = conn.prepareStatement("DELETE FROM vacation WHERE id = ?");
			pst.setInt(1, vacation.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
	}

	public void update(Vacation vacation) {
		try {
			conn = DB.getConn();
			pst = conn
					.prepareStatement("UPDATE vacation SET tec_id = ?,stu_id = ?,is_approv= ?,start= ?,end= ? WHERE id = ?");
			pst.setInt(1, vacation.getStudent().getId());
			pst.setInt(2, vacation.getTeacher().getId());
			pst.setString(3, vacation.getIsApprov());
			pst.setString(4, vacation.getStart());
			pst.setString(5, vacation.getEnd());
			pst.setInt(6, vacation.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
	}

	public List<Vacation> query(String type, String value) {
		ArrayList<Vacation> list = new ArrayList<Vacation>();
		sdf = new SimpleDateFormat("yyyy-MM-dd");  //简单日期表单，形式年-月-日
		try {
			conn = DB.getConn();
			if (type.equals("tec_id")) {
				pst = conn
						.prepareStatement("SELECT * FROM vacation WHERE tec_id = ? order by id"); //可选择教师id
				pst.setString(1, value);
			} else {
				pst = conn
						.prepareStatement("SELECT * FROM vacation order by id");
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				Vacation vacation = new Vacation();
				vacation.setId(rs.getInt(1));
				vacation.setTeacher(new TeacherImpl().query("tec_id",
						rs.getString(2)).get(0));
				vacation.setStudent(new StudentImpl().query("stu_id",
						rs.getString(3)).get(0));
				vacation.setIsApprov(rs.getString(4));
				vacation.setStart(rs.getString(5));
				vacation.setEnd(rs.getString(6));
				list.add(vacation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return list;
	}

	public List<Vacation> query(String type, String value, int currentPage) {
		currentPage = (currentPage - 1) * 10;
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<Vacation> list = new ArrayList<Vacation>();
		try {
			conn = DB.getConn();
			if (type.equals("tec_id")) {
				pst = conn
						.prepareStatement("SELECT * FROM vacation WHERE tec_id = ? order by id limit ?,10");
				pst.setString(1, value);
				pst.setInt(2, currentPage);
			} else {
				pst = conn
						.prepareStatement("SELECT * FROM vacation order by id limit ?,10");
				pst.setInt(1, currentPage);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				Vacation vacation = new Vacation();
				vacation.setId(rs.getInt(1));
				vacation.setTeacher(new TeacherImpl().query("tec_id",
						rs.getString(2)).get(0));
				vacation.setStudent(new StudentImpl().query("stu_id",
						rs.getString(3)).get(0));
				vacation.setIsApprov(rs.getString(4));
				vacation.setStart(rs.getString(5));
				vacation.setEnd(rs.getString(6));
				list.add(vacation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return list;
	}

	public int getCountPage(String type, String value) {
		int countPages = 0;
		try {
			conn = DB.getConn();
			if (type.equals("tec_id")) {
				pst = conn
						.prepareStatement("SELECT COUNT(*) FROM vacation WHERE tec_id = ?");
				pst.setString(1, value);
			} else {
				pst = conn.prepareStatement("SELECT COUNT(*) FROM vacation");
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				countPages = rs.getInt(1);
				countPages = countPages % 10 == 0 ? countPages / 10
						: countPages / 10 + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return countPages;
	}

}
