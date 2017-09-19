package action;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import entities.Member;
import factory.DAOFactory;

public class MemberAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6854064843230160879L;
	private List<Member> members;
	private Member member;
	private int id;
	private File file;

	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
	public List<Member> getList() throws Exception{
		ServletActionContext.getResponse().setContentType(
				"text/html; charset=utf-8");
		members = DAOFactory.getMemberDAOInstance().query();
		JSONArray jsonArray = new JSONArray();
		for (Member meb : members) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("id", meb.getId());
			jsonObj.put("idCard", meb.getIdCard());
			jsonObj.put("name", meb.getName());
			jsonObj.put("selfi", meb.getSelfi());
			jsonObj.put("descri", meb.getDescri());
			jsonArray.add(jsonObj);
		}
		PrintWriter pWriter = ServletActionContext.getResponse().getWriter();
		pWriter.print(jsonArray.toString());
		return null;
	}
	
	public List<Member> getFour() throws Exception{
		ServletActionContext.getResponse().setContentType(
				"text/html; charset=utf-8");
		members = DAOFactory.getMemberDAOInstance().getFour();
		JSONArray jsonArray = new JSONArray();
		for (Member meb : members) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("name", meb.getName());
			jsonObj.put("selfi", meb.getSelfi());
			jsonObj.put("descri", meb.getDescri());
			jsonArray.add(jsonObj);
		}
		PrintWriter pWriter = ServletActionContext.getResponse().getWriter();
		pWriter.print(jsonArray.toString());
		return null;
	}
	
	public String memberDelete() throws Exception {
		DAOFactory.getMemberDAOInstance().delete(id);
		return "memberDelete";
	}
	
	// 新增或修改数据
	public String memberSOU() throws Exception {
		String filename = getRandomFileName();
		if(file!=null){
			filename+=".png";
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			FileUtils.copyFile(file, new File(path,filename));
			member.setSelfi(filename);
		}
		if(member.getId()==-1){
			member.setIdCard(getRandomIdCard());
			member.setId(null);
		}
		System.out.println(member.getId());
		DAOFactory.getMemberDAOInstance().saveOrUpdate(member);
		return "memberSOU";
	}

	public static String getRandomFileName() {

		SimpleDateFormat simpleDateFormat;

		simpleDateFormat = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String str = simpleDateFormat.format(date);

		Random random = new Random();

		int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;// 获取5位随机数

		return rannum + str;// 当前时间
	}
	
	public static String getRandomIdCard() {

		SimpleDateFormat simpleDateFormat;

		simpleDateFormat = new SimpleDateFormat("yyMMddHHmmss");

		Date date = new Date();

		String str = simpleDateFormat.format(date);

		Random random = new Random();

		int rannum = (int) (random.nextDouble() * (9999 - 1000 + 1)) + 1000;// 获取5位随机数

		return str + rannum;// 当前时间
	}
}
