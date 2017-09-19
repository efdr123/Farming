package DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Example;

import entities.Member;
import DAO.memberDAO;

public class memberDAOImpl extends CommonDaoImpl implements memberDAO {

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Member> getFour() throws Exception {
		List<Member> all = null;
		List<Member> four = new ArrayList<Member>();
		try {
			all = this.getSession()
					.createQuery("From Member").list();
			for (int i = 0; i < 4; i++) {
				int rand = (int)(Math.random()*(all.size()-i));
				four.add(all.get(rand));
				all.set(rand, all.get(all.size()-i-1));
			}
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return four;
	}

	@Override
	public void saveOrUpdate(Member t) {
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
			Member member = new Member();
			member.setId(id);
			this.getSession().delete(member);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> query() {
		List<Member> all = null;
		try {
			all = this.getSession()
					.createQuery("From Member Order By id desc").list();
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return all;
	}

	@Override
	public Member query(int id) {
		Member pro = null;
		try {
			pro = (Member) this.getSession().get(Member.class, id);
			this.getTransaction().commit();
		} catch (Exception e) {
			this.getTransaction().rollback();
		} finally {
			closeSession();
		}
		return pro;
	}

	@Override
	public Member query(Member t) {
		Member pror = null;
		try {
			pror = (Member) this.getSession().createCriteria(Member.class)
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
