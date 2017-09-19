package action;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import factory.DAOFactory;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 7922979648150320921L;

	private Admin admin; // ��̨�û�ʵ����

	private JSONObject jsonObject; // JSON����
	private String jsonString; // �洢json�ķ���ֵ
	
	/* Getter Setter���� */
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
	/* end of Getter Setter ���� */

	/* ��¼��֤ */
	public String login() throws Exception {
		jsonObject = new JSONObject(); // new JSON����
		// ����DAOimpl��login���������û����������ȷ��
		Integer auth = DAOFactory.getAdminDAOInstance().login(admin);
		if (auth!=null) {
			// ����ɹ�����json
			jsonObject.put("loginJSON", "success");
			ActionContext.getContext().getSession().put("current", admin);
		} else {
			// ʧ��Ҳ����json
			jsonObject.put("loginJSON", "failed");
		}
		ActionContext.getContext().getSession().put("auth", auth);
		// ����string
		jsonString = jsonObject.toString();
		return SUCCESS; // ������Ϣ
	}
	
	public String logout(){
		ActionContext.getContext().getSession().put("current", null);
		return "toAdminLogin";
	}

}
