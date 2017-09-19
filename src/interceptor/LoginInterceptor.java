package interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import entities.Admin;

public class LoginInterceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8421114485365606291L;

	@Override
	protected String doIntercept(ActionInvocation invoker) throws Exception {
		Admin current = (Admin) ActionContext.getContext().getSession().get("current");
		if(null==current){
			return "toAdminLogin";
		} else {
			return invoker.invoke();
		}
	}

}
