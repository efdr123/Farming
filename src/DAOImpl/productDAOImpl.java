package DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Example;

import DAO.productDAO;

import entities.Product;

public class productDAOImpl extends CommonDaoImpl implements productDAO {

	@SuppressWarnings("unchecked")
	public List<Product> getThree(){
		List<Product> all = null;
		List<Product> three = new ArrayList<Product>();
		try {
			all = this.getSession()
					.createQuery("From Product").list();
			for (int i = 0; i < 3; i++) {
				int rand = (int)(Math.random()*(all.size()-i));
				three.add(all.get(rand));
				all.set(rand, all.get(all.size()-i-1));
			}
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return three;
	}
	
	@Override
	public void saveOrUpdate(Product t) {
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
			Product Product = new Product();
			Product.setId(id);
			this.getSession().delete(Product);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> query() {
		List<Product> all = null;
		try {
			all = this.getSession()
					.createQuery("From Product Order By id desc").list();
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return all;
	}

	@Override
	public Product query(int id) {
		Product pro = null;
		try {
			pro = (Product) this.getSession().get(Product.class, id);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return pro;
	}

	@Override
	public Product query(Product t) {
		Product pror = null;
		try {
			pror = (Product) this.getSession().createCriteria(Product.class)
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
