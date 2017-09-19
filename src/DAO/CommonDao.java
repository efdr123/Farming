package DAO;

import java.util.List;

public interface CommonDao<T> {
	public void saveOrUpdate(T t);

	public void delete(int id);

	public List<T> query();

	public T query(int id);

	public T query(T t);
}
