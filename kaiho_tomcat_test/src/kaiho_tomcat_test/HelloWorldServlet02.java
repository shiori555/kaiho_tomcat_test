/**
 * @author shiori-o
 * 検索用Servlet
 */
package kaiho_tomcat_test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class HelloWorldServlet02
 */
@WebServlet("/HelloWorldServlet02")
public class HelloWorldServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HelloWorldServlet02() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=Shift_JIS");
		request.setCharacterEncoding("Shift_JIS");

		// データソース情報の取得
		Context context = null;
		DataSource ds = null;
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/postgres");
		} catch (NamingException e) {
			e.printStackTrace();
			response.getWriter().append(e.toString());
			return;
		}
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		/*
		 * 呼び出し元jspから値取得
		 */

		String id = request.getParameter("id"); //id格納用変数
		String sname = request.getParameter("sname"); //sname格納用変数

		/*
		 * SQL
		 */

		try {
			// コネクション取得
			conn = ds.getConnection();

			//自動コミットオフ
			conn.setAutoCommit(false);

			stmt = conn.createStatement();

			//SELECTの実行
			String sql = ("SELECT * FROM test01 WHERE to_char(id, 'FM0000') LIKE '%"+id+"%' OR sname LIKE '%"+ sname +"%';");


			rset = stmt.executeQuery(sql);

			//arrayListで一覧表示
			List<HelloWorldBean> list = new ArrayList<HelloWorldBean>();

			//SELECT結果の受け取り
			while (rset.next()) {
				id = rset.getString("id");
				sname = rset.getString("sname");
				list.add(new HelloWorldBean(id, sname));
			}

			/*
			 * 呼び出し先jspに渡す値をセット
			 * Listを渡すにはどうするか
			 */
			request.setAttribute("list", list);

			/*
			 * 呼び出し先jspにページ遷移
			 */

			RequestDispatcher dispatch = request.getRequestDispatcher("SList.jsp");
			dispatch.forward(request, response);
			conn.commit();

		} catch (SQLException e) {
			System.out.println("SQLException:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("Exception:" + e.getMessage());
		} finally {
			try {
				if (rset != null)
					rset.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
