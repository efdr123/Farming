package DAO;

import entities.Admin;

public interface adminDAO extends CommonDao<Admin> {
	// ��¼��֤
	public int login(Admin admin);
	// ע��
	public boolean register(Admin admin);
}
