package entities;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Member entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "member", catalog = "farming")
public class Member extends AbstractMember implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Member() {
	}

	/** minimal constructor */
	public Member(String idCard) {
		super(idCard);
	}

	/** full constructor */
	public Member(String idCard, String name, String selfi, String descri) {
		super(idCard, name, selfi, descri);
	}

}
