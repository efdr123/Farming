package factory;

import entities.Comment;
import DAO.CommonDao;
import DAO.adminDAO;
import DAO.memberDAO;
import DAO.productDAO;
import DAOImpl.adminDAOImpl;
import DAOImpl.commentDAOImpl;
import DAOImpl.memberDAOImpl;
import DAOImpl.productDAOImpl;

public class DAOFactory {
	public static adminDAO getAdminDAOInstance() {
		return new adminDAOImpl();
	}

	public static productDAO getProductDAOInstance() {
		return new productDAOImpl();
	}

	public static memberDAO getMemberDAOInstance() {
		return new memberDAOImpl();
	}

	public static CommonDao<Comment> getCommentDAOInstance() {
		return new commentDAOImpl();
	}
}
