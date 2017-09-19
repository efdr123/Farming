package entities;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "product", catalog = "farming")
public class Product extends AbstractProduct implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(String name, String img, String descri, Float price,
			Integer stock) {
		super(name, img, descri, price, stock);
	}

}
