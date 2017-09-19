package DAOImpl;

import java.util.List;

import org.hibernate.criterion.Example;

import entities.Comment;
import DAO.CommonDao;

public class commentDAOImpl extends CommonDaoImpl implements CommonDao<Comment> {

	@Override
	public void saveOrUpdate(Comment t) {
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
		// ²»ÐèÒªÉ¾³ý
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> query() {
		List<Comment> all = null;
		try {
			all = this.getSession().createQuery("From Comment")
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
	public Comment query(int id) {
		Comment comm = null;
		try {
			comm = (Comment) this.getSession().get(Comment.class, id);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return comm;
	}

	@Override
	public Comment query(Comment t) {
		Comment pror = null;
		try {
			pror = (Comment) this.getSession().createCriteria(Comment.class)
					.add(Example.create(t)).uniqueResult();
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return pror;
	}

}
