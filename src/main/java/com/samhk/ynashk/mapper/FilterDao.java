package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.FilterVo;
import org.apache.ibatis.annotations.Param;

public interface FilterDao {

    /**
     * 根据url和cru查询filterData
     * @param url
     * @param cru
     * @return
     */
    String findFilterDataByUrlAndCru(@Param("url")String url,@Param("cru")String cru);

    /**
     * 存储filterData
     * @param filterVo
     * @return
     */
    Integer saveFilterData(FilterVo filterVo);


    /**
     * 根据url和cru更新filter
     * @param vo
     * @return
     */
    Integer updateFilterDataByUrlAndCru(FilterVo vo);
}
