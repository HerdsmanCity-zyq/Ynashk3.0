package com.samhk.ynashk.html;

import org.springframework.util.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public class SelectDataListTag extends SimpleTagSupport implements DynamicAttributes {

    private StringBuffer attributes = new StringBuffer("");

    @Override
    public void doTag() throws JspException, IOException {
        List<String> key = new ArrayList<>(100);
        List<String> value = new ArrayList<>(100);
        PageContext context = (PageContext) getJspContext();
        OptionService optionService = (OptionService) WebApplicationContextUtils.getWebApplicationContext(context.getServletContext()).getBean("optionService");
        key.add("0");
        //value.add(Constants.getText("message.common.00",Constants.getText(getPlsSelectText()).replaceAll("[:：]+", "")));
        value.add(" ");
        optionService.getDataSources(dropdownName, key, value, getWhere());
        Writer writer = context.getOut();
        writer.write("<datalist id=\"");
        writer.write(getId());
        writer.write("\" > ");

        for (int i = 0; i < key.size(); i++) {
            if (null != key.get(i)) {
                writer.write("<option value='");
                writer.write(value.get(i));
                writer.write("'/>");
            }
        }
        writer.write("</datalist>");
    }

    @Override
    public void setDynamicAttribute(String arg0, String arg1, Object arg2) throws JspException {
        attributes.append(" ").append(arg1).append("='").append(arg2.toString()).append("' ");
    }

    private String id;
    private String dropdownName;
    private String where;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getDropdownName() {
        return dropdownName;
    }
    public void setDropdownName(String dropdownName) {
        this.dropdownName = dropdownName;
    }
    public String getWhere() {
        return where;
    }
    public void setWhere(String where) {
        this.where = where;
    }
}
