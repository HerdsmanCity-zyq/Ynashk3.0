package com.samhk.ynashk.service;

import com.samhk.ynashk.vo.FrameworkProjectPafVo;

import java.util.List;

public interface SearchProjectPafBo {
    /**
     * 获取检视项目PAF列表
     *
     * @return
     */
    List<FrameworkProjectPafVo> getAllProjectPaf();
}
