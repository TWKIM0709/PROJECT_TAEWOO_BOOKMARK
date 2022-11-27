package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosa.dto.Book;
import kr.or.kosa.dto.Book_Recommend;
import kr.or.kosa.dto.Book_Reply;
import kr.or.kosa.utils.ConnectionHelper;

public class BookDao implements BookMarkDao{
	
	//책 전체조회
	public List<Book> BookAlllist(int cpage, int pagesize){
		List<Book> booklist = new ArrayList<Book>();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			//sql = "select a.isbn as isbn, book_name, description, price, book_filename, b.file_name as file_name from book a left join ebook b on a.isbn = b.isbn";
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from (select rownum, a.isbn as isbn, author, book_name, description, price, book_filename, b.file_name as file_name from "
					+ "book a left join ebook b on a.isbn=b.isbn where rownum<=?)where rownum >=?";
			pstmt = conn.prepareStatement(sql);
			
			int start = cpage * pagesize-(pagesize-1);
			int end = cpage*pagesize;
			System.out.println("sql : " + sql + " / start, end : " + start + " " + end);
			pstmt.setInt(2, start);
			pstmt.setInt(1, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book book = new Book();
				book.setIsbn(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBook_name(rs.getString(4));
				book.setDescription(rs.getString(5));
				book.setPrice(rs.getInt(6));
				book.setBook_filename(rs.getString(7));
				if(rs.getString(8) != null) {
					book.setFile_name(rs.getString(8));
				}
				
				booklist.add(book);
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
		System.out.println(booklist);
		return booklist;
	}
	//책 전체 count
	public int BookListCount() {
		int count = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select count(*) cnt from book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
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
		
		return count;
	}
	//책 like조회
	public List<Book> BookLikeList(String bookname, int cpage, int pagesize){
		List<Book> booklike = new ArrayList<Book>();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from (select rownum, a.isbn as isbn, author, book_name, description, price, book_filename, b.file_name as file_name from "
					+ "book a left join ebook b on a.isbn=b.isbn where rownum<=?)where rownum >=? and book_name like ?";
			pstmt = conn.prepareStatement(sql);
			int start = cpage * pagesize-(pagesize-1);
			int end = cpage*pagesize;
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			pstmt.setString(3,  "%"+bookname+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book book = new Book();
				book.setIsbn(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setBook_name(rs.getString(4));
				book.setDescription(rs.getString(5));
				book.setPrice(rs.getInt(6));
				book.setBook_filename(rs.getString(7));
				if(rs.getString(7) != null) {
					book.setFile_name(rs.getString(8));
				}
				
				booklike.add(book);
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
		
		return booklike;
	}
	//책 like 카운트 조회
	public int BooklikeListCount(String bookname) {
		int count = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select count(*) cnt from book where book_name like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  "%"+bookname+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
	//책 추가
	public int InsertBook(Book book) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into book(isbn, author, book_name, description, price, book_filename) values(?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getIsbn());
			pstmt.setString(2, book.getAuthor());
			pstmt.setString(3, book.getBook_name());
			pstmt.setString(4, book.getDescription());
			pstmt.setInt(5, book.getPrice());
			pstmt.setString(6, book.getBook_filename());
			
			row = pstmt.executeUpdate();
			
			if(book.getFile_name() != null) {
				sql = "insert into ebook(isbn, file_name) values(?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book.getIsbn());
				pstmt.setString(2, book.getFile_name());
				if(pstmt.executeUpdate() > 0) {
					row += 1;
				}
			}
			
			if(row>0) {
				conn.commit();
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return row;
	}
	//책 수정
	public int UpdateBook(Book book) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			conn.setAutoCommit(false);
			sql = "update book set book_name=?, author=?, description=?, price=?, book_filename=? where isbn=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBook_name());
			pstmt.setString(2, book.getAuthor());
			pstmt.setString(3, book.getDescription());
			pstmt.setInt(4, book.getPrice());
			pstmt.setString(5, book.getBook_filename());
			pstmt.setString(6, book.getIsbn());
			
			row = pstmt.executeUpdate();
			
			if(book.getFile_name() != null) {
				sql = "update ebook set file_name=? where isbn=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book.getFile_name());
				pstmt.setString(2, book.getIsbn());
				
				if(pstmt.executeUpdate() > 0) {
					row +=1;
				}
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return row;
	}
	//책 삭제
	public int DeleteBook(String isbn) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "delete from book where isbn=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			
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
	//책 상세
	public Book getBookListByIsbn(String isbn) {
		Book book = new Book();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select book_name, author, description, price, book_filename, b.file_name as file_name from book a left join ebook b on a.isbn=b.isbn where a.isbn=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book.setIsbn(isbn);
				book.setBook_name(rs.getString(1));
				book.setAuthor(rs.getString(2));
				book.setDescription(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setBook_filename(rs.getString(5));
				book.setFile_name(rs.getString(6));
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
		
		return book;
	}
	//책 댓글 전체조회
	public List<Book_Reply> Book_ReplyIsbnList(String isbn){
		List<Book_Reply> brl = new ArrayList<Book_Reply>();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select book_reply_no, to_char(reply_date) as re_date, reply_content, id from book_reply where isbn= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(1);
				Book_Reply br = new Book_Reply();
				
				br.setBook_reply_no(rs.getInt(1));
				br.setReply_date(rs.getString(2));
				br.setReply_content(rs.getString(3));
				br.setId(rs.getString(4));
				
				brl.add(br);
			}
			System.out.println(brl);
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
		
		return brl;
	}
	
	//관리자용 책 댓글 전체조회
		public List<Book_Reply> Book_ReplyAllList(){
			List<Book_Reply> brl = new ArrayList<Book_Reply>();
			Connection conn = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			try {
				conn = ConnectionHelper.getConnection("oracle");
				sql = "select book_reply_no, reply_date, reply_content, id, isbn from book_reply";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Book_Reply br = new Book_Reply();
					
					br.setBook_reply_no(rs.getInt(1));
					br.setReply_date(rs.getString(2));
					br.setReply_content(rs.getString(3));
					br.setId(rs.getString(4));
					br.setIsbn(rs.getString(5));
					
					brl.add(br);
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
			
			return brl;
		}
		
	//책 댓글 like조회
	public List<Book_Reply> Book_ReplyLikeList(String id){
		List<Book_Reply> brl = new ArrayList<Book_Reply>();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select book_reply_no, reply_date, reply_content, isbn from book_reply where id like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+id+'%');
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book_Reply br = new Book_Reply();
				br.setBook_reply_no(rs.getInt(1));
				br.setIsbn(rs.getString(2));
				br.setReply_date(rs.getString(3));
				br.setReply_content(rs.getString(4));
				br.setId(id);
				
				brl.add(br);
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
		
		return brl;
	}
	//책 댓글쓰기
	public int InsertBook_Reply(Book_Reply br) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into book_reply(book_reply_no, isbn, reply_content, id)" +
				  "values(book_reply_no_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, br.getIsbn());
			pstmt.setString(2, br.getReply_content());
			pstmt.setString(3, br.getId());
			
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
	//책 댓글 수정
	public int UpdateBook_Reply(Book_Reply br) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update book_reply set reply_date=sysdate, reply_content=? where book_reply_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, br.getReply_content());
			pstmt.setInt(2, br.getBook_reply_no());
			
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
	//책 댓글 삭제
	public int DeleteBook_Reply(int no) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "delete book_reply where book_reply_no = ?";
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
	
	//책 좋아요 추가
	public int Book_Like(String isbn, String id) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select id, isbn from book_like where isbn=? and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "delete from book_like where isbn=? and id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, isbn);
				pstmt.setString(2, id);
				
				if(pstmt.executeUpdate() > 0) {
					row = 1;
				}else {
					row = -1;
				}
			}else {
				sql = "insert into book_like(isbn, id, like_date) values(?,?,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, isbn);
				pstmt.setString(2, id);
				
				if(pstmt.executeUpdate() > 0) {
					row = 2;
				}else {
					row = -1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return row;
	}
	//책 좋아요 여부 
	public int Book_Likestatus(String isbn, String id) {
		int result = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from book_like where isbn = ? and id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else {
				result = -1;
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
		return result;
	}
	//책 좋아요 갯수
	public int Book_LikeCount(String isbn) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select nvl(count(*),0) from book_like where isbn=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionHelper.close(pstmt);
				ConnectionHelper.close(rs);
				ConnectionHelper.close(conn);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return row;
	}
	//좋아요 순 순위 조회
	public List<Book> RankBook_Like(String startdate, String enddate){
		List<Book> hmr = new ArrayList<Book>();
		System.out.println(startdate + "/" +enddate);
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs1 = null;
		try {
			con = ConnectionHelper.getConnection("oracle");
			String sql = "select rownum, isbn from (select isbn, count(isbn) as likecount from book_like where like_date between ? and ? group by isbn order by 2 desc) where rownum between 0 and 10";
			ps = con.prepareStatement(sql);
			ps.setString(1, startdate);
			ps.setString(2, enddate);
			rs1 = ps.executeQuery();
			while(rs1.next()) {
				Book book = getBookListByIsbn(rs1.getString(2));
				//book.setIsbn(rs.getString(2));
				System.out.println(book);
				hmr.add(book);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("like조회 터짐" + e.getMessage());
		}finally {
			System.out.println("finally ㅇ");
			ConnectionHelper.close(ps);
			ConnectionHelper.close(rs1);
			ConnectionHelper.close(con);
		}
		System.out.println("함수끝 ");
		return hmr;
	}
	//e-book리스트 조회
	public List<Book> EbookList(String id){
		List<Book> ebl = new ArrayList<Book>();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select a.isbn as isbn, book_name, description, price, book_filename, b.file_name as file_name from book a join ebook b on a.isbn = b.isbn where isbn in (select isbn from ebook_list where id = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book book = new Book();
				book.setIsbn(rs.getString(1));
				book.setBook_name(rs.getString(2));
				book.setDescription(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setBook_filename(rs.getString(5));
				book.setFile_name(rs.getString(6));
				
				ebl.add(book);
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
		
		return ebl;
	}
	//e-book리스트 추가
	public int InsertEbookList(String isbn, String id) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into ebook_list(id, isbn) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setString(2, id);
			
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
	
	 //e-book리스트 전체 조회
	   public List<String> getAllEbookList(){
	      List<String> isbnlist = new ArrayList<String>();
	      Connection conn = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs =null;
	      try {
	         conn = ConnectionHelper.getConnection("oracle");
	         sql = "select isbn from ebook";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            isbnlist.add(rs.getString("isbn"));
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
	      return isbnlist;
	   }

	
	//추천 책 추가
	public int InsertBook_Recommend(String isbn, String recommend_content) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into book_recommend(isbn, recommend_content) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setString(2, recommend_content);
			
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
	//추천 책 삭제
	public int DeleteBook_Recommend(String isbn) {
		int row = 0;
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "delete book_recommend where isbn=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			
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
	//추천책 리스트 조회
	public List<Book_Recommend> Book_RecommendList(){
		List<Book_Recommend> bl = new ArrayList<Book_Recommend>();
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select a.isbn as isbn, book_name, description, price, book_filename, b.recommend_content as recommend_content from book a join book_recommend b on a.isbn = b.isbn";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book book = new Book();
				book.setIsbn(rs.getString(1));
				book.setBook_name(rs.getString(2));
				book.setDescription(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setBook_filename(rs.getString(5));
				
				Book_Recommend br = new Book_Recommend(book, rs.getString(6));
				bl.add(br);
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
		
		return bl;
	}
	//책 매출 순위조회
	public List<Book> SellBookList(String start, String end){
		List<Book> hmr = new ArrayList<Book>();
		Connection con = null;
		ResultSet rs1 = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionHelper.getConnection("oracle");
			String sql = "select a.isbn, count(b.isbn) as likecount from book a join book_payment b on a.isbn=b.isbn where payment_date between ? and ? group by a.isbn order by 2 desc";
			ps = con.prepareStatement(sql);
			ps.setString(1, start);
			ps.setString(2, end);
			
			rs1 = ps.executeQuery();
			
			while(rs1.next()) {
					Book book = getBookListByIsbn(rs1.getString(1));
					hmr.add(book);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				ConnectionHelper.close(rs1);
				ConnectionHelper.close(ps);
				ConnectionHelper.close(con);
		}
		
		return hmr;
	}
}
