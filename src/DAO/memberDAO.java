package DAO;

import java.util.List;

import entities.Member;

public interface memberDAO extends CommonDao<Member>  {
	// ����ҳ����ѯ�ĸ�
	public List<Member> getFour() throws Exception;
}
