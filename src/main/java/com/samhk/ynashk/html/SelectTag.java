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

public class SelectTag extends SimpleTagSupport implements DynamicAttributes {

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
        if (lockInput != null && lockInput.equals("N")) {
            writer.write("<div style=\"top:-13px;display:inline-block;\">");
        }
        writer.write("<select name='");
        writer.write(getName());
        writer.write("' ");
        if (getId() != null && !getId().equals("")) {
            writer.write("  id='");
            writer.write(getId());
            writer.write("' ");
        }
        //writer.write(" style=\"width:250px; height:32px; line-height:32px;display:none;\"  ");
        //set style
        if (lockInput != null && lockInput.equals("N")) {
            writer.write(" style=\"height:32px; width:" + getDIYSelectWidth() + ";line-height:32px;  display:none;\"  ");
            writer.write("DIYSelectWidth='" + getDIYSelectWidth());
            writer.write("' ");
        } else if (style != null) {
            writer.write(" style='" + style);
            writer.write("' ");
        }
        if (!StringUtils.isEmpty(getMultipleName())) {
            writer.write("multipleName='");
            writer.write(getMultipleName() + "_W" + System.currentTimeMillis() + Math.random());
            writer.write("' ");
        }
        if (!StringUtils.isEmpty(getWhere())) {
            writer.write("para='");
            writer.write(getWhere());
            writer.write("' ");
        }
	/*	if(onchange !=null){
			writer.write("onchange='");
		    writer.write(getOnchange());	
		    writer.write("' ");
		}*/
        StringBuffer values = new StringBuffer();
        writer.write(attributes.toString());
        writer.write(" >");
        for (int i = 0; i < key.size(); i++) {
            if (null != key.get(i)) {
                if (!StringUtils.isEmpty(this.multipleName)
                        && !StringUtils.isEmpty(value)
                        && getValue().toString().contains(",")
                        && getValue().toString().contains(key.get(i))) {
                    values.append(value.get(i)).append(",");
                }
                writer.write("<option value='");
                writer.write(key.get(i));
                writer.write("'");
                if (getValue().toString().equals(key.get(i)))
                    writer.write("selected='selected'");
                writer.write(">");
                writer.write(value.get(i));
                writer.write("</option>");
            }
        }
        if (!StringUtils.isEmpty(this.multipleName)
                && !StringUtils.isEmpty(value)
                && getValue().toString().contains(",")) {
            writer.write("<option value='");
            writer.write(getValue().toString());
            writer.write("' multiple='");
            writer.write(getMultipleName());
            writer.write("' selected='selected' ");
            writer.write(">");
            writer.write(values.delete(values.length() - 1, values.length()).toString());
            writer.write("</option>");
        }
        writer.write("</select>");
        if (lockInput != null && lockInput.equals("N")) {
            //int test = Integer.parseInt(style.split(":")[1].split(";")[0].replace("px",""));
            int test = Integer.parseInt(getDIYSelectWidth().replace("px", ""));

            //onchange=\"setSelectP(this.value,'"+id+"');\"
            writer.write("<input name=\"box\" id=\"box" + id + "\" autocomplete=\"off\" style=\" width:" + getDIYSelectWidth() + ";height:24px; display:inline-block; float:left;\"");
            writer.write("  onfocus=\"showAllItems('" + id + "',this);\"");
            //writer.write("onblur=\"selectDefault(this.value,'"+id+"',this);\" ");
            //onpropertychange=\"alert('b');setSelectP(this.value,'"+id+"');\"
            writer.write("oninput=\"setSelectP(this.value,'" + id + "',this);\" ");
            //writer.write("onkeypress=\"setSelectP(this.value,'"+id+"');\"");
            writer.write(" />");
            writer.write("<span onclick=\"showOrhide('" + id + "',this);\" style=\"width:19px;height:24px; display:inline-block; float:left; background-image: url(img/down1.png);background-repeat: no-repeat;background-position:center; background-color:#fff;\"></span>");
            writer.write("<div style=\" width:" + getDIYSelectWidth() + ";height:20px;display:none; z-index:1;left:0px;top:0px;filter:alpha(opacity=70);opacity:0.7;background:url('img/loadingForSave.gif') center center no-repeat;background-color:#fff;position:absolute;\"> </div>");
            writer.write("</div>");
        }
        writer.flush();
    }

    @Override
    public void setDynamicAttribute(String arg0, String arg1, Object arg2) throws JspException {
        attributes.append(" ").append(arg1).append("='").append(arg2.toString()).append("' ");
    }

    private String multipleName;

    private Object value;
    private String plsSelectText;
    private String dropdownName;
    private String name;
    private String where;
    public String onchange;
    private String id;
    private String lockInput;
    private String style;
    private String DIYSelectWidth;

    public String getDIYSelectWidth() {
        return DIYSelectWidth;
    }

    public void setDIYSelectWidth(String dIYSelectWidth) {
        DIYSelectWidth = dIYSelectWidth;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getLockInput() {
        return lockInput;
    }

    public void setLockInput(String lockInput) {
        this.lockInput = lockInput;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Object getValue() {
        return value == null ? "0" : value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlsSelectText() {
        return plsSelectText;
    }

    public String getDropdownName() {
        return dropdownName;
    }

    public void setPlsSelectText(String plsSelectText) {
        this.plsSelectText = plsSelectText;
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

    public String getMultipleName() {
        return multipleName;
    }

    public void setMultipleName(String multipleName) {
        this.multipleName = multipleName;
    }

    public String getOnchange() {
        return onchange;
    }

    public void setOnchange(String onchange) {
        this.onchange = onchange;
    }


}

