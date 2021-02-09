package com.etoile.app.crawling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.etoile.app.vo.ProductVO;

public class ProductDAO {
	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.36:1521:xe";
	private String user = "hr";
	private String password = "hr";
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private String INSERT = "insert into product(product_id, product_name, product_type, product_image, product_rental) values (p_seq.nextval, ?, ?, ?, ?)";
	
	public int insert(ArrayList<ProductVO> list) {
		int n = 0;
		
		try {
		for (ProductVO vo : list) {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getProductName());
			psmt.setString(2, vo.getProductType());
			psmt.setString(3, vo.getProductImage());
			psmt.setInt(4, vo.getProductRental());
			
			n = psmt.executeUpdate();
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
		
		
	}
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ProductDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
