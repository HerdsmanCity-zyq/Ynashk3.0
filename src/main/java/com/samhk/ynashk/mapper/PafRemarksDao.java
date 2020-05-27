package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.PafRemarksVo;

import java.util.List;

public interface PafRemarksDao {

    /**
     * 查找全部备注
     * @return
     */
    List<PafRemarksVo> findAllPafRemarksVo();
}
