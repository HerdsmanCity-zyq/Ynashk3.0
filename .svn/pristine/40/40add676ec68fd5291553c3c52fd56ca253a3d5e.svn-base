package com.samhk.ynashk.html;



import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.FunctionControlVo;
import com.samhk.ynashk.vo.FunctionVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.Writer;
import java.util.List;

public class ButtonTag extends SimpleTagSupport implements DynamicAttributes{
	private static final Logger log = LoggerFactory.getLogger(ButtonTag.class);
	//tag property
	protected String dim = null;
	private String btnName = null;
	private String altKey;
	private String accessControl;
	private String id;
	//tag event
	private String onclick;
	public String getDim() {
		return dim;
	}
	public void setDim(String dim) {
		this.dim = dim;
	}
	public String getBtnName() {
		return btnName;
	}
	public void setBtnName(String btnName) {
		this.btnName = btnName;
	}
	public String getAltKey() {
		return altKey;
	}
	public void setAltKey(String altKey) {
		this.altKey = altKey;
	}
	public String getAccessControl() {
		return accessControl;
	}
	public void setAccessControl(String accessControl) {
		this.accessControl = accessControl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOnclick() {
		return onclick;
	}
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
	private StringBuffer attr = new StringBuffer("");


	@Override
	public void doTag() throws JspException, IOException {
		PageContext context = (PageContext)getJspContext();
		Writer writer = context.getOut();

		/*writer.write("<input");
		setAttribute(writer, "type","button");
		setAttribute(writer, "value",Constants.getText(getAltKey()));
		setAttribute(writer, "onclick", getOnclick());
		setAttribute(writer, "id", getId());
		setAttribute(writer, "data-accessControl", getAccessControl());
		setAttribute(writer, "data-btnName", getBtnName());
		setAttribute(writer, "data-dim", getDim());
		if(attr.indexOf("class")<0){
			setAttribute(writer, "class", "btn");
		}
		writer.write(attr.toString());
		writer.write(" />");*/


		writer.write("<input");
		setAttribute(writer, "type","button");
		setAttribute(writer, "id", getId());
		setAttribute(writer, "data-btnName", getBtnName());
//		System.out.println(Constants.getObject(Constants.REQUESTCONTEXT));
		if(null!=altKey&&!"".equals(altKey)){
			setAttribute(writer, "value", Constants.getText(getAltKey()));
		}
		writer.write(attr.toString());

		if(btnName !=null){
			if("Y".equals(dim)){
				setAttribute(writer, "class", "btn after"); //class
				writer.write("\" >");
			}else{
				if("N".equals(accessControl)){
					setAttribute(writer,"class", "btn");//class
					setAttribute(writer,"onclick",onclick);
					writer.write("\" >");
				}else{
					//button accessable

					boolean accessable = false;

					String myURI = ((HttpServletRequest)Constants.getObject(Constants.REQUEST)).getAttribute("URI").toString();

					myURI =	myURI.substring(myURI.lastIndexOf("/")+1,myURI.indexOf(".", myURI.lastIndexOf("/"))).concat(".do");

					SystemUserVo systemUserVo =(SystemUserVo)Constants.getSession().getAttribute(Constants.LOGUSER);

					List<FunctionVo> functionVoList = systemUserVo.getUserRoleVo().getFunctionList();
					if(null!=functionVoList&&functionVoList.size()>0){
						flag:for(FunctionVo fuv:functionVoList){
							if(myURI.equals(fuv.getObjectName()) && fuv.getFunctionControlList()!=null && fuv.getFunctionControlList().size()>0 ){
								for(FunctionControlVo fcVo : fuv.getFunctionControlList()){
									if(btnName.equals(fcVo.getControlObject())&& "Y".equalsIgnoreCase(fcVo.getAccessible_ind())){
										accessable = true;
										break flag;
									}
								}
							}
						}
					}

					if(accessable){
						setAttribute(writer,"class","btn");//class
						setAttribute(writer, "onclick",onclick);
						writer.write("\" >");
					}else{
						setAttribute(writer,"class", "btn after");//class
						writer.write("\" >");
					}

				}
			}
		}else{
			setAttribute(writer, "class", "btn");//class
			if(onclick !=null){
				setAttribute(writer,"onclick",onclick);
			}
			writer.write("\" >");
		}



	}
	public void setDynamicAttribute(String arg0, String arg1, Object arg2) throws JspException {
		if("class".equals(arg1)){
			if(arg2.toString().contains("nobd")){//图标
				arg2=arg2.toString();
			}else{
				arg2=arg2.toString()+" btn";
			}
		}
		attr.append(" ").append(arg1).append("=\"").append(arg2).append("\"");
	}
	private void setAttribute(Writer writer,String name,String value) throws IOException{
		if(!StringUtils.isEmpty(value)){
			writer.write(" ");
			writer.write(name);
			writer.write("=\"");
			writer.write(value);
			writer.write("\" ");
		}
	}
}
