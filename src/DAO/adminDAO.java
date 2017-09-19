package DAO;

import entities.Admin;

public interface adminDAO extends CommonDao<Admin> {
	// µÇÂ¼ÑéÖ¤
	public int login(Admin admin);
	// ×¢²á
	public boolean register(Admin admin);
}
