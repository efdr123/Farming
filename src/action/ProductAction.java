package action;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import entities.Product;
import factory.DAOFactory;

public class ProductAction extends ActionSupport {
	private static final long serialVersionUID = 5869750282398096044L;

	private List<Product> products; // 商品实体类列表
	private Product product; // 商品实体类
	private int id; // 商品id
	private File file;
	private int toolbar1[];

	public int[] getToolbar1() {
		return toolbar1;
	}

	public void setToolbar1(int[] toolbar1) {
		this.toolbar1 = toolbar1;
	}

	/* Getter Setter */
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/* end of Getter Setter */

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	// 查询全部(struts)
	// public String productList() throws Exception {
	// products = DAOFactory.getProductDAOInstance().list();
	// return "productList";
	// }
	// 查询全部（json）
	public String getList() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html; charset=utf-8");
		products = DAOFactory.getProductDAOInstance().query();
		JSONArray jsonArray = new JSONArray();
		for (Product pro : products) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("id", pro.getId());
			jsonObj.put("name", pro.getName());
			jsonObj.put("img", pro.getImg());
			jsonObj.put("descri", pro.getDescri());
			jsonObj.put("price", pro.getPrice());
			jsonObj.put("stock", pro.getStock());
			jsonArray.add(jsonObj);
		}
		PrintWriter pWriter = ServletActionContext.getResponse().getWriter();
		pWriter.print(jsonArray.toString());
		return null;
	}
	
	public String getThree() throws Exception {
		ServletActionContext.getResponse().setContentType(
				"text/html; charset=utf-8");
		products = DAOFactory.getProductDAOInstance().getThree();
		JSONArray jsonArray = new JSONArray();
		for (Product pro : products) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("id", pro.getId());
			jsonObj.put("name", pro.getName());
			jsonObj.put("price", pro.getPrice());
			jsonArray.add(jsonObj);
		}
		PrintWriter pWriter = ServletActionContext.getResponse().getWriter();
		pWriter.print(jsonArray.toString());
		return null;
	}

	// 删除
	public String productDelete() throws Exception {
		DAOFactory.getProductDAOInstance().delete(id);
		return "productDelete";
	}
	
	public String productDeleteMore() throws Exception {
		for (int i = 0; i < toolbar1.length; i++) {
			DAOFactory.getProductDAOInstance().delete(toolbar1[i]);
		}
		return "productDeleteMore";
	}

	// 新增或修改数据
	public String productSOU() throws Exception {
		if(product.getId()==-1)
			product.setId(null);
		String filename = getRandomFileName();
		if(file!=null){
			filename+=".png";
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			FileUtils.copyFile(file, new File(path,filename));
			product.setImg(filename);
		}
		DAOFactory.getProductDAOInstance().saveOrUpdate(product);
		return "productSOU";
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
}
