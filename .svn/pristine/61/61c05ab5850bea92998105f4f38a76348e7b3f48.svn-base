package com.samhk.ynashk.controller.tableFilter;

import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.FilterVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
public class FilterAction {

    @PostMapping("saveFilterData.do")
    public String saveFilterData(HttpServletRequest request, @RequestBody Map map) {
        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute(Constants.LOGUSER);
        FilterVo vo  =  new FilterVo();
        vo.setCru(user.getUserId());
        vo.setFilterData((String) map.get("filterMap"));
        vo.setUrl((String) map.get("url"));
        return vo.getUrl();
    }
}
