package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import kr.or.kosa.dto.Calendar;
import kr.or.kosa.utils.ConnectionHelper;

public class CalendarDao implements BookMarkDao{

	
	//일정 전체조회
	public List<Calendar> CalendarAlllist(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Calendar> calendaralllist = new ArrayList<Calendar>();
		//System.out.println("일정 전체 조회 함수 호출");
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select calendar_no, id, calendar_start, calendar_end, calendar_content, calendar_status from calendar";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Calendar calendar = new Calendar();
				calendar.setCalendar_no(rs.getInt(1));
				calendar.setId(rs.getString(2));
				calendar.setCalendar_start(rs.getString(3));
				calendar.setCalendar_end(rs.getString(4));
				calendar.setCalendar_content(rs.getString(5));
				calendar.setCalendar_status(rs.getInt(6));
				
				calendaralllist.add(calendar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return calendaralllist;
	}
	//일정 조건조회
	public List<Calendar> CalendarLikeList(String content){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		conn = ConnectionHelper.getConnection("oracle");
		List<Calendar> calendaralllist = new ArrayList<Calendar>();
		//System.out.println("일정 조건조회 함수 호출");
		try {
			
			sql = "select calendar_no, id, to_char(calendar_start), to_char(calendar_end), calendar_content, calendar_status from calendar where calendar_content like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+content+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Calendar calendar = new Calendar();
				calendar.setCalendar_no(rs.getInt(1));
				calendar.setId(rs.getString(2));
//				calendar.setCalendar_start(rs.getDate(3));
//				calendar.setCalendar_end(rs.getDate(4));
				calendar.setCalendar_start(rs.getString(3));
				calendar.setCalendar_end(rs.getString(4));
				calendar.setCalendar_content(rs.getString(5));
				calendar.setCalendar_status(rs.getInt(6));
				
				calendaralllist.add(calendar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return calendaralllist;
	}
	//일정 추가
		public int CalendarAdd(Calendar calendar){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int row = 0;
			conn = ConnectionHelper.getConnection("oracle");
			//System.out.println("일정 추가 함수 호출");
			try {
				sql = "insert into Calendar(calendar_no, id, calendar_start, calendar_end, calendar_content, calendar_status) values(calendar_no_seq.nextval, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, calendar.getId());
				pstmt.setString(2, calendar.getCalendar_start());
				pstmt.setString(3, calendar.getCalendar_end());
				pstmt.setString(4, calendar.getCalendar_content());
				pstmt.setInt(5, calendar.getCalendar_status());
				
				row = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					ConnectionHelper.close(pstmt);
					ConnectionHelper.close(conn);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return row;
		}
	//일정 수정
		public int CalendarUpdate(Calendar calendar){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int row = 0;
			conn = ConnectionHelper.getConnection("oracle");
			//System.out.println("일정 수정 함수 호출");
			try {
				sql = "update calendar set calendar_start=?, calendar_end=?, calendar_content=?, calendar_status=? where calendar_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(5, calendar.getCalendar_no());
				pstmt.setString(1, calendar.getCalendar_start());
				pstmt.setString(2, calendar.getCalendar_end());
				pstmt.setString(3, calendar.getCalendar_content());
				pstmt.setInt(4, calendar.getCalendar_status());
				
				row = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					ConnectionHelper.close(pstmt);
					ConnectionHelper.close(conn);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return row;
		}
	//일정 삭제
		public int CalendarDelete(int no){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int row = 0;
			conn = ConnectionHelper.getConnection("oracle");
			//System.out.println("일정 삭제 함수 호출");
			try {
				sql = "delete from calendar where calendar_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				
				
				row = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					ConnectionHelper.close(pstmt);
					ConnectionHelper.close(conn);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return row;
		}
	//일정 상세조회
		public Calendar CalendarDetail(int calendar_no){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			conn = ConnectionHelper.getConnection("oracle");
			//System.out.println("일정 상세 조회 함수 호출");
			Calendar calendar = new Calendar();
			try {
				sql = "select calendar_no, id, to_char(calendar_start), to_char(calendar_end), calendar_content, calendar_status from calendar where calendar_no = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, calendar_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					calendar.setCalendar_no(rs.getInt(1));
					calendar.setId(rs.getString(2));
					calendar.setCalendar_start(rs.getString(3));
					calendar.setCalendar_end(rs.getString(4));
					calendar.setCalendar_content(rs.getString(5));
					calendar.setCalendar_status(rs.getInt(6));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					ConnectionHelper.close(rs);
					ConnectionHelper.close(pstmt);
					ConnectionHelper.close(conn);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return calendar;
		}
}