package entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * AbstractMember entity provides the base persistence definition of the Member
 * entity. @author MyEclipse Persistence Tools
 */
@MappedSuperclass
public abstract class AbstractMember implements java.io.Serializable {

	// Fields

	private Integer id;
	private String idCard;
	private String name;
	private String selfi;
	private String descri;

	// Constructors

	/** default constructor */
	public AbstractMember() {
	}

	/** minimal constructor */
	public AbstractMember(String idCard) {
		this.idCard = idCard;
	}

	/** full constructor */
	public AbstractMember(String idCard, String name, String selfi,
			String descri) {
		this.idCard = idCard;
		this.name = name;
		this.selfi = selfi;
		this.descri = descri;
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

	@Column(name = "idCard", unique = true, nullable = false, length = 16)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "selfi", length = 100)
	public String getSelfi() {
		return this.selfi;
	}

	public void setSelfi(String selfi) {
		this.selfi = selfi;
	}

	@Column(name = "descri", length = 65535)
	public String getDescri() {
		return this.descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

}