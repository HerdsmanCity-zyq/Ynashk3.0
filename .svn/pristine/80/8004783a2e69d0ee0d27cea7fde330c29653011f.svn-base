package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import com.samhk.ynashk.vo.PafVisioVersionVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PafVisioVersionDao {

    /**
     *
     * @param
     * @return
     */
     List<PafVisioVersionVo> getPafVisioVersionVoAll();

     List<PafVisioVersionVo> getVisioVersionAll();

    /**
     * 根据 pafId,projectId,pafVisioVersion条件修改数据
     * @param pafVisioVersionVo
     */
    void updatePafVisioVersion(PafVisioVersionVo pafVisioVersionVo);

    /**
     * 根据pafId,projectId,pafVisioVersion条件查询CodeBy
     * @param pafVisioVersionVo
     * @return
     */
    PafVisioVersionVo selectCodeByAndAssignBy(PafVisioVersionVo pafVisioVersionVo);

    PafVisioVersionVo getPafVisioVersionByVo(PafVisioVersionVo pafVisioVersionVo);

    /**
     * 保存Paf_Visio_Version 的数据
     * @param pafVisioVersionVo
     */
    void insertPafVisioVersion(PafVisioVersionVo pafVisioVersionVo);


    PafVisioVersionVo queryPafVisioVersionIsExist(@Param("projectId") Integer projectId, @Param("pafId") String pafId, @Param("pafVisioVersion") String pafVisioVersion);


    Integer updatePafVisioVersionBy(PafVisioVersionVo pafVisioVersionVo);


    String getLUDByIds(PafVisioVersionVo vo);

    List<FrameworkVersionPafVO> getAllFVPByProject();

    List<Map> test();

    String getLatestVisioVersion(@Param("projectId") Integer projectId, @Param("pafId") String pafId);

    /**
     * 新增PAF提交的update
     * @param pafVisioVersionVo
     */
    void updatePafVisioVersionBySubmit(PafVisioVersionVo pafVisioVersionVo);

    List<PafVisioVersionVo> findAllByProjectIdAndPafId(@Param("projectId") Integer projectId, @Param("pafId") String pafId);

    Boolean deleteOnePAFEdition(@Param("projectId") Integer projectId, @Param("pafId") String pafId, @Param("pafVisioVersion") String pafVisioVersion);

}
