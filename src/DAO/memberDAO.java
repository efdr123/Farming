package DAO;

import java.util.List;

import entities.Member;

public interface memberDAO extends CommonDao<Member>  {
	// （首页）查询四个
	public List<Member> getFour() throws Exception;
}
