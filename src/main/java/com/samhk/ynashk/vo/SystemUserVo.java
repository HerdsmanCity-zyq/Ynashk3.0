package com.samhk.ynashk.vo;

import lombok.Data;

import java.util.Date;

/**
 * SystemUserVo
 * @since 
 * @author 
 */
@Data
public class SystemUserVo extends BaseVo{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userCode; //用戶編號
	private String userId;//用戶賬號
	private String userName;//用户名
	private String loginPsw;
	private String loginNewPsw;
	private String loginCmfPsw;
	private String groupCode;
	private String roleCode;	//角色编号



	private String activeInd;
	private Date chgPwdDate;
	private int failedCount;
	private Date lastFailedDate;
	private String reqChangepwdInd;
	private String lock;
	
	private String branch;
	private String roleName;
	private String groupName;
	private SystemUserRoleVo userRoleVo;
	private String ticket;	//入场券？门票？
	private String ip;	//IP地址
	private String chgPwd;//是否改变密码


	private String effectDate; // 生效日期
	private String stopDate; 	// 停止日期
	/**
	 * 角色生效日期
	 */
	private String roleEffectDate;
	/**
	 * 角色停止日期
	 */
	private String roleStopDate;
	private String userStatus;
	private String isstaff;
	
	private String staff_status;
	
	private String yzLastUpDate;//zlj:编辑员工时判断是否已被修改
	private String staffCode;//用户编号 wyz
	private String position; // 職位
	private String chineseName; // 中文名字
	private String englishName; // 英文名字
	private String skype; // skype
	private String nickName; // 別稱
	private String email; //电邮
	private String telephoneNo; //电话号码
	private String wechat; //微信
	private String department;


}
