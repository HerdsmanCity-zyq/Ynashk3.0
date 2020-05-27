package com.samhk.ynashk.service.impl.paf_code;

import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.NewPafAssignBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service("newPafAssignImpl")
public class NewPafAssignImpl implements NewPafAssignBo {

    @Resource
    private PafVisioVersionDao pafVisioVersionDao;

    @Override
    public List<PafVisioVersionVo> getPafVisioVersionVoAllByStatus(String type) {
        List<PafVisioVersionVo> list = new ArrayList<>();
        List<PafVisioVersionVo> pafVisioVersionVos = pafVisioVersionDao.getPafVisioVersionVoAll();
        for (PafVisioVersionVo vo : pafVisioVersionVos) {
            if (type.equals("assign") && vo.getStatus() !=null && (vo.getStatus().equals("確認設計") || vo.getStatus().equals("已分派")
                    || vo.getStatus().equals("已編碼") || vo.getStatus().equals("編碼中") || vo.getStatus().equals("已提交"))){
                list.add(vo);
            }
            if (type.equals("submit") && vo.getStatus() !=null && (vo.getStatus().equals("已分派")
                    || vo.getStatus().equals("已編碼") || vo.getStatus().equals("編碼中") || vo.getStatus().equals("已提交"))){
                list.add(vo);
            }
            vo.setEnglishName(vo.getEnglishName()!=null && vo.getEnglishName().length()==0?vo.getChineseName():vo.getEnglishName());
        }
        return list;
    }

    @Override
    public List<PafVisioVersionVo> getVisioVersionAllByType(String type) {
        List<PafVisioVersionVo> vo = new ArrayList<>();
        for (PafVisioVersionVo v : pafVisioVersionDao.getVisioVersionAll()) {
            if(type.equals("assign") && v.getStatus() !=null && (v.getStatus().equals("確認設計") || v.getStatus().equals("已分派")
                    || v.getStatus().equals("已編碼") || v.getStatus().equals("編碼中") || v.getStatus().equals("已提交"))){
                vo.add(v);
            }
            if (type.equals("submit") && v.getStatus() !=null && (v.getStatus().equals("已分派")
                    || v.getStatus().equals("已編碼") || v.getStatus().equals("編碼中") || v.getStatus().equals("已提交"))){
                vo.add(v);
            }
            v.setEnglishName(v.getEnglishName()!=null && v.getEnglishName().length()==0?v.getChineseName():v.getEnglishName());
        }
        return vo;
    }

    @Override
    @Transactional
    public void updatePafVisioVersionByAssign(PafVisioVersionVo pafVisioVersionVo) {
        SystemUserVo user=(SystemUserVo) Constants.getSession().getAttribute("currUser");
        pafVisioVersionVo.setLuu(user.getUserCode());
        PafVisioVersionVo vo = pafVisioVersionDao.selectCodeByAndAssignBy(pafVisioVersionVo);
        pafVisioVersionVo.setCodeTo(vo.getCodeBy()==null?pafVisioVersionVo.getCodeBy():vo.getCodeBy());
        pafVisioVersionVo.setAssignTo(vo.getAssignBy()==null?pafVisioVersionVo.getAssignBy():vo.getAssignBy());
        pafVisioVersionDao.updatePafVisioVersion(pafVisioVersionVo);
    }

    @Override
    public PafVisioVersionVo getPafVisioVersionByVo(PafVisioVersionVo vo) {
        PafVisioVersionVo v = pafVisioVersionDao.getPafVisioVersionByVo(vo);
        v.setEnglishName(v.getEnglishName()!=null && v.getEnglishName().length()==0?v.getChineseName():v.getEnglishName());
        return v;
    }

    @Override
    @Transactional
    public void updatePafVisioVersionBySubmit(PafVisioVersionVo pafVisioVersionVo) {
        SystemUserVo user=(SystemUserVo) Constants.getSession().getAttribute("currUser");
        pafVisioVersionVo.setLuu(user.getUserCode());
        PafVisioVersionVo vo = pafVisioVersionDao.selectCodeByAndAssignBy(pafVisioVersionVo);
        pafVisioVersionDao.updatePafVisioVersionBySubmit(pafVisioVersionVo);
    }
}
