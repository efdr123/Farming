package entities;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "comment", catalog = "farming")
public class Comment extends AbstractComment implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(String name, String content) {
		super(name, content);
	}

}
