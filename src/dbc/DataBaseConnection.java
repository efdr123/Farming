package dbc;

import java.sql.*;

public class DataBaseConnection {
	private Connection con = null; // 数据库连接，默认值为空

	/**
	 * 功能说明：返回一个数据库的连接。如果要达到对数据库连接统一控制的目的，此处需要设为静态方法。
	 * 参数列表：无
	 * 作者：吕宽
	 * 修改日期：2016-10-20
	 */
	
	public Connection getConn() {
		
		try {
			// 加载驱动程序
			Class.forName("com.mysql.jdbc.Driver");
			// 获得数据连接
			con = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/myweb?useUnicode=true&characterEncoding=utf8",
							"root", "123456");
		} catch (Exception e1) {
			// 捕获异常
			e1.printStackTrace();
		}
		return con;
	}

	public void close() {
		try {
			// 关闭数据连接
			con.close();
		} catch (SQLException e) {
			// 捕获异常
			e.printStackTrace();
		}
	}
}
