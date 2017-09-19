package entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * AbstractProduct entity provides the base persistence definition of the
 * Product entity. @author MyEclipse Persistence Tools
 */
@MappedSuperclass
public abstract class AbstractProduct implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String img;
	private String descri;
	private Float price;
	private Integer stock;

	// Constructors

	/** default constructor */
	public AbstractProduct() {
	}

	/** full constructor */
	public AbstractProduct(String name, String img, String descri, Float price,
			Integer stock) {
		this.name = name;
		this.img = img;
		this.descri = descri;
		this.price = price;
		this.stock = stock;
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

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "img", length = 100)
	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Column(name = "descri", length = 100)
	public String getDescri() {
		return this.descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	@Column(name = "price", precision = 11)
	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Column(name = "stock")
	public Integer getStock() {
		return this.stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

}