package com.samhk.ynashk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class MultipleSelectAction {

	@RequestMapping("multipleSelected.do")
	public String exection(String multiple, String values, String para, HttpServletRequest request){
		
		request.setAttribute("multiple", multiple.split("_W")[0]);
		request.setAttribute("values", values);
		request.setAttribute("para", para);
		
		return "multipleSelect";
	}
}
