package DAO;

import java.util.List;

import entities.Product;

public interface productDAO extends CommonDao<Product> {
	public List<Product> getThree();
}
