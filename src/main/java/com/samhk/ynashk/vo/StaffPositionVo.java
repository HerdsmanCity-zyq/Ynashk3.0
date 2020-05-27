package com.samhk.ynashk.vo;

import lombok.Data;

@Data
public class StaffPositionVo extends BaseVo {

	private String positionId;
	private String departmentId;
	private String positionChiName;
	private String positionEngName;
	private String positionStatus;
}
