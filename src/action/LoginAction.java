package action;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import factory.DAOFactory;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 7922979648150320921L;

	private Admin admin; // 后台用户实体类

	private JSONObject jsonObject; // JSON对象
	private String jsonString; // 存储json的返回值
	
	/* Getter Setter方法 */
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

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	/* end of Getter Setter 方法 */

	/* 登录验证 */
	public String login() throws Exception {
		jsonObject = new JSONObject(); // new JSON对象
		// 调用DAOimpl的login方法检验用户名密码的正确性
		Integer auth = DAOFactory.getAdminDAOInstance().login(admin);
		if (auth!=null) {
			// 检验成功存入json
			jsonObject.put("loginJSON", "success");
			ActionContext.getContext().getSession().put("current", admin);
		} else {
			// 失败也存入json
			jsonObject.put("loginJSON", "failed");
		}
		ActionContext.getContext().getSession().put("auth", auth);
		// 放入string
		jsonString = jsonObject.toString();
		return SUCCESS; // 返回信息
	}
	
	public String logout(){
		ActionContext.getContext().getSession().put("current", null);
		return "toAdminLogin";
	}

}
