package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.VersionsVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VersionsDao {

    /**
     * 根據frameworkId獲取版本號
     * @param frameworkId
     * @return
     */
    List<VersionsVo> findByFrameworkId(String frameworkId);

    /**
     * 獲取當前paf的版本號
     * @param frameworkId
     * @param versionId
     * @return
     */
    VersionsVo getCurrentVersionId(@Param("frameworkId") String frameworkId, @Param("versionId") int versionId);
    VersionsVo checkVesionUnique(VersionsVo vo);


    public VersionsVo getMaxVersionByFraId(VersionsVo vo);
    public Integer inserNewVersion(VersionsVo vo);
    List<VersionsVo> getVersionVoAll();
}
