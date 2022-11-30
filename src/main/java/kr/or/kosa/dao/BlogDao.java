package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import kr.or.kosa.dto.Blog_Board;
import kr.or.kosa.dto.Blog_Reply;
import kr.or.kosa.utils.ConnectionHelper;

public class BlogDao implements BookMarkDao{
	
	//블로그 글 전체 불러오기
	public List<Blog_Board> AllBoard(){//int cpage , int pagesize){
		List<Blog_Board> boardList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql=  "select a.blog_no, a.id, a.blog_title, a.blog_content, a.hits, to_char(a.blog_date), b.file_name "
					+ "from blog_board a left join blogfile b "
					+ "on a.blog_no = b.blog_no ";
			pstmt = conn.prepareStatement(sql);
			//공식같은 로직
//			int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
//			int end = cpage * pagesize; // 1 * 5 >> 5
//			
//			pstmt.setInt(1, end);
//			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			boardList = new ArrayList<>();
			
			while(rs.next()) {
				Blog_Board board = new Blog_Board();
				board.setBlog_no(rs.getInt(1));//블로그 번호
				board.setId(rs.getString(2)); //작성자
				board.setBlog_title(rs.getString(3)); //제목
				board.setBlog_content(rs.getString(4));//내용
				board.setHits(rs.getInt(5));//조회수
				board.setBlog_date(rs.getString(6)); //날짜
				board.setBlog_filename(rs.getString(7)); //파일이름
				
				boardList.add(board);
			}
			
		}catch (Exception e) {
			System.out.println("AllBoard 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
//				pstmt.close();
//				rs.close();
//				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return boardList;
	}
	
	//특정 아이디의 블로그 게시글 전체 조회 추가 김태우 (11.21)//블로그 글 전체 불러오기
	public List<Blog_Board> getBoardListById(String type, String value){//int cpage , int pagesize){
		List<Blog_Board> boardList = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql=  "select a.blog_no, a.id, a.blog_title, a.blog_content, a.hits, to_char(a.blog_date), b.file_name "
					+ "from blog_board a left join blogfile b "
					+ "on a.blog_no = b.blog_no where a." + type;
			sql += (type.equals("id")) ? " =  ?" : " like ?"; 
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			System.out.println(10);
			if(type.equals("id")) {
				pstmt.setString(1, value);
			}else {
				pstmt.setString(1, '%'+value+'%');
			}
			System.out.println(value);
			rs = pstmt.executeQuery();
			boardList = new ArrayList<Blog_Board>();
			
			while(rs.next()) {
				Blog_Board board = new Blog_Board();
				board.setBlog_no(rs.getInt(1));//블로그 번호
				board.setId(rs.getString(2)); //작성자
				board.setBlog_title(rs.getString(3)); //제목
				board.setBlog_content(rs.getString(4));//내용
				board.setHits(rs.getInt(5));//조회수
				board.setBlog_date(rs.getString(6)); //날짜
				board.setBlog_filename(rs.getString(7)); //파일이름
				
				boardList.add(board);
			}
			
		}catch (Exception e) {
			System.out.println("AllBoard 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		System.out.println(boardList);
		return boardList;
	}
	
	//게시물 총 건수 구하기
	public int totalBoardCount() {

		int totalcount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select count(*) as cnt from blog_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalcount = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("totalBoardCount 예외 : " + e.getMessage());
		}finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return totalcount;
	}
	
	
	//블로그 특정 글 조회
	//파일이 있을 경우 조인해서...
	public Blog_Board getContent(int blog_no) {

		Blog_Board board = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select a.blog_no, a.id, a.blog_title, a.blog_content, a.hits, to_char(a.blog_date), b.file_name "
					+ "from blog_board a left join blogfile b "
					+ "on a.blog_no = b.blog_no "
					+ "where a.blog_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blog_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(2);
				String blog_title = rs.getString(3);
				String blog_content = rs.getString(4);
				int hits = rs.getInt(5);
				String blog_date = rs.getString(6);
				String file_name = rs.getString(7);
				
				board = new Blog_Board(blog_no, id, blog_title, blog_content, hits, blog_date, file_name);
				System.out.println(board);
			}	
		} catch (Exception e) {
			System.out.println("getContent 예외 : " + e.getMessage());
		}finally {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
		}
		System.out.println("bloggggggggggggggggggggggggggggggggggggggggggggggggggggg");
		System.out.println(board);
		return board;
	}
	
	//게시글 조회수 증가
	public boolean upHits(int blog_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "update blog_board set hits = hits + 1"
					+ " where blog_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blog_no);
			
			int resultrow = pstmt.executeUpdate();
			if(resultrow > 0) {
				result = true;
			}
			
		} catch (Exception e) {
			System.out.println("upHits 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				
			}
		}
		
		return result;
	}
	
	//글 작성
	public int writeok(Blog_Board board) {
		int row = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			/*
			 * String boardsql = "insert into" +
			 * " blog_board(blog_no, id, blog_title, blog_content, hits)" +
			 * " values(blog_no_seq.nextval,?,?,?,?)"; //blog_no 에 _seq 추가 (11.21 김태우) pstmt
			 * = conn.prepareStatement(boardsql);
			 * 
			 * pstmt.setString(1, board.getId()); pstmt.setString(2, board.getBlog_title());
			 * pstmt.setString(3, board.getBlog_content()); pstmt.setInt(4,
			 * board.getHits()); row = pstmt.executeUpdate(); //파일이 있다면
			 * ///////////////////////// if(board.getBlog_filename() != null) {
			 * pstmt.close(); String filesql =
			 * "insert into blogfile(blog_no, file_name) values(?,?)"; pstmt =
			 * conn.prepareStatement(filesql); pstmt.setInt(1, board.getBlog_no());
			 * ////////////이 부분은 어떻게 해야될까?? //TODO : 블로그 파일 테이블 인덱스 처리하기 //블로그테이블에서는
			 * nextval로 인덱스를 증가시켰는데 //모든 글이 파일을 가지고 있는건 아니니까 여기선 그렇게 하면 안되는데 //그럼 인덱스를 어떻게
			 * 같게 하지 ?? pstmt.setString(2, board.getBlog_filename()); pstmt.execute(); }
			 */
			System.out.println(board);
			
			if(board.getBlog_filename() != null) {
				System.out.println("file not null");
				sql = "insert all"
						+ "into blog_board(blog_no, id, blog_title, blog_content)"
						+ "values(blog_no_seq.nextval, ?, ?, ?)"
						+ "into blogfile(blog_no, file_name) values(blog_no_seq.currentval, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getBlog_title());
				pstmt.setString(3, board.getBlog_content());
				pstmt.setString(4, board.getBlog_filename());
				row = pstmt.executeUpdate();
			} else {
				System.out.println("file null");
				sql = "insert into blog_board(blog_no, id, blog_title, blog_content)"
						+ " values (blog_no_seq.nextval, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getBlog_title());
				pstmt.setString(3, board.getBlog_content());
				row = pstmt.executeUpdate();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("writeok 예외 : " + e.getMessage());
		}finally {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
		}
		 System.out.println("DAO row : " + row);
		return row;
	}
	
	//글 수정
	public int blogEdit(Blog_Board board) {
		int row = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int blog_no = board.getBlog_no();
		//String id = board.getParameter("id");
		String blog_title = board.getBlog_title();
		String blog_content = board.getBlog_content();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			conn.setAutoCommit(false);
			String sql = "update blog_board set blog_title=?, blog_content=? "
					+ "where blog_no=?";
			pstmt = conn.prepareStatement(sql);
			System.out.println("daooooooooooo");
			System.out.println(blog_content);
			
			pstmt.setString(1, blog_title);
			pstmt.setString(2, blog_content);
			pstmt.setInt(3, blog_no);
			
			row = pstmt.executeUpdate();

			sql = "select * from blogfile where blog_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blog_no);
			rs = pstmt.executeQuery();
			
			//데이터베이스에 파일이 있으면 true
			boolean dbfile = (rs.next()) ? true : false;
			
			
			if(row>0) {//업데이트 성공하면
				if(board.getBlog_filename() == null) {//수정페이지에서 파일이 없을 경우
					System.out.println("파일 X");
					if(dbfile) { //db에 파일이 있으면
						System.out.println("파일");
						sql = "delete from blogfile where blog_no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, blog_no);
					}
				}else { //수정페이지에서 파일이 있을 경우
					if(dbfile) { //수정페이지, 데이터베이스 둘 다 있음 >> 변경
						sql = "update blogfile set file_name = ? where blog_no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, board.getBlog_filename());
						pstmt.setInt(2, blog_no);
					}else { //데이터베이스에 파일이 없음 >> insert
						sql = "insert into blogfile(blog_no, file_name) values(?,?)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, blog_no);
						pstmt.setString(2, board.getBlog_filename());
					}
				}
			}
			if(pstmt.executeUpdate() >0) {
				row++;
			}
			conn.commit();
		} catch (Exception e) {
			System.out.println("blogEdit 예외 : " + e.getMessage());
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
	
	//글 삭제
	public int deleteOk(int blog_no) {
		int row = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "delete from blog_board where blog_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blog_no);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteOk 예외 : " + e.getMessage());
		}finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}
	//전체 댓글 불러오기
	public List<Blog_Reply> getAllReply() {

		ArrayList<Blog_Reply> replylist = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select blog_reply_no,blog_no, id, refer, depth, step, to_char(reply_date) as reply_date , reply_content, del "
					+ "from blog_reply";
			
			pstmt = conn.prepareStatement(sql);
			//왜 blogDto에선 blog_no가 int인데 여기선 String이지 .. ??
			//실수였대~int로 바꿨삼 221118 19:04
			
			rs = pstmt.executeQuery();
			replylist = new ArrayList<>();
			
			while(rs.next()) {
				int blog_reply_no = rs.getInt("blog_reply_no");
				int blog_no = rs.getInt("blog_no");
				String id = rs.getString("id");
				int refer = rs.getInt("refer");
				int depth = rs.getInt("depth");
				int step = rs.getInt("step");
				String reply_date = rs.getString("reply_date");
				String reply_content = rs.getString("reply_content");
				int del = rs.getInt("del");
				
				Blog_Reply reply = new Blog_Reply(blog_reply_no, blog_no, id, reply_date, reply_content, refer, depth, step, del);
				replylist.add(reply);
			}
			
		} catch (Exception e) {
			System.out.println("getReply 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				
			}
		}
		
		return replylist;
	}
	//like로 검색하기
	public List<Blog_Reply> getAllReplyByLike(String searchid) {

		ArrayList<Blog_Reply> replylist =  new ArrayList<Blog_Reply>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select blog_reply_no,blog_no, id, refer, depth, step, to_char(reply_date), reply_content, del "
					+ "from blog_reply where id like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchid+"%");
			//왜 blogDto에선 blog_no가 int인데 여기선 String이지 .. ??
			//실수였대~int로 바꿨삼 221118 19:04

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(1);
				int blog_reply_no = rs.getInt("blog_reply_no");
				int blog_no = rs.getInt("blog_no");
				String id = rs.getString("id");
				int refer = rs.getInt("refer");
				int depth = rs.getInt("depth");
				int step = rs.getInt("step");
				String reply_date = rs.getString("reply_date");
				String reply_content = rs.getString("reply_content");
				int del = rs.getInt("del");
				
				Blog_Reply reply = new Blog_Reply(blog_reply_no, blog_no, id, reply_date, reply_content, refer, depth, step, del);
				System.out.println(".");
				System.out.println(reply);
				replylist.add(reply);
			}
		} catch (Exception e) {
			System.out.println("getReply 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				
			}
		}
		return replylist;
	}
	//특정 글 댓글 불러오기
	public List<Blog_Reply> getReply(int blog_no) {

		ArrayList<Blog_Reply> replylist = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select blog_reply_no, id, refer, depth, step, to_char(reply_date), reply_content, del "
					+ "from blog_reply where blog_no = ? order by refer desc, step asc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blog_no);
			//왜 blogDto에선 blog_no가 int인데 여기선 String이지 .. ??
			//실수였대~int로 바꿨삼 221118 19:04
			
			rs = pstmt.executeQuery();
			replylist = new ArrayList<>();
			
			while(rs.next()) {
				int blog_reply_no = rs.getInt(1);
				String id = rs.getString(2);
				int refer = rs.getInt(3);
				int depth = rs.getInt(4);
				int step = rs.getInt(5);
				String reply_date = rs.getString(6);
				String reply_content = rs.getString(7);
				int del = rs.getInt(8);
				
				Blog_Reply reply = new Blog_Reply(blog_reply_no, blog_no, id, reply_date, reply_content, refer, depth, step, del);
				replylist.add(reply);
			}
			
		} catch (Exception e) {
			System.out.println("getReply 예외 : " + e.getMessage());
		}finally {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
		}
		
		return replylist;
	}
	
	//댓글 작성
	public int replyWrite(int blog_no, String id, String content){

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int resultrow = 0;
		int maxrefer = getMaxRefer();
		int refer = maxrefer + 1;
		//blog_reply_no를 지금은 받아주고 나중엔 안받아줘도 된다 ? ?
		//원댓글 쓸 땐 blog_reply_no = refer
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into blog_reply(blog_reply_no, blog_no, id, refer, reply_content, del)"
					+ " values(blog_reply_no_seq.nextval,?,?,?,?,?)";
			//blog__reply_no_ 에 seq 추가 (11.21 김태우)
			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setInt(1, blog_reply_no);
			pstmt.setInt(1, blog_no);
			pstmt.setString(2, id);
			pstmt.setInt(3, refer);
			pstmt.setString(4, content);
			pstmt.setInt(5, 0); //del
			
			resultrow = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("replyWrite 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				
			}
		}
		
		return resultrow;
	}
	
	//TODO : 댓글 refer 값 생성하기 ?
	private int getMaxRefer() {

		int refer_max = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select nvl(max(refer), 0) from blog_reply";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getMaxRefer 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			}catch (Exception e) {
				
			}
		}
		
		return refer_max;
	}
	//계층형 게시판
	//refer(참조값) , step , depth
	//1. 원본글 : refer 생성?  , step(0) default , depth(0) default
	//2. 답변글 : refer 생성?  , step +1 , depth +1, 현재 읽은 글에 depth + 1
	
	//대댓글 작성
	public int replyRewrite(Blog_Reply reply) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			int blog_reply_no = reply.getBlog_reply_no(); //현재 댓글의 번호
			//대댓글 작성하려는 원댓글
			String originsql = "select refer, depth, step from blog_reply where blog_reply_no = ?";
			//대댓글 insert 쿼리
			String insertsql = "insert into blog_reply(blog_reply_no, id, refer, depth, step, reply_content, del,blog_no) "
					+ "values(blog_reply_no_seq.nextval, ?, ?, ?, ?, ?, 0,?)";
			//여기 테이블에 시퀀스가 있나 ?? -> 만들라고 했삼 221120 16:05
			//blog__reply_no_ 에 seq 추가 (11.21 김태우)
			
			pstmt = conn.prepareStatement(originsql);
			pstmt.setInt(1, blog_reply_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { //데이터가 존재한다면
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				
				pstmt = conn.prepareStatement(insertsql);
				pstmt.setString(1, reply.getId());
				pstmt.setInt(2, refer);
				pstmt.setInt(3, depth + 1);
				pstmt.setInt(4, step + 1);
				pstmt.setString(5, reply.getReply_content());
				pstmt.setInt(6, reply.getBlog_no());
				int row = pstmt.executeUpdate();
				if(row > 0) {
					result = row;
				}else {
					result = -1;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectionHelper.close(rs);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				
			}
		}
		
		return result;
	}
	
	
	
	//댓글 수정
	public int replyEdit(HttpServletRequest reply) {
		int row = 0;
		String blog_reply_no = reply.getParameter("blog_reply_no");
		String reply_content = reply.getParameter("reply_content");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			//TODO : 수정 시간 반영하기 (sysdate)
			String sql = "update blog_reply set reply_content=? where blog_reply_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply_content);
			pstmt.setInt(2, Integer.parseInt(blog_reply_no));
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("replyEdit 예외 : " + e.getMessage());
		} finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				
			}
		}
		
		return row;
	}
	
	//댓글 삭제
	public int replyDelete(int blog_reply_no) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			//String sql = "delete from blog_reply where blog_reply_no = ?";
			String sql = "update blog_reply set del = 1 where blog_reply_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blog_reply_no);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("replyDelete 예외 : " + e.getMessage());
		}finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
}
