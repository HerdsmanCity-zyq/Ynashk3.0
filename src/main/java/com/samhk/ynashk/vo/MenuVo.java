package com.samhk.ynashk.vo;


import java.io.Serializable;
import java.util.List;

public class MenuVo implements Comparable<MenuVo>,Serializable {

	private String menuCode;
	private String menuName;
	private String parentMenuCode;
	private Integer menuWidth;
	private String accessible_ind;
	private Integer displayOrder;
	private String objectName;
	private String resident_div;
	private String functionCode;
	private int childrenCount;
	
	private List<FunctionVo> functionList;
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode==null ? menuCode :menuCode.trim();
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getParentMenuCode() {
		return parentMenuCode;
	}
	public void setParentMenuCode(String parentMenuCode) {
		this.parentMenuCode = parentMenuCode;
	}
	public Integer getMenuWidth() {
		return menuWidth;
	}
	public void setMenuWidth(Integer menuWidth) {
		this.menuWidth = menuWidth;
	}
	public String getAccessible_ind() {
		return accessible_ind;
	}
	public void setAccessible_ind(String accessible_ind) {
		this.accessible_ind = accessible_ind;
	}
	public Integer getDisplayOrder() {
		return displayOrder;
	}
	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}
	public String getObjectName() {
		return objectName;
	}
	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}
	@Override
	public int compareTo(MenuVo arg0) {
		return this.getDisplayOrder().compareTo(arg0.getDisplayOrder());
	}
	
	public String getResident_div() {
		return resident_div;
	}
	public void setResident_div(String resident_div) {
		this.resident_div = resident_div;
	}
	@Override
	public String toString() {
		return "menuCode="+menuCode+";menuName="+menuName+";objectName="+objectName+";resident_div="+resident_div;
	}
	public String getFunctionCode() {
		return functionCode;
	}
	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}
	public List<FunctionVo> getFunctionList() {
		return functionList;
	}
	public void setFunctionList(List<FunctionVo> functionList) {
		this.functionList = functionList;
	}
	public int getChildrenCount() {
		return childrenCount;
	}
	public void setChildrenCount(int childrenCount) {
		this.childrenCount = childrenCount;
	}
	
	
}
