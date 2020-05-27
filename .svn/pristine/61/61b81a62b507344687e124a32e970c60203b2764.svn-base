package com.samhk.ynashk.service;

import com.samhk.ynashk.vo.PafVisioVersionVo;

import java.util.List;

public interface NewPafAssignBo {

    /**
     * 根据Status查詢數據
     * @param type assign(分派) submit(提交)
     * @return
     */
    List<PafVisioVersionVo> getPafVisioVersionVoAllByStatus(String type);

    /**
     * 查詢PafVisioVersionVo 中的版本信息
     * @param type assign(PAF分派)，submit(PAF提交)
     * @return
     */
    List<PafVisioVersionVo> getVisioVersionAllByType(String type);

    /**
     * 根据 pafId,projectId,pafVisioVersion条件修改数据
     * @param pafVisioVersionVo
     */
    void updatePafVisioVersionByAssign(PafVisioVersionVo pafVisioVersionVo);

    /**
     * 根据 pafId,projectId,pafVisioVersion条件查詢数据
     * @param vo
     * @return
     */
    PafVisioVersionVo getPafVisioVersionByVo(PafVisioVersionVo vo);

    void updatePafVisioVersionBySubmit(PafVisioVersionVo pafVisioVersionVo);
}
