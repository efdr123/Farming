package DAOImpl;

import java.util.List;

import org.hibernate.criterion.Example;

import DAO.adminDAO;

import entities.Admin;

public class adminDAOImpl extends CommonDaoImpl implements adminDAO {

	@Override
	public int login(Admin admin) {
		Integer auth = null;
		try {
			String hql = "From Admin Where username=? And password=?";
			Admin count = (Admin) getSession().createQuery(hql)
					.setParameter(0, admin.getUsername())
					.setParameter(1, admin.getPassword()).uniqueResult();
			this.getTransaction().commit();
			if (count != null)
				auth = count.getAuth();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return auth;
	}

	@Override
	public boolean register(Admin admin) {
		return false;
	}

	@Override
	public void saveOrUpdate(Admin t) {
		try {
			this.getSession().saveOrUpdate(t);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
	}

	@Override
	public void delete(int id) {
		try {
			Admin admin = new Admin();
			admin.setId(id);
			this.getSession().delete(admin);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> query() {
		List<Admin> all = null;
		try {
			all = this.getSession().createQuery("From Admin Order By id desc")
					.list();
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return all;
	}

	@Override
	public Admin query(int id) {
		Admin admin = null;
		try {
			admin = (Admin) this.getSession().get(Admin.class, id);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return admin;
	}

	@Override
	public Admin query(Admin t) {
		Admin adminRtn = null;
		try {
			adminRtn = (Admin) this.getSession().createCriteria(Admin.class)
					.add(Example.create(t)).uniqueResult();
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return adminRtn;
	}

}
