/**
 * @author shiori-o
 * �����pServlet
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

		// �f�[�^�\�[�X���̎擾
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
		 * �Ăяo����jsp����l�擾
		 */

		String id = request.getParameter("id"); //id�i�[�p�ϐ�
		String sname = request.getParameter("sname"); //sname�i�[�p�ϐ�

		/*
		 * SQL
		 */

		try {
			// �R�l�N�V�����擾
			conn = ds.getConnection();

			//�����R�~�b�g�I�t
			conn.setAutoCommit(false);

			stmt = conn.createStatement();

			//SELECT�̎��s
			String sql = ("SELECT * FROM test01 WHERE to_char(id, 'FM0000') LIKE '%"+id+"%' OR sname LIKE '%"+ sname +"%';");


			rset = stmt.executeQuery(sql);

			//arrayList�ňꗗ�\��
			List<HelloWorldBean> list = new ArrayList<HelloWorldBean>();

			//SELECT���ʂ̎󂯎��
			while (rset.next()) {
				id = rset.getString("id");
				sname = rset.getString("sname");
				list.add(new HelloWorldBean(id, sname));
			}

			/*
			 * �Ăяo����jsp�ɓn���l���Z�b�g
			 * List��n���ɂ͂ǂ����邩
			 */
			request.setAttribute("list", list);

			/*
			 * �Ăяo����jsp�Ƀy�[�W�J��
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
