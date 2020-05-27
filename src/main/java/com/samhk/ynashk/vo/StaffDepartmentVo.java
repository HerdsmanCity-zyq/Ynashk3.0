package com.samhk.ynashk.vo;


import lombok.Data;

@Data
public class StaffDepartmentVo extends BaseVo{

	private String departmentId;
	private String departmentChiName;
	private String departmentEngName;
	private String departmentStatus;
}
