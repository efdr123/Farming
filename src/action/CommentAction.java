package action;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import entities.Comment;
import factory.DAOFactory;

public class CommentAction extends ActionSupport {
	private static final long serialVersionUID = 4527927082595036701L;

	private List<Comment> comments;
	private Comment comment;
	private int id;

	private JSONObject jsonObject; // JSON对象
	private String jsonString; // 存储json的返回值

	public JSONObject getJsonObject() {
		return jsonObject;
	}

	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}

	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Comment> getList() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html; charset=utf-8");
		comments = DAOFactory.getCommentDAOInstance().query();
		JSONArray jsonArray = new JSONArray();
		for (Comment comm : comments) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("id", comm.getId());
			jsonObj.put("name", comm.getName());
			jsonObj.put("content", comm.getContent());
			jsonArray.add(jsonObj);
		}
		PrintWriter pWriter = ServletActionContext.getResponse().getWriter();
		pWriter.print(jsonArray.toString());
		return null;
	}

	public String update() throws Exception {
		ServletActionContext.getResponse().setContentType("text/html; charset=utf-8");
		DAOFactory.getCommentDAOInstance().saveOrUpdate(comment);
		return SUCCESS; // 返回信息
	}

}
