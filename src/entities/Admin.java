package entities;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "admin", catalog = "farming")
public class Admin extends AbstractAdmin implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String username, String password, Integer auth) {
		super(username, password, auth);
	}

	/** full constructor */
	public Admin(String username, String password, String MId, Integer auth) {
		super(username, password, MId, auth);
	}

}
