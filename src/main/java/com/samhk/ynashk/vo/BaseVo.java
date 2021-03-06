package com.samhk.ynashk.vo;



import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.util.DateTimeUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.Date;


public class BaseVo implements Serializable{

	private String cru;
	private String luu;
	protected String orderBy = null;
	protected String order = null;
	private Date crd;
	private Date lud;
	private String userGroup;
	public String getCreated_user() {
		if(StringUtils.isEmpty(cru) && !ObjectUtils.isEmpty(Constants.getSession())){
			return ((SystemUserVo)Constants.getSession().getAttribute(Constants.LOGUSER)).getUserCode();
		}
		return cru;
	}

	public String getLast_upd_user() {
		if(StringUtils.isEmpty(luu) && !ObjectUtils.isEmpty(Constants.getSession())){
			return ((SystemUserVo)Constants.getSession().getAttribute(Constants.LOGUSER)).getUserCode();
		}
		return luu;
	}

	public void setData4Value(String userId){
		this.cru = userId;
		this.crd = DateTimeUtils.getCurrentLocalDateTimeAsDate();
		this.luu = userId;
		this.lud = DateTimeUtils.getCurrentLocalDateTimeAsDate();
	}

	public void setData2Value(String userId){
		this.luu = userId;
		this.lud = DateTimeUtils.getCurrentLocalDateTimeAsDate();
	}

	public String getCru() {
		return cru;
	}

	public void setCru(String cru) {
		this.cru = cru;
	}

	public String getLuu() {
		return luu;
	}

	public void setLuu(String luu) {
		this.luu = luu;
	}

	public Date getCrd() {
		return crd;
	}

	public void setCrd(Date crd) {
		this.crd = crd;
	}

	public Date getLud() {
		return lud;
	}

	public void setLud(Date lud) {
		this.lud = lud;
	}


	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getUserGroup() {
		return userGroup;
	}
	public void setUserGroup(String userGroup) {
		this.userGroup = userGroup;
	}
}
