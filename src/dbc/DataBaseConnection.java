package dbc;

import java.sql.*;

public class DataBaseConnection {
	private Connection con = null; // ���ݿ����ӣ�Ĭ��ֵΪ��

	/**
	 * ����˵��������һ�����ݿ�����ӡ����Ҫ�ﵽ�����ݿ�����ͳһ���Ƶ�Ŀ�ģ��˴���Ҫ��Ϊ��̬������
	 * �����б���
	 * ���ߣ�����
	 * �޸����ڣ�2016-10-20
	 */
	
	public Connection getConn() {
		
		try {
			// ������������
			Class.forName("com.mysql.jdbc.Driver");
			// �����������
			con = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/myweb?useUnicode=true&characterEncoding=utf8",
							"root", "123456");
		} catch (Exception e1) {
			// �����쳣
			e1.printStackTrace();
		}
		return con;
	}

	public void close() {
		try {
			// �ر���������
			con.close();
		} catch (SQLException e) {
			// �����쳣
			e.printStackTrace();
		}
	}
}
