package com.samhk.ynashk.controller.paf_code;

import com.google.gson.Gson;
import com.samhk.ynashk.mapper.SelectDownDao;
import com.samhk.ynashk.service.NewPafAssignBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.PafVisioVersionVo;
import com.samhk.ynashk.vo.ProjectPafVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/")
public class NewPafSubmitAction {

    @Resource
    private NewPafAssignBo newPafAssignBo;

    @Resource
    private SelectDownDao selectDownDao;

    @RequestMapping("newPafSubmit.do")
    public String goPafSubmit(Model model, PafVisioVersionVo vo){
        List<PafVisioVersionVo> pafVisioVersionVoList = newPafAssignBo.getPafVisioVersionVoAllByStatus("submit");
        Constants.getRequest().setAttribute("pafVisioVersionVoList", pafVisioVersionVoList);
        Constants.getRequest().setAttribute("pafVisioVersionVoListJson", new Gson().toJson(pafVisioVersionVoList));
        Constants.getRequest().setAttribute("visioVersionAll", new Gson().toJson(newPafAssignBo.getVisioVersionAllByType("submit")));
        List<ProjectPafVo> projectPafVoList = selectDownDao.getProjectPafAll();
        Constants.getRequest().setAttribute("projectDataList", projectPafVoList);
        Constants.getRequest().setAttribute("projectDataListJson", new Gson().toJson(projectPafVoList));

        if (vo.getPafId() !=null && vo.getProjectId() !=null && vo.getPafVisioVersion() !=null){
            PafVisioVersionVo visioVersionByVo = newPafAssignBo.getPafVisioVersionByVo(vo);
            model.addAttribute("pafVisioVersionVo",visioVersionByVo);
        }

        return "paf_code/newPafSubmit";
    }

    @RequestMapping(value = "newPafSubmit.do",params = {"action=update"})
    @ResponseBody
    public boolean updateSubmitData(PafVisioVersionVo pafVisioVersionVo){
        try {
            newPafAssignBo.updatePafVisioVersionBySubmit(pafVisioVersionVo);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
