package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.PafAttachmentVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PafAttachmentDao {

    /**
     * 插入文件数据
     * @param vo
     * @return
     */
    int insertPafAttachment(PafAttachmentVo vo);

    /**
     * 根据联合主键查找数据最后一位paAttachmentId
     * @param vo
     * @return
     */
    Integer selectIdByFrameworkIdAndVersionsIdAndPafId(PafAttachmentVo vo);

    /**
     * 根据联合主键查找数据
     * @param vo
     * @return
     */
    PafAttachmentVo selectByCompositeKeys(PafAttachmentVo vo);

    /**
     * 根据联合主键更新数据
     * @param pafAttachmentVo
     * @return
     */
    Integer updatePafAttachment(PafAttachmentVo pafAttachmentVo);

    /**
     * 根据联合主键更新描述
     * @param pafAttachmentVo
     * @return
     */
    Integer updatePafAttachmentDesc(PafAttachmentVo pafAttachmentVo);

    /**
     * 根据
     * @param frameworkId
     * @param pafId
     * @param versionsId
     * @return
     */
    List<PafAttachmentVo> findAllByCompositeKeys(@Param("frameworkId") String frameworkId,@Param("pafId") String pafId, @Param("versionsId") Integer versionsId);

    /**
     * 根据四个联合主键删除数据
     * @param vo
     * @return
     */
    Integer delByCompositeKeys(@Param("frameworkId") String frameworkId,@Param("pafId") String pafId, @Param("versionsId") Integer versionsId,@Param("pafAttachmentId")Integer pafAttachmentId);
}
