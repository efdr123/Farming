package entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * AbstractAdmin entity provides the base persistence definition of the Admin
 * entity. @author MyEclipse Persistence Tools
 */
@MappedSuperclass
public abstract class AbstractAdmin implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String MId;
	private Integer auth;

	// Constructors

	/** default constructor */
	public AbstractAdmin() {
	}

	/** minimal constructor */
	public AbstractAdmin(String username, String password, Integer auth) {
		this.username = username;
		this.password = password;
		this.auth = auth;
	}

	/** full constructor */
	public AbstractAdmin(String username, String password, String MId,
			Integer auth) {
		this.username = username;
		this.password = password;
		this.MId = MId;
		this.auth = auth;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username", nullable = false, length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "m_id", length = 16)
	public String getMId() {
		return this.MId;
	}

	public void setMId(String MId) {
		this.MId = MId;
	}

	@Column(name = "auth", nullable = false)
	public Integer getAuth() {
		return this.auth;
	}

	public void setAuth(Integer auth) {
		this.auth = auth;
	}

}