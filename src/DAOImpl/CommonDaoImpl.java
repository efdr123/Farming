package DAOImpl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.HibernateSessionFactory;

public class CommonDaoImpl {
	private Session session;
	private Transaction transaction;

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

	public CommonDaoImpl() {
		session=HibernateSessionFactory.getSession();
		transaction=session.beginTransaction();
	}

	public void closeSession(){
		HibernateSessionFactory.closeSession();
	}
	
}
